######################################################################################
 ######################################################################################
 ######################################################################################
 # ENGLISH TO FRENCH TRANSLATION MODEL
 ######################################################################################
 ######################################################################################
 ######################################################################################
 
 
 # PREPROCESS
 
 cd orig_seq2seq-con-trans/OpenNMT-py
 
 python -u preprocess.py\
     -train_src ../../data/kumarvon2018-data/fren/train.tok.true.en\
     -train_tgt ../../data/kumarvon2018-data/fren/train.tok.true.fr\
     -valid_src ../../data/kumarvon2018-data/fren/tst201314.tok.true.en\
     -valid_tgt ../../data/kumarvon2018-data/fren/tst201314.tok.true.fr\
     -save_data ../../dump/enfrvmf/vmf \
     -tgt_emb ../../embeddings/original.fasttext.fr \
     -src_vocab_size 50000\
     -tgt_vocab_size 50000\
     -src_seq_length 100\
     -tgt_seq_length 100 
 ######################################################################################
 
 
 # TRAIN
 
 cd orig_seq2seq-con-trans/OpenNMT-py
 
 python -u train.py\
     -data ../../dump/enfrvmf/vmf \
     -save_model ../../dump/enfrvmf/vmf \
     -layers 6\
     -rnn_size 512\
     -word_vec_size 512\
     -transformer_ff 1024\
     -heads 4\
     -warmup_init_lr 1e-8\
     -warmup_end_lr 0.00075\
     -min_lr 1e-9\
     -encoder_type transformer\
     -decoder_type transformer\
     -position_encoding\
     -train_steps 50000\
     -max_generator_batches 2\
     -dropout 0.1\
     -batch_size 4000\
     -batch_type tokens\
     -normalization tokens\
     -accum_count 2\
     -optim radam\
     -adam_beta2 0.9995\
     -decay_method linear\
     -weight_decay 0.00001\
     -warmup_steps 1\
     -learning_rate 1\
     -max_grad_norm 5.0\
     -param_init 0 \
     -param_init_glorot\
     -label_smoothing 0.1\
     -valid_steps 10000\
     -save_checkpoint_steps 10000\
     -world_size 1\
     -generator_function continuous-linear\
     -loss nllvmf\
     -share_decoder_embeddings\
     -generator_layer_norm\
     -lambda_vmf 0.2\
     -gpu_ranks 0
 ######################################################################################
 
 
 
 ######################################################################################
 ######################################################################################
 ######################################################################################
 # FRENCH TO ENGLISH TRANSLATION MODEL
 ######################################################################################
 ######################################################################################
 ######################################################################################
 
 # PREPROCESS
 
 cd orig_seq2seq-con-trans/OpenNMT-py
 
 python -u preprocess.py\
     -train_src ../../data/kumarvon2018-data/fren/train.tok.true.fr\
     -train_tgt ../../data/kumarvon2018-data/fren/train.tok.true.en\
     -valid_src ../../data/kumarvon2018-data/fren/tst201314.tok.true.fr\
     -valid_tgt ../../data/kumarvon2018-data/fren/tst201314.tok.true.en\
     -save_data ../../dump/frenvmf/vmf \
     -tgt_emb ../../embeddings/original.fasttext.txt \
     -src_vocab_size 50000\
     -tgt_vocab_size 50000\
     -src_seq_length 100\
     -tgt_seq_length 100 
 
 # TRAIN
 
 cd orig_seq2seq-con-trans/OpenNMT-py
 
 python -u train.py\
     -data ../../dump/frenvmf/vmf \
     -save_model ../../dump/frenvmf/vmf \
     -layers 6\
     -rnn_size 512\
     -word_vec_size 512\
     -transformer_ff 1024\
     -heads 4\
     -warmup_init_lr 1e-8\
     -warmup_end_lr 0.00075\
     -min_lr 1e-9\
     -encoder_type transformer\
     -decoder_type transformer\
     -position_encoding\
     -train_steps 50000\
     -max_generator_batches 2\
     -dropout 0.1\
     -batch_size 4000\
     -batch_type tokens\
     -normalization tokens\
     -accum_count 2\
     -optim radam\
     -adam_beta2 0.9995\
     -decay_method linear\
     -weight_decay 0.00001\
     -warmup_steps 1\
     -learning_rate 1\
     -max_grad_norm 5.0\
     -param_init 0 \
     -param_init_glorot\
     -label_smoothing 0.1\
     -valid_steps 10000\
     -save_checkpoint_steps 10000\
     -world_size 1\
     -generator_function continuous-linear\
     -loss nllvmf\
     -share_decoder_embeddings\
     -generator_layer_norm\
     -lambda_vmf 0.2\
     -gpu_ranks 0