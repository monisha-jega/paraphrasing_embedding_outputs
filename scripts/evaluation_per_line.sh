# REF
REF="../dump/tst201516.tok.true.en"
REF="../dump/eng-test.txt.tok.true"

# HYP
MODEL="big_noisy_ce/"
LANG="en"
DATA="big/"

HYP="../dump/"$MODEL$DATA"predictions"
# BERT
BERT="../dump/"$MODEL$DATA"berts.txt"
# IOU
IOU="../dump/"$MODEL$DATA"ious.txt"
# WER
WER="../dump/"$MODEL$DATA"wers.txt"
# PTED
TED="../dump/"$MODEL$DATA"teds.txt"


python iou_per_line.py $HYP $REF $IOU
python wer_per_line.py $HYP $REF $WER
python ted_per_line.py $HYP.parse $REF.parse $TED

python bert_per_line.py $HYP $REF $BERT $LANG