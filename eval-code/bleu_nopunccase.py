#########################################################################################
# BLEU (without punctuation and case) Metric Calculator                        
#
#########################################################################################

#-*- coding: utf-8 -*-
#!/usr/bin/env python

import sys
import numpy, nltk
#########################################################################################

# Strip punctuation and lowercase
def process(sentence):
    punc = '''!()-[]{};:'"\,<>./?@#$%^&*_~'''
    for p in punc:
        sentence = sentence.replace(p, '')
    return sentence.lower()


if __name__ == '__main__':
    # Hypothesis
    # Hypothesis
    hyp_file = sys.argv[1]
    with open(hyp_file, 'r', encoding="utf8") as hyps:
        hyps_arr = hyps.readlines()

    # Reference
    ref_file = sys.argv[2]
    with open(ref_file, 'r', encoding="utf8") as refs:
        refs_arr = refs.readlines()

with open(sys.argv[1]+".lower", 'w', encoding="utf8") as out_hyp_file:
    for line in hyps_arr:
        out_hyp_file.write(process(line))

with open(sys.argv[2]+".lower", 'w', encoding="utf8") as out_ref_file:
    for line in refs_arr:
        out_ref_file.write(process(line))

#########################################################################################
