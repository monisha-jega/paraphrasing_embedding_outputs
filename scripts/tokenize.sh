

#TRAIN 

FILE="../data/en-fr-paraphrase-john/fren-train.txt"
LANG="fr"


moses/scripts/tokenizer/tokenizer.perl \
-l $LANG -a -no-escape -threads 20 < $FILE > $FILE".tok."$LANG

moses/scripts/recaser/train-truecaser.perl \
--model "truecaser.model."$LANG --corpus $FILE".tok."$LANG

moses/scripts/recaser/truecase.perl \
--model "truecaser.model."$LANG < $FILE".tok."$LANG > $FILE".tok.true."$LANG

# VAL

FILE="../data/en-fr-paraphrase-john/eng-val.txt"
LANG="en"

moses/scripts/tokenizer/tokenizer.perl \
-l $LANG -a -no-escape -threads 20 < $FILE > $FILE".tok."$LANG

moses/scripts/recaser/truecase.perl \
--model "truecaser.model."$LANG < $FILE".tok."$LANG > $FILE".tok.true."$LANG




# TEST

FILE="../data/en-fr-paraphrase-john/eng-test.txt"
LANG="en"

moses/scripts/tokenizer/tokenizer.perl \
-l $LANG -a -no-escape -threads 20 < $FILE > $FILE".tok."$LANG

moses/scripts/recaser/truecase.perl \
--model "truecaser.model."$LANG < $FILE".tok."$LANG > $FILE".tok.true."$LANG