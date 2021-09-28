######################################################################################
######################################################################################
######################################################################################
# VMF
######################################################################################
######################################################################################
######################################################################################


# PREPROCESS

cd orig_seq2seq-con-trans/OpenNMT-py

python -u preprocess.py\
    -train_src ../../data/paranmt/train.src\
    -train_tgt ../../data/paranmt/train.tgt\
    -valid_src ../../data/paranmt/val.src\
    -valid_tgt ../../data/paranmt/val.tgt\
    -save_data ../../dump/superpara_vmf/vmf \
    -tgt_emb ../../embeddings/original.fasttext.txt \
    -src_vocab_size 50000\
    -tgt_vocab_size 50000\
    -src_seq_length 100\
    -tgt_seq_length 100 
######################################################################################


# TRAIN

cd orig_seq2seq-con-trans/OpenNMT-py

python -u train.py\
    -data ../../dump/superpara_vmf/vmf \
    -save_model ../../superpara_vmf/vmf \
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
    -train_steps 100000\
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
    -world_size 8\
    -generator_function continuous-linear\
    -loss nllvmf\
    -share_decoder_embeddings\
    -generator_layer_norm\
    -lambda_vmf 0.2\
    -gpu_ranks 0 1 2 3 4 5 6 7 
######################################################################################


# TEST

cd orig_seq2seq-con-trans/OpenNMT-py

python -u translate.py\
            -decode_loss cosine\
            -model ../../dump/superpara_vmf/vmf_step_60000.pt\
            -src ../../data/paranmt/test.src\
            -output ../../dump/superpara_vmf/paranmt/predictions\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 1\
            -replace_unk\
            -gpu 0

            python -u translate.py\
            -decode_loss cosine\
            -model ../../dump/superpara_vmf/vmf_step_60000.pt\
            -src ../../data/paranmt/test.src\
            -output ../../dump/superpara_vmf/paranmt/beamsize2/predictions\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 2\
            -replace_unk\
            -gpu 0

            python -u translate.py\
            -decode_loss cosine\
            -model ../../dump/superpara_vmf/vmf_step_60000.pt\
            -src ../../data/paranmt/test.src\
            -output ../../dump/superpara_vmf/paranmt/beamsize3/predictions\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 3\
            -replace_unk\
            -gpu 0
######################################################################################






######################################################################################
######################################################################################
######################################################################################
# CE
######################################################################################
######################################################################################
######################################################################################


# PREPROCESS


cd orig_seq2seq-con-trans/OpenNMT-py

python -u preprocess.py\
    -train_src ../../data/paranmt/train.src\
    -train_tgt ../../data/paranmt/train.tgt\
    -valid_src ../../data/paranmt/val.src\
    -valid_tgt ../../data/paranmt/val.tgt\
    -save_data ../../dump/superpara_ce/vmf \
    -tgt_emb ../../embeddings/original.fasttext.txt \
    -src_vocab_size 50000\
    -tgt_vocab_size 50000\
    -src_seq_length 100\
    -tgt_seq_length 100 
######################################################################################


# TRAIN

cd orig_seq2seq-con-trans/OpenNMT-py

 python -u train.py\
     -data ../../dump/superpara_ce/vmf \
     -save_model ../../dump/superpara_ce/vmf \
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
     -train_steps 100000 \
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
     -gpu_ranks 0\
    --train_from ../../dump/superpara_ce/vmf_step_50000.pt
######################################################################################


# TEST

cd orig_seq2seq-con-trans/OpenNMT-py

python -u translate.py\
            -model ../../dump/superpara_ce/vmf_step_60000.pt\
            -src ../../data/paranmt/test.src\
            -output ../../dump/superpara_ce/paranmt/predictions\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 1\
            -replace_unk\
            -gpu 0

            python -u translate.py\
            -model ../../dump/superpara_ce/vmf_step_60000.pt\
            -src ../../data/paranmt/test.src\
            -output ../../dump/superpara_ce/paranmt/beamsize2/predictions\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 2\
            -replace_unk\
            -gpu 0

             python -u translate.py\
            -model ../../dump/superpara_ce/vmf_step_60000.pt\
            -src ../../data/paranmt/test.src\
            -output ../../dump/superpara_ce/paranmt/beamsize3/predictions\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 3\
            -replace_unk\
            -gpu 0
######################################################################################