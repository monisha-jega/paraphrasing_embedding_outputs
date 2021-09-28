#########################################################################################
# IOU (Intersection over Union) Metric Calculator                        
#
#########################################################################################

#-*- coding: utf-8 -*-
#!/usr/bin/env python

import sys
import numpy
import string
#########################################################################################


# IOU per line
def iou_per_line(h, r):
    h_words = set(h)
    r_words = set(r)
    inter = len(r_words & h_words)
    union = len(r_words | h_words)
    iou_score = (inter / float(union)) * 100
    #print(h, r, iu_)
    return iou_score


# Net IOU
def iou(hyps, refs):
    net_iou = 0
    for h, r in zip(hyps, refs):
        iou_score = iou_per_line(h, r)
        net_iou += iou_score
    net_iou = net_iou / float(len(refs))
    return net_iou
#########################################################################################


if __name__ == '__main__':
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
    
    #IOU
    iou_score = iou(hyps_arr, refs_arr)   
    print(iou_score)
#########################################################################################
