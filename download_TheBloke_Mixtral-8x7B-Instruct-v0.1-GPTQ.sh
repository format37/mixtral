# create models directory if it doesn't exist
mkdir -p models
mkdir -p models/TheBloke

mkdir -p models/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ
wget https://huggingface.co/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/resolve/main/config.json
wget https://huggingface.co/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/resolve/main/generation_config.json
wget https://huggingface.co/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/resolve/main/model.safetensors
wget https://huggingface.co/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/resolve/main/quantize_config.json
wget https://huggingface.co/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/resolve/main/special_tokens_map.json
wget https://huggingface.co/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/resolve/main/tokenizer.json
wget https://huggingface.co/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/resolve/main/tokenizer.model
wget https://huggingface.co/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/resolve/main/tokenizer_config.json
mv config.json models/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/config.json
mv generation_config.json models/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/generation_config.json
mv model.safetensors models/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/model.safetensors
mv quantize_config.json models/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/quantize_config.json
mv special_tokens_map.json models/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/special_tokens_map.json
mv tokenizer.json models/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/tokenizer.json
mv tokenizer.model models/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/tokenizer.model
mv tokenizer_config.json models/TheBloke/Mixtral-8x7B-Instruct-v0.1-GPTQ/tokenizer_config.json
