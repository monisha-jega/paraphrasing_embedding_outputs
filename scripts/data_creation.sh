# DECLARE


FRENCH="fren-train.txt.tok.true.fr"
ENGLISH="eng-train.txt.tok.true.en"
AUTODATA="../paranmt/train.src"
AUTOENCODING_DATA_SIZE=5000
LANG="En"

FOLDER="../data/johnpara/"
NAME=""
##############################################################################



# CREATE DATA 

cd $FOLDER
mkdir $NAME

cat $FRENCH > $NAME"/train.src"
cat $ENGLISH >> $NAME"/train.src"
head -$AUTOENCODING_DATA_SIZE $AUTODATA >> $NAME"/train.src"


cat $ENGLISH > $NAME"/train.tgt"
cat $FRENCH >> $NAME"/train.tgt"
head -$AUTOENCODING_DATA_SIZE $AUTODATA >> $NAME"/train.tgt"
##############################################################################



# PROCESS DATA FOR TRANSFORMER

cd util-code


# Create .lang file
python create_lang_file.py $FOLDER $NAME $AUTOENCODING_DATA_SIZE $LANG
# Shuffle
python shuffle.py $FOLDER $NAME
# Prepend langauge start tokens
python prepend_lang_tokens.py $FOLDER $NAME
##############################################################################