from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from hqq.engine.hf import HQQModelForCausalLM, AutoTokenizer
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

logger.info("Starting up..")
app = FastAPI()

#Optional
logger.info("Setting backend...")
from hqq.core.quantize import *
HQQLinear.set_backend(HQQBackend.PYTORCH_COMPILE) 

#Load the model
# model_id = './models/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ'
model_id = './models/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-2bit_g16_s128-HQQ/'

logger.info("Loading tokenizer...")
tokenizer = AutoTokenizer.from_pretrained(model_id)
logger.info("Loading model...")
model     = HQQModelForCausalLM.from_quantized(model_id)


class ChatRequest(BaseModel):
    text: str


class ChatResponse(BaseModel):
    response: str


@app.post("/chat", response_model=ChatResponse)
async def chat(request: ChatRequest):
    logger.info(f"Input text: {request.text}")
    prompt = f"<s> [INST] {request.text} [/INST] "    
    inputs = tokenizer(prompt, return_tensors="pt", add_special_tokens=False)
    
    #Text Generation
    logger.info("Generating text...")
    # outputs = model.generate(**(inputs.to('cuda')), max_new_tokens=1000)
    outputs = model.generate(**(inputs.to('cuda')), max_new_tokens=100)
    logger.info("Decoding text...")
    response = tokenizer.decode(outputs[0], skip_special_tokens=True)    
    logger.info(f"Generated text: {response}")
    return {"response": response}


@app.get("/health")
async def health():
    return {"health": "ok"}
