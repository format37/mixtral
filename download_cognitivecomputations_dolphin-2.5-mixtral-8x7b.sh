# create models directory if it doesn't exist
mkdir -p models
mkdir -p models/cognitivecomputations
mkdir -p models/TheBloke/dolphin-2.5-mixtral-8x7b
mkdir -p models/TheBloke/dolphin-2.5-mixtral-8x7b/configs
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/added_tokens.json
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/config.json
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/generation_config.json
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00001-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00002-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00003-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00004-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00005-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00006-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00007-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00008-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00009-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00010-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00011-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00012-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00013-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00014-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00015-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00016-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00017-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00018-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model-00019-of-00019.bin
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/pytorch_model.bin.index.json
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/special_tokens_map.json
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/tokenizer.model
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/tokenizer_config.json
wget https://huggingface.co/cognitivecomputations/dolphin-2.5-mixtral-8x7b/resolve/main/configs/dolphin-mixtral-8x7b.yml
mv added_tokens.json models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/added_tokens.json
mv config.json models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/config.json
mv generation_config.json models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/generation_config.json
mv pytorch_model-00001-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00001-of-00019.bin
mv pytorch_model-00002-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00002-of-00019.bin
mv pytorch_model-00003-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00003-of-00019.bin
mv pytorch_model-00004-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00004-of-00019.bin
mv pytorch_model-00005-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00005-of-00019.bin
mv pytorch_model-00006-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00006-of-00019.bin
mv pytorch_model-00007-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00007-of-00019.bin
mv pytorch_model-00008-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00008-of-00019.bin
mv pytorch_model-00009-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00009-of-00019.bin
mv pytorch_model-00010-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00010-of-00019.bin
mv pytorch_model-00011-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00011-of-00019.bin
mv pytorch_model-00012-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00012-of-00019.bin
mv pytorch_model-00013-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00013-of-00019.bin
mv pytorch_model-00014-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00014-of-00019.bin
mv pytorch_model-00015-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00015-of-00019.bin
mv pytorch_model-00016-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00016-of-00019.bin
mv pytorch_model-00017-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00017-of-00019.bin
mv pytorch_model-00018-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00018-of-00019.bin
mv pytorch_model-00019-of-00019.bin models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model-00019-of-00019.bin
mv pytorch_model.bin.index.json models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/pytorch_model.bin.index.json
mv special_tokens_map.json models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/special_tokens_map.json
mv tokenizer.model models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/tokenizer.model
mv tokenizer_config.json models/cognitivecomputations/dolphin-2.5-mixtral-8x7b/tokenizer_config.json
mv configs/dolphin-mixtral-8x7b.yml models/TheBloke/dolphin-2.5-mixtral-8x7b/configs/dolphin-mixtral-8x7b.yml
