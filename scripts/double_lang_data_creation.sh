# DECLARE


FRENCH="../train.tok.true.fr"
ENGLISH="../train.tok.true.en"
AUTODATA_FRENCH="../train.tok.true.fr"
AUTODATA_ENGLISH="../train.tok.true.en"
AUTOENCODING_DATA_SIZE=4000


FOLDER="../data/kumarvon2018-data/fren/gen/"
NAME="1joint/"
##############################################################################


# CREATE DATA 

cd $FOLDER
mkdir $NAME
mkdir $NAME"trans"


head -$AUTOENCODING_DATA_SIZE $AUTODATA_FRENCH > $NAME"autodata.src"
head -$AUTOENCODING_DATA_SIZE $AUTODATA_ENGLISH >> $NAME"autodata.src"

cat $FRENCH > $NAME"train.src"
cat $ENGLISH >> $NAME"train.src"
cat $NAME"autodata.src" >> $NAME"train.src"


cat $ENGLISH > $NAME"train.tgt"
cat $FRENCH >> $NAME"train.tgt"
cat $NAME"autodata.src" >> $NAME"train.tgt"
##############################################################################



# PROCESS DATA FOR TRANSFORMER

cd ../../util-code


# Create .lang file
python create_double_lang_file.py $FOLDER $NAME $AUTOENCODING_DATA_SIZE $LANG
# Shuffle
python shuffle.py $FOLDER $NAME
# Prepend langauge start tokens
python prepend_lang_tokens.py $FOLDER $NAME
##############################################################################


# VALIDATION DATA
cd $FOLDER

cat "trans/en_eng-val.txt.tok.true.en" > $NAME"trans/"val.src
cat "trans/fr_fren-val.txt.tok.true.fr" >> $NAME"trans/"val.src

cp $NAME"trans/"val.src $NAME"trans/"val.tgt