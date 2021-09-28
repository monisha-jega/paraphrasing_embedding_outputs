######################################################################################
######################################################################################
######################################################################################
# VMF
######################################################################################
######################################################################################
######################################################################################

# PREPROCESS

cd seq2seq-con-trans/OpenNMT-py

python -u preprocess.py\
    -train_src ../../data/kumarvon2018-data/fren/gen/1fr/trans/train.shuffled.src\
    -train_tgt ../../data/kumarvon2018-data/fren/gen/1fr/trans/train.shuffled.tgt\
    -valid_src ../../data/kumarvon2018-data/fren/gen/1fr/trans/val.src\
    -valid_tgt ../../data/kumarvon2018-data/fren/gen/1fr/trans/val.tgt\
    -save_data ../../dump/vmffr/vmf \
    -tgt_emb ../../embeddings/mapped.fasttext.both \
    -src_vocab_size 100000\
    -tgt_vocab_size 100000\
    -src_seq_length 100\
    -tgt_seq_length 100 
######################################################################################


# TRAIN

cd seq2seq-con-trans/OpenNMT-py

python -u train.py\
    -data ../../dump/vmffr/vmf \
    -save_model ../../dump/vmffr/vmf \
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


# TEST

cd seq2seq-con-trans/OpenNMT-py

python -u translate.py\
            -decode_loss cosine\
            -model ../../dump/vmffr/vmf_step_50000.pt\
            -src ../../data/kumarvon2018-data/fren/gen/trans/fr_test.fr\
            -output ../../dump/vmffr/iwslt/predictions\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 1\
            -replace_unk\
            -lang Fr\
            -gpu 0
######################################################################################


######################################################################################
######################################################################################
######################################################################################
# CE
######################################################################################
######################################################################################
######################################################################################

cd seq2seq-con-trans/OpenNMT-py

python -u preprocess.py\
    -train_src ../../data/kumarvon2018-data/fren/gen/1fr/trans/train.shuffled.src\
    -train_tgt ../../data/kumarvon2018-data/fren/gen/1fr/trans/train.shuffled.tgt\
    -valid_src ../../data/kumarvon2018-data/fren/gen/1fr/trans/val.src\
    -valid_tgt ../../data/kumarvon2018-data/fren/gen/1fr/trans/val.tgt\
    -save_data ../../dump/vmffr/vmf \
    -tgt_emb ../../embeddings/mapped.fasttext.both \
    -src_vocab_size 100000\
    -tgt_vocab_size 100000\
    -src_seq_length 100\
    -tgt_seq_length 100 
######################################################################################


# TRAIN

cd seq2seq-con-trans/OpenNMT-py

python -u train.py\
    -data ../../dump/cefr/vmf \
    -save_model ../../dump/cefr/vmf \
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
            -model ../../dump/vmffr/vmf_step_50000.pt\
            -src ../../data/kumarvon2018-data/fren/gen/trans/fr_test.fr\
            -output ../../dump/vmffr/iwslt/predictions\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 1\
            -replace_unk\
            -lang Fr\
            -gpu 0
######################################################################################


######################################################################################
######################################################################################
######################################################################################
# BILINGUAL PIVOTING - VMF
######################################################################################
######################################################################################
######################################################################################

# ENGLISH to FRENCH

cd orig_seq2seq-con-trans/OpenNMT-py

python -u translate.py\
            -decode_loss cosine\
            -model ../../dump/frenvmf/vmf_step_50000.pt\
            -src ../../data/kumarvon2018-data/fren/tst201516.tok.true.fr\
            -output ../../dump/frenvmf/frenpp/predictions\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 1\
            -replace_unk\
            -gpu 0

# FRENCH TO ENGLISH

cd orig_seq2seq-con-trans/OpenNMT-py

python -u translate.py\
            -decode_loss cosine\
            -model ../../dump/enfrvmf/vmf_step_50000.pt\
            -src ../../dump/frenvmf/frenpp/predictions\
            -output ../../dump/enfrvmf/fren_pp/predictions\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 1\
            -replace_unk\
            -gpu 0


######################################################################################
######################################################################################
######################################################################################
# BILINGUAL PIVOTING - CE
######################################################################################
######################################################################################
######################################################################################

# ENGLISH to FRENCH

cd orig_seq2seq-con-trans/OpenNMT-py

python -u translate.py\
            -model ../../dump/frence/vmf_step_50000.pt\
            -src ../../data/kumarvon2018-data/fren/tst201516.tok.true.fr\
            -output ../../dump/frence/fren_pp/predictions\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 1\
            -replace_unk\
            -gpu 0

# FRENCH TO ENGLISH

cd orig_seq2seq-con-trans/OpenNMT-py

python -u translate.py\
            -model ../../dump/enfrce/vmf_step_50000.pt\
            -src ../../dump/frence/fren_pp/predictions\
            -output ../../dump/enfrce/fren_pp/predictions\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 1\
            -replace_unk\
            -gpu 0