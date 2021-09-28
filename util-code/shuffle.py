#########################################################################################
# Shuffle the source file, lang descriptor file and target file together.
#
#########################################################################################

import random
import numpy as np
import sys
#########################################################################################


# Type of data - train/val/test - used to name the output .lang file
datatype = "train"

# The root data folder
folder = sys.argv[1]
# The sub-folder inside the root data folder that contains the training files.
name = sys.argv[2]
#########################################################################################



# Open the source data
src_filename = folder + name + datatype + ".src"
src_file = open(src_filename, 'r', encoding='utf-8').readlines()
# Open the lang descriptor data
lang_filename = folder + name + datatype + ".lang"
lang_file = open(lang_filename, 'r', encoding='utf-8').readlines()
# Open the target data
tgt_filename = folder + name + datatype + ".tgt"
tgt_file = open(tgt_filename, 'r', encoding='utf-8').readlines()
# Get the dataset size
n = len(lang_file)

assert(n == len(src_file) and n == len(tgt_file))
#########################################################################################


# Generate a random permutation for the dataset size
permutation = random.sample(range(n), n)
# Rearrange the data points according to the permutation
src_file = list(np.array(src_file)[permutation])
lang_file = list(np.array(lang_file)[permutation])
tgt_file = list(np.array(tgt_file)[permutation])

# Write the shuffled data
with open(folder + name + datatype + ".shuffled.src", 'w', encoding='utf-8') as new_src_file:
	for line in src_file:
		new_src_file.write(line)
with open(folder + name + datatype + ".shuffled.lang", 'w', encoding='utf-8') as new_lang_file:
	for line in lang_file:
		new_lang_file.write(line)
with open(folder + name + datatype + ".shuffled.tgt", 'w', encoding='utf-8') as new_tgt_file:
	for line in tgt_file:
		new_tgt_file.write(line)
#########################################################################################
