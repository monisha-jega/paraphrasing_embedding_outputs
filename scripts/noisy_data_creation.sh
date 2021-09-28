# DECLARE


FRENCH="fren-train.txt.tok.true.fr"
ENGLISH="eng-train.txt.tok.true.en"
AUTODATA="fren-train.txt.tok.true.fr"
AUTOENCODING_DATA_SIZE=5000
LANG=Fr


FOLDER="../data/en-fr-paraphrase-john/"
NAME="4knoisyfr/"
##############################################################################



# CREATE DATA 

cd $FOLDER
mkdir $NAME

cat $FRENCH > $NAME"train.src"
cat $ENGLISH >> $NAME"train.src"
cat $NAME"autodata.src" > $NAME"autodata.src"

# Noise the data
cd ../../util-code
python add_noise.py $FOLDER$NAME"autodata.src" $FOLDER$NAME"/autodata.src.noisy"

cd $FOLDER
cat $NAME"autodata.src.noisy">> $NAME"train.src"


cat $ENGLISH > $NAME"train.tgt"
cat $FRENCH >> $NAME"train.tgt"
cat -$AUTOENCODING_DATA_SIZE $AUTODATA >> $NAME"train.tgt"
##############################################################################



# PROCESS DATA FOR TRANSFORMER

cd ../../util-code


# Create .lang file
python create_lang_file.py $FOLDER $NAME $AUTOENCODING_DATA_SIZE $LANG
# Shuffle
python shuffle.py $FOLDER $NAME
# Prepend langauge start tokens
python prepend_lang_tokens.py $FOLDER $NAME
##############################################################################