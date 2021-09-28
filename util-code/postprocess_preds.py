#########################################################################################
# Replaces any residual French words with English words in the test predictions.								
#
#########################################################################################


import sys
#########################################################################################

# File of test predictions
preds_file = sys.argv[1]

# Output predictions file after post-processing
new_preds_file = preds_file + ".post"
# French to English dictionary
fr_to_en_dic_file = open("../embeddings/fr-en.seed", 'r', encoding='utf-8').readlines()
# File containing set of all English words
en_dic = open("../embeddings/eng.txt", 'r').readlines()
#########################################################################################


# Set of all English words 
en_all_words = set([])
for line in en_dic:
	en_all_words.add(line.strip().lower())

# Read the dictionary file and store it as a pytohn dictionary
fr_to_en_dic = {}
for line in fr_to_en_dic_file:
	fr, en = line.strip().split()
	fr_to_en_dic[fr] = en
#########################################################################################



# Replace every French word with the corresponding English word 
# obtained from a French to English dictionary.
def replace_french(words):
	# New set of words
	new_words = []
	for word in words:
		# Store initial case
		upper = False
		if word[0].isupper():
			upper = True
		# Lowercase the word
		word = word.lower()
		# If the word is not English but is French
		if word not in en_all_words and word in fr_to_en_dic:
			new_word = fr_to_en_dic[word]
		else:
			new_word = word
		# Convert back to true case
		if upper:
			new_word = new_word[0].upper() + new_word[1:]
		new_words.append(new_word)
	return new_words
#########################################################################################



preds = open(preds_file, 'r', encoding='utf-8').readlines()
new_preds = open(new_preds_file, 'w', encoding='utf-8')

for line in preds:
	line = rreplace_french(line.split())
	new_preds.write(" ".join(line) + "\n")
#########################################################################################

