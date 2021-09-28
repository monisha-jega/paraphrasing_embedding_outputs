#########################################################################################
# Sentence-Wise BERT Calculator                        
#
#########################################################################################

#-*- coding: utf-8 -*-
#!/usr/bin/env python

import sys
import numpy
import subprocess

#########################################################################################

def bert_lines(hyps, refs, outfile, lang):
	vals = []
	count = 0
	for h, r in zip(hyps, refs):
		h = h.replace("\"", "\\\"")
		r = r.replace("\"", "\\\"")
		h = h.replace("\'", "\\'")
		r = r.replace("\'", "\\\'")
		try:
			cmd = "bert-score -c \"" + h + "\" -r \"" + r + "\" --lang " + lang + " --rescale-with-baseline"
			output = subprocess.check_output(cmd, shell=True)
			strval = output.decode().split("F1: ")[1].strip()
			val = float(strval) * 100.0
		except:
			val = 0
		vals.append(val)
		count += 1
		if (count % 50 == 0):
			print(str(count) + ": lines done")
		outfile.write(str(val) + "\n")

	return sum(vals)/len(vals)

#########################################################################################


if __name__ == '__main__':
	# Hypothesis
	hyp_file = sys.argv[1]
	ref_file = sys.argv[2]
	with open(hyp_file, 'r', encoding="utf8") as hyps:
		with open(ref_file, 'r', encoding="utf8") as refs:
			outfile = open(sys.argv[3], 'w')
			hyps_arr = hyps.readlines()[:2000]
			refs_arr = refs.readlines()[:2000]
	
			# BERT
			lang = sys.argv[4]
			bertscore = bert_lines(hyps_arr, refs_arr, outfile, lang)
			print(bertscore) 
#########################################################################################
