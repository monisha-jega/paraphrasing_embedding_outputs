
######################################################################################

# POST-PROCESS

cd util-code

python postprocess_preds.py $HYP


#######################################
LANG=Fr

# SEMANTIC
./bleu.sh $HYP $REF $LANG
python meteor.py $HYP $REF

# SYNTACTIC
python iou.py $HYP $REF
python wer.py $HYP $REF

# PP
python paraphrase_perc.py $HYP $REF

# BERTSCORE
bert-score -c $HYP -r $REF --lang $LANG --rescale-with-baseline

# PARSE
# java -mx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9000 -timeout 15000

python parse.py $REF
python parse.py $HYP
python ted.py $HYP.parse $REF.parse

# LOWERCASE BLEU
python bleu_nopunccase.py $HYP $REF
./bleu.sh $HYP".lower" $REF".lower" $LANG
# SARI
GT=
python sari.py $HYP $REF $GT



# French METEOR

# Download
git clone https://github.com/cmu-mtlab/meteor.git

# Install
cd meteor
ant

# Run
java -Xmx2G -jar meteor-*.jar ../$HYP ../$REF -l fr -norm



# French PTED
Refer to start a French Stanford Server:
https://stanfordnlp.github.io/CoreNLP/corenlp-server.html#getting-started