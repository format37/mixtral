from hqq.engine.hf import HQQModelForCausalLM, AutoTokenizer
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

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

#Text Generation
logger.info("Generating text...")
prompt = "<s> [INST] How do I build a car? [/INST] "
inputs = tokenizer(prompt, return_tensors="pt", add_special_tokens=False)
outputs = model.generate(**(inputs.to('cuda')), max_new_tokens=1000)
# print(tokenizer.decode(outputs[0], skip_special_tokens=True))
logger.info(f"Generated text: {tokenizer.decode(outputs[0], skip_special_tokens=True)}")
logger.info("Done!")