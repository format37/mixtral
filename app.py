from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from hqq.engine.hf import HQQModelForCausalLM, AutoTokenizer
import logging
from typing import List, Optional

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

logger.info("Starting up..")
app = FastAPI()

#Optional
logger.info("Setting backend...")
from hqq.core.quantize import *
HQQLinear.set_backend(HQQBackend.PYTORCH_COMPILE) 

#Load the model
# model_id = './models/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/'
model_id = './models/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-2bit_g16_s128-HQQ/'

logger.info("Loading tokenizer...")
tokenizer = AutoTokenizer.from_pretrained(model_id, use_fast=True)
logger.info("Loading model...")
model     = HQQModelForCausalLM.from_quantized(model_id)


class ChatMessage(BaseModel):
    role: str = Field(..., description="Role of the message sender (e.g., 'user', 'assistant', 'system')")
    content: Optional[str] = Field(None, description="Content of the message")


class ChatRequest(BaseModel):
    chats: List[ChatMessage]
    max_new_tokens: int = Field(1000, description="Maximum new tokens to be generated")
    skip_special_tokens: bool = Field(True, description="Whether to skip special tokens in generation")
    temperature: float = Field(0.7, description="The value used to module the next token probabilities")
    top_p: float = Field(0.95, description="If set to float < 1, only the most probable tokens with probabilities that add up to top_p or higher are kept for generation")
    top_k: int = Field(40, description="If set to int > 0, only the top k tokens are kept for generation")
    repetition_penalty: float = Field(1.1, description="The parameter for repetition penalty. 1.0 means no penalty. See this paper for more details")


class InstructRequest(BaseModel):
    instruct: str
    max_new_tokens: int = Field(1000, description="Maximum new tokens to be generated")
    skip_special_tokens: bool = Field(True, description="Whether to skip special tokens in generation")
    temperature: float = Field(0.7, description="The value used to module the next token probabilities")
    top_p: float = Field(0.95, description="If set to float < 1, only the most probable tokens with probabilities that add up to top_p or higher are kept for generation")
    top_k: int = Field(40, description="If set to int > 0, only the top k tokens are kept for generation")
    repetition_penalty: float = Field(1.1, description="The parameter for repetition penalty. 1.0 means no penalty. See this paper for more details")


class ServerResponse(BaseModel):
    response: str


@app.post("/instruct", response_model=ServerResponse)
async def http_post_request(request: InstructRequest):
    logger.info("# Instruct")
    #Text Generation
    logger.info("Generating text...")
    # prompt = "<s>[INST]You are helpful assistant[/INST]\nUser: What is the capital of Britain?\nAssistant:"
    inputs = tokenizer(request.instruct, return_tensors="pt", add_special_tokens=False)
    # outputs = model.generate(**(inputs.to('cuda')), max_new_tokens=1000)
    outputs = model.generate(
        **(inputs.to('cuda')),
        max_new_tokens=request.max_new_tokens,
        temperature=request.temperature, 
        do_sample=True,
        top_p=request.top_p,
        top_k=request.top_k,
        repetition_penalty=request.repetition_penalty
    )
    # print(tokenizer.decode(outputs[0], skip_special_tokens=True))
    # logger.info(f"Generated text: {tokenizer.decode(outputs[0], skip_special_tokens=True)}")
    response = tokenizer.decode(outputs[0], skip_special_tokens=True)
    logger.info(f"Generated text length: {len(response)}")
    return {"response": response}


@app.post("/chat", response_model=ServerResponse)
async def http_post_request(request: ChatRequest):
    logger.info("# Chat")
    # logger.info(f"Received chats: {request.chats}")

    # Use the chats from the request
    chats = request.chats

    # Your chat template and history
    chat_template = "{% for message in messages %}{{ '' + message['role'] }}\n{% if message['content'] is not none %}{{ message['content'] }}\n{% endif %}{% endfor %}"
    tokenizer.chat_template = chat_template

    prompt = tokenizer.apply_chat_template(chats, tokenize=False)

    
    # Generating the response
    logger.info("Tokenizing prompt...")
    input_ids = tokenizer(prompt, return_tensors='pt').input_ids.cuda()
    # Text Generation
    logger.info("Generating text...")
    output = model.generate(
        input_ids=input_ids,
        temperature=request.temperature, 
        do_sample=True,
        top_p=request.top_p,
        top_k=request.top_k,
        max_new_tokens=request.max_new_tokens,
        repetition_penalty=request.repetition_penalty
    )
    logger.info("Decoding text...")
    response = tokenizer.decode(output[0])
    # logger.info(f"Generated text: {response}")
    logger.info(f"Generated text length: {len(response)}")
    return {"response": response}


@app.get("/test")
async def test():
    return {"test": "ok"}
