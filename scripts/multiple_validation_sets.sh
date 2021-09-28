# PREPROCESS

cd seq2seq-con-trans-mv/OpenNMT-py

python -u preprocess.py\
    -train_src ../../data/kumarvon2018-data/fren/gen/1/trans/train.shuffled.src\
    -train_tgt ../../data/kumarvon2018-data/fren/gen/1/trans/train.shuffled.tgt\
    -valid_src ../../data/kumarvon2018-data/fren/gen/1/trans/val.src\
    -valid_tgt ../../data/kumarvon2018-data/fren/gen/1/trans/val.tgt\
    -valid_src2 ../../data/kumarvon2018-data/fren/gen/trans/en_val.en\
    -valid_tgt2 ../../data/kumarvon2018-data/fren/gen/trans/en_val.en\
    -valid_src3 ../../data/paranmt/trans/en_val.src\
    -valid_tgt3 ../../data/paranmt/trans/en_val.tgt\
    -save_data ../../dump/vmf/vmf \
    -tgt_emb ../../embeddings/mapped.fasttext.both \
    -src_vocab_size 100000\
    -tgt_vocab_size 100000\
    -src_seq_length 100\
    -tgt_seq_length 100 


