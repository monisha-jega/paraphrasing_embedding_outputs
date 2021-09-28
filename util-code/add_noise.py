#########################################################################################
# Adds noise to data, to use in denoising training.									
#
#########################################################################################

import sys
import numpy as np
#########################################################################################

# Noise parameters
WORD_SHUFFLE_PARAM = 2
DROPOUT_PARAM = 0.1

# Initial data
filename = sys.argv[1]
# Noisy data output file
new_filename = sys.argv[2]
#########################################################################################


data = open(filename, 'r', encoding='utf-8').readlines()
# Add noise only to 4/5 of the data
count = int(4 * len(data)/5)

with open(new_filename, 'w', encoding='utf-8') as new_file:

	for i, line in enumerate(data):
		words = line.strip().split()
		if i <= count:
			#Shuffle
			noise = np.random.uniform(0, WORD_SHUFFLE_PARAM, size=(len(words)))
			permut = (range(len(words)) + noise).argsort()
			words = list(np.array(words)[permut])
			line = " ".join(words)
		else:
			#Dropout
			keep_probab = np.random.rand(len(words))
			keep = keep_probab > DROPOUT_PARAM
			new_words = []
			for word, p in zip(words, keep):
				if p:
					new_words.append(word)
			if len(new_words) == 0:
				new_words.append(words[np.random.randint(len(words))])
			
			line = " ".join(new_words)
		if i % 1000 == 0:
			print("Added noise to " + str(i) + " sentences")
		new_file.write(line + "\n")
#########################################################################################


