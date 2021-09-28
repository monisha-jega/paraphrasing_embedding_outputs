#########################################################################################
# Combines two embedding files into a single file.										
#
#########################################################################################


french_embeddings_file = "../embeddings/corpus.fasttext.fr"
english_embeddings_file = "../embeddings/corpus.fasttext.txt"
combined_embeddings_file = "../embeddings/corpus.fasttext.both"
#########################################################################################

# Dictionary of word : embedding for both the languages
vocab = {}

# Store French embeddings
french_embeddings = open(french_embeddings_file, 'r').readlines()
for line in french_embeddings:
	line = line.strip().split()
	# Get the word and embedding
	word, emb = line[0], [float(val) for val in line[1:]]
	vocab[word] = emb
print("Read French embeddings")

# Store English embeddings
english_embeddings = open(english_embeddings_file, 'r').readlines()
for line in english_embeddings:
	line = line.strip().split()
	# Get the word and embedding
	word, emb = line[0], [float(val) for val in line[1:]]
	if word not in vocab:
		vocab[word] = emb
	else:
		# If an already existing word is encountered, take the average of
		# the French and the English embedding
		vocab[word] = [(val1 + val2)/2.0 for val1, val2 in zip(vocab[word], emb)]
print("Read English embeddings")

# Write to a new file
with open(combined_embeddings_file, 'w') as combined_embeddings:
	# Header
	# 300 is the embedding dimension
	first_line = str(len(vocab)) + " 300\n"
	combined_embeddings.write(first_line)
	for word, emb in vocab.items():
		# Embedding
		embstr = " ".join([str(val) for val in emb])
		# Word
		line = word + " " + embstr + "\n"
		combined_embeddings.write(line)
print("Written combined embeddings")
#########################################################################################




