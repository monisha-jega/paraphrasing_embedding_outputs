

#TRAIN 

FILE="../data/ru-en_sachin/train.ru"
LANG="ru"


moses/scripts/tokenizer/tokenizer.perl \
-l $LANG -a -no-escape -threads 20 < $FILE > $FILE".tok."$LANG

moses/scripts/recaser/train-truecaser.perl \
--model "truecaser.model."$LANG --corpus $FILE".tok."$LANG

moses/scripts/recaser/truecase.perl \
--model "truecaser.model."$LANG < $FILE".tok."$LANG > $FILE".tok.true."$LANG




#TRAIN 

FILE="../data/ru-en_sachin/train.en"
LANG="en"


moses/scripts/tokenizer/tokenizer.perl \
-l $LANG -a -no-escape -threads 20 < $FILE > $FILE".tok."$LANG

moses/scripts/recaser/train-truecaser.perl \
--model "truecaser.model."$LANG --corpus $FILE".tok."$LANG

moses/scripts/recaser/truecase.perl \
--model "truecaser.model."$LANG < $FILE".tok."$LANG > $FILE".tok.true."$LANG
