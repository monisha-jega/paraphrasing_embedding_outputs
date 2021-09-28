#########################################################################################
# Reconstructs readable results from human annotation                   
#
#########################################################################################

import sys
import csv
from nltk import agreement, translate
from scipy import stats
import sklearn
#########################################################################################

# Results file
results_file =  open(sys.argv[1], 'r', encoding='utf-8')

#########################################################################################

# IOU per line
def iou_per_line(h, r):
    h_words = set(h.strip().split())
    r_words = set(r.strip().split())
    inter = len(r_words & h_words)
    union = len(r_words | h_words)
    iou_score = (inter / float(union)) * 100
    #print(h, r, iu_)
    return iou_score


def semantic_sim(h, r):
	#score = translate.meteor_score.single_meteor_score(r, h)
	score = translate.bleu_score.sentence_bleu([r], h)
	return score * 100

#########################################################################################


indicators = ['vmf', 'ce', 'both', 'neither']

# Read the results
results = list(csv.reader(results_file, delimiter=',', quotechar='"'))[1:]

triples = []
wins = []
human_cats = []
sos_cats = []
for i, row in enumerate(results):

	vals = [int(v) for v in row[-3:]]
	mode = stats.mode(vals)


	if int(mode[1]) > 1:
		choice = indicators[int(mode[0])]
		wins.append(choice)

		# Human choice
		if choice in ['both', 'neither']:
			human_cats.append('same')
			pass
			#continue
		else:
			human_cats.append(choice)


		# SoS choice
		input_, pred_1, pred_2 = row[1:4]
		pred_1_iou = iou_per_line(pred_1, input_)
		pred_1_bleu = semantic_sim(input_, pred_1)
		pred_1_sos = pred_1_bleu /pred_1_iou
		#pred_1_sos = float(pred_1_iou)
		pred_2_iou = iou_per_line(pred_2, input_)
		pred_2_bleu = semantic_sim(input_, pred_2)
		pred_2_sos = pred_2_bleu / pred_2_iou
		#pred_2_sos =  float(pred_2_iou)

		if -0.1 <= pred_1_sos - pred_2_sos <= 0.1:
			sos_cats.append("same")
		elif (pred_1_sos > pred_2_sos):
			sos_cats.append(indicators[0])
		elif (pred_1_sos < pred_2_sos):
			sos_cats.append(indicators[1])
		# else:
		# 	sos_cats.append('same')
			
		# Triples
		if mode[0] < 2:
			triples.append(('a1', i, row[-3]))
			triples.append(('a2', i, row[-2]))
			triples.append(('a3', i, row[-1]))



ratingtask = agreement.AnnotationTask(triples)

#kappa_pairwise()

# print("Kappa Agreement between I1 and I2: ", )
# print("Kappa Agreement between I2 and I3: ", )
# print("Kappa Agreement between I1 and I3: ", )
print("Kappa Agreement: ", ratingtask.kappa())
print("Fleiss Agreement: ", ratingtask.multi_kappa())

for i in indicators:
	print(str(i) + " : " + str(wins.count(i)))


# Accuracy and F-Score with SoS
print(human_cats, sos_cats)
acc = sklearn.metrics.accuracy_score(human_cats, sos_cats)
microfscore = sklearn.metrics.f1_score(human_cats, sos_cats, average="micro")
macrofscore = sklearn.metrics.f1_score(human_cats, sos_cats, average="macro")
print("Accuracy ", acc)
print("Micro F-score", microfscore)
print("Macro F-score", macrofscore)




#########################################################################################
	