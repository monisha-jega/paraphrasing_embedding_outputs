#########################################################################################
# METEOR Metric Calculator                        
#
#########################################################################################

import sys, nltk
#########################################################################################

# Hypothesis
hyp_file = sys.argv[1]
hyps = open(hyp_file, 'r', encoding='utf-8').readlines()

# Reference
ref_file = sys.argv[2]
refs = open(ref_file, 'r', encoding='utf-8').readlines()

corpus_score = 0
for hyp, ref in zip(hyps, refs):
	sent_score = nltk.translate.meteor_score.single_meteor_score(ref, hyp)
	corpus_score += sent_score


corpus_score = corpus_score/float(len(hyps)) * 100
print(corpus_score)
#########################################################################################

