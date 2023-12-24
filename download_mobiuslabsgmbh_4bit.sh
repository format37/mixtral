# create models directory if it doesn't exist
mkdir -p models
mkdir -p models/mobiuslabsgmbh

mkdir -p models/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ
wget https://huggingface.co/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/resolve/main/tokenizer.model
wget https://huggingface.co/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/resolve/main/qmodel.pt
wget https://huggingface.co/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/resolve/main/config.json
wget https://huggingface.co/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/resolve/main/special_tokens_map.json
wget https://huggingface.co/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/resolve/main/tokenizer.json
wget https://huggingface.co/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/resolve/main/tokenizer_config.json
mv tokenizer.model models/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/
mv qmodel.pt models/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/
mv config.json models/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/
mv special_tokens_map.json models/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/
mv tokenizer.json models/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/
mv tokenizer_config.json models/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-4bit_g64-HQQ/