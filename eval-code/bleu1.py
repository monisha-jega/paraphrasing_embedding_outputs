#########################################################################################
# BLEU1 Metric Calculator                        
#
#########################################################################################

#-*- coding: utf-8 -*-
#!/usr/bin/env python

import sys
import numpy, nltk
#########################################################################################


# Iterate through each data point and compute BLEU1 Score for each and take the 
# average
def bleu1_lines(hyps_arr, refs_arr):
    net_bleu1 = 0
    for h, r in zip(hyps_arr, refs_arr):
        bleu1_score = nltk.translate.bleu_score.modified_precision([r], h, 1)
        net_bleu1 += bleu1_score
    net_bleu1 = net_bleu1 / float(len(refs))
    return net_bleu1


if __name__ == '__main__':
    # Hypothesis
    # Hypothesis
    hyp_file = sys.argv[1]
    with open(hyp_file, 'r', encoding="utf8") as hyps:
        hyps_arr = []
        for line in hyps.readlines():
            h = line.split()
            hyps_arr.append(h)

    # Reference
    ref_file = sys.argv[2]
    with open(ref_file, 'r', encoding="utf8") as refs:
        refs_arr = []
        for line in refs.readlines():
            r = line.split()
            refs_arr.append(r)  

    # BLEU1 Score
    bleu1_score = bleu1_lines(hyps_arr, refs_arr) * 100
    print(bleu1_score)
#########################################################################################
