######################################################################################
 ######################################################################################
 ######################################################################################
 # WITH BIG AUTOENCODING DATA
 ######################################################################################
 ######################################################################################
 ######################################################################################
 
 
 # PREPROCESS
 
 cd seq2seq-con-trans/OpenNMT-py
 

 python -u preprocess.py\
     -train_src ../../data/en-fr-paraphrase-john/4k/trans/train.shuffled.src\
     -train_tgt ../../data/en-fr-paraphrase-john/4k/trans/train.shuffled.tgt\
     -valid_src ../../data/en-fr-paraphrase-john/trans/en_eng-val.txt.tok.true.en\
     -valid_tgt ../../data/en-fr-paraphrase-john/trans/en_eng-val.txt.tok.true.en\
     -save_data ../../dump/big_4k_ce/vmf \
     -tgt_emb ../../embeddings/mapped.fasttext.both \
     -src_vocab_size 100000\
     -tgt_vocab_size 100000\
     -src_seq_length 100\
     -tgt_seq_length 100 


 ######################################################################################
 
 
 # TRAIN
 
 cd seq2seq-con-trans/OpenNMT-py
 
 python -u train.py\
     -data ../../dump/big_4k_ce/vmf \
     -save_model ../../dump/big_4k_ce/vmf \
     -layers 6 \
     -rnn_size 512\
     -word_vec_size 512\
     -transformer_ff 1024\
     -heads 4\
     -warmup_init_lr 1e-8\
     -warmup_end_lr 0.0003\
     -min_lr 1e-9\
     -encoder_type transformer\
     -decoder_type transformer\
     -position_encoding\
     -train_steps 50000 \
     -max_generator_batches 2\
     -dropout 0.3\
     -batch_size 4000\
     -batch_type tokens\
     -normalization tokens \
     -accum_count 2\
     -optim adam\
     -adam_beta2 0.999\
     -decay_method linear\
     -weight_decay 0.0001\
     -warmup_steps 4000\
     -learning_rate 1\
     -max_grad_norm 25\
     -param_init 0 \
     -param_init_glorot\
     -label_smoothing 0.1\
     -valid_steps 10000\
     -save_checkpoint_steps 10000\
     -world_size 1\
     -gpu_ranks 0
 ######################################################################################
 
 
 # TEST
 
 cd seq2seq-con-trans/OpenNMT-py
 
 python -u translate.py\
             -model ../../dump/big_4k_ce/vmf_step_100000.pt\
             -src ../../data/en-fr-paraphrase-john/trans/en_eng-test.txt.tok.true.en\
             -output ../../dump/big_4k_ce/big/predictions\
             -batch_size 4000\
             -batch_type tokens\
             -beam_size 1\
             -replace_unk\
             -gpu 0
 ######################################################################################
 


 
 
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
     -train_src ../../data/en-fr-paraphrase-john/4knoisy/trans/train.shuffled.src\
     -train_tgt ../../data/en-fr-paraphrase-john/4knoisy/trans/train.shuffled.tgt\
     -valid_src ../../data/en-fr-paraphrase-john/trans/en_eng-val.txt.tok.true.en\
     -valid_tgt ../../data/en-fr-paraphrase-john/trans/en_eng-val.txt.tok.true.en\
     -save_data ../../dump/big_noisy_ce/vmf \
     -tgt_emb ../../embeddings/mapped.fasttext.both \
     -src_vocab_size 100000\
     -tgt_vocab_size 100000\
     -src_seq_length 100\
     -tgt_seq_length 100 

 ######################################################################################
 
 
 # TRAIN
 
 cd seq2seq-con-trans/OpenNMT-py
 
 python -u train.py\
     -data ../../dump/big_noisy_vmf/vmf \
     -save_model ../../dump/big_noisy_ce/vmf \
     -layers 6 \
     -rnn_size 512\
     -word_vec_size 512\
     -transformer_ff 1024\
     -heads 4\
     -warmup_init_lr 1e-8\
     -warmup_end_lr 0.0003\
     -min_lr 1e-9\
     -encoder_type transformer\
     -decoder_type transformer\
     -position_encoding\
     -train_steps 80000 \
     -max_generator_batches 2\
     -dropout 0.3\
     -batch_size 4000\
     -batch_type tokens\
     -normalization tokens \
     -accum_count 2\
     -optim adam\
     -adam_beta2 0.999\
     -decay_method linear\
     -weight_decay 0.0001\
     -warmup_steps 4000\
     -learning_rate 1\
     -max_grad_norm 25\
     -param_init 0 \
     -param_init_glorot\
     -label_smoothing 0.1\
     -valid_steps 10000\
     -save_checkpoint_steps 10000\
     -world_size 1\
     -gpu_ranks 0
 ######################################################################################
 
 
 # TEST
 
 cd seq2seq-con-trans/OpenNMT-py
 
 python -u translate.py\
             -model ../../dump/big_noisy_ce/vmf_step_60000.pt\
             -src ../../data/en-fr-paraphrase-john/trans/en_eng-test.txt.tok.true.en\
             -output ../../dump/big_noisy_ce/big/predictions\
             -batch_size 4000\
             -batch_type tokens\
             -beam_size 1\
             -replace_unk\
             -gpu 0
 ######################################################################################



 ######################################################################################
 ######################################################################################
 ######################################################################################
 # WITH NOISY BIG AUTOENCODING DATA TWO LANGUAGES
 ######################################################################################
 ######################################################################################
 ######################################################################################
 
 
 # PREPROCESS
 
 cd seq2seq-con-trans/OpenNMT-py
 

 python -u preprocess.py\
     -train_src ../../data/en-fr-paraphrase-john/4knoisyboth/trans/train.shuffled.src\
     -train_tgt ../../data/en-fr-paraphrase-john/4knoisyboth/trans/train.shuffled.tgt\
     -valid_src ../../data/en-fr-paraphrase-john/4knoisyboth/trans/val.src\
     -valid_tgt ../../data/en-fr-paraphrase-john/4knoisyboth/trans/val.tgt\
     -save_data ../../dump/big_noisy_vmf_both/vmf \
     -tgt_emb ../../embeddings/mapped.fasttext.both \
     -src_vocab_size 100000\
     -tgt_vocab_size 100000\
     -src_seq_length 100\
     -tgt_seq_length 100 

 ######################################################################################
 
 
 # TRAIN
 
 cd seq2seq-con-trans/OpenNMT-py
 
 python -u train.py\
     -data ../../dump/big_noisy_vmf_both/vmf \
     -save_model ../../dump/big_noisy_ce_both/vmf \
     -layers 6 \
     -rnn_size 512\
     -word_vec_size 512\
     -transformer_ff 1024\
     -heads 4\
     -warmup_init_lr 1e-8\
     -warmup_end_lr 0.0003\
     -min_lr 1e-9\
     -encoder_type transformer\
     -decoder_type transformer\
     -position_encoding\
     -train_steps 80000 \
     -max_generator_batches 2\
     -dropout 0.3\
     -batch_size 4000\
     -batch_type tokens\
     -normalization tokens \
     -accum_count 2\
     -optim adam\
     -adam_beta2 0.999\
     -decay_method linear\
     -weight_decay 0.0001\
     -warmup_steps 4000\
     -learning_rate 1\
     -max_grad_norm 25\
     -param_init 0 \
     -param_init_glorot\
     -label_smoothing 0.1\
     -valid_steps 10000\
     -save_checkpoint_steps 10000\
     -world_size 1\
     -gpu_ranks 0
 ######################################################################################
 
 
 # TEST
 
  cd seq2seq-con-trans/OpenNMT-py
 
 python -u translate.py\
             -model ../../dump/big_noisy_vmf_both/vmf_step_60000.pt\
             -src ../../data/en-fr-paraphrase-john/trans/en_eng-test.txt.tok.true.en\
             -output ../../dump/big_noisy_vmf_both/big/en/predictions\
             -batch_size 4000\
             -batch_type tokens\
             -beam_size 1\
             -replace_unk\
             -gpu 0


 python -u translate.py\
             -model ../../dump/big_noisy_vmf_both/vmf_step_60000.pt\
             -src ../../data/en-fr-paraphrase-john/trans/fr_fren-test.txt.tok.true.fr\
             -output ../../dump/big_noisy_vmf_both/big/fr/predictions\
             -batch_size 4000\
             -batch_type tokens\
             -beam_size 1\
             -replace_unk\
             -gpu 0\
             -lang Fr