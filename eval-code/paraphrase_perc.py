#########################################################################################
# Paraphrasing Percentage Metric Calculator                        
#
#########################################################################################


import sys
#########################################################################################

# Hypothesis
hyp_file = sys.argv[1]
hyps = open(hyp_file, 'r', encoding='utf-8').readlines()

# Reference
ref_file = sys.argv[2]
refs = open(ref_file, 'r', encoding='utf-8').readlines()

pp = 0
for h, r in zip(hyps, refs):
	if h.lower() != r.lower():
		pp += 1

# Paraphrasing Percentage
print(float(pp)/len(hyps))
#########################################################################################
