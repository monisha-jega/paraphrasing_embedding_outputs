######################################################################################
 ######################################################################################
 ######################################################################################
 # WITH NOISY BIG AUTOENCODING DATA
 ######################################################################################
 ######################################################################################
 ######################################################################################
 
 
 # PREPROCESS
 
 cd seq2seq-con-trans/OpenNMT-py
 

 python -u preprocess.py\
     -train_src ../../data/en-fr-paraphrase-john/4knoisyfr/trans/train.shuffled.src\
     -train_tgt ../../data/en-fr-paraphrase-john/4knoisyfr/trans/train.shuffled.tgt\
     -valid_src ../../data/en-fr-paraphrase-john/trans/fr_fren-val.txt.tok.true.fr\
     -valid_tgt ../../data/en-fr-paraphrase-john/trans/fr_fren-val.txt.tok.true.fr\
     -save_data ../../dump/big_noisy_vmf_fr/vmf \
     -tgt_emb ../../embeddings/mapped.fasttext.both \
     -src_vocab_size 100000\
     -tgt_vocab_size 100000\
     -src_seq_length 100\
     -tgt_seq_length 100 

 ######################################################################################
 
 
 # TRAIN
 
 cd seq2seq-con-trans/OpenNMT-py
 
 python -u train.py\
     -data ../../dump/big_noisy_vmf_fr/vmf \
     -save_model ../../dump/big_noisy_vmf_fr/vmf \
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
     -train_steps 80000\
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
 
 
 # TEST
 
 cd seq2seq-con-trans/OpenNMT-py
 
 python -u translate.py\
             -decode_loss cosine\
             -model ../../dump/big_noisy_vmf_fr/vmf_step_50000.pt\
             -src ../../data/en-fr-paraphrase-john/trans/fr_fren-test.txt.tok.true.fr\
             -output ../../dump/big_noisy_vmf_fr/big/predictions\
             -batch_size 4000\
             -batch_type tokens\
             -beam_size 1\
             -replace_unk\
             -gpu 0
 ######################################################################################