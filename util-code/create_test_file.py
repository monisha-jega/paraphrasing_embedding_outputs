#########################################################################################
# Create a test file out of a large dataset.								
#
#########################################################################################

import sys
import random
from nltk import word_tokenize
#########################################################################################


# Folder
data_folder = sys.argv[1]
# File name with data
data_file_name = sys.argv[2]

# Test set size
TEST_SIZE = 10000
#########################################################################################

data_file = open(data_file_name).readlines()
# Shuffle the data
random.shuffle(data_file)

sources, targets = [], []
count = 0
for line in data_file:
	line = line.strip().split("\t")
	count += 1
	# Tokenize the sentences.
	source = " ".join(word_tokenize(line[0]))
	target = " ".join(word_tokenize(line[1]))
	sources.append(source)
	targets.append(target)
	if count % 1000 == 0:
		print(str(count) + " sentences selected for test.")
		if count == TEST_SIZE:
			break

# Write the selected sentences.
with open(data_folder + "test" + str(TEST_SIZE) + ".src", 'w') as test_src_file:
	for line in sources:
		test_src_file.write(line + "\n")
with open(data_folder + "test" + str(TEST_SIZE) + ".tgt", 'w') as test_tgt_file:
	for line in targets:
		test_tgt_file.write(line + "\n")
#########################################################################################

