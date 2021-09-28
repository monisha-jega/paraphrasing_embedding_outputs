#########################################################################################
# Extracts test prediction samples from two models 
# and outputs a shuffled version as well as the shuffling key                    
#
#########################################################################################

import sys
import random
import csv
#########################################################################################

# Only sentences within this minimum and maximum lengths will be considered
MIN_SENT_LENGTH = 3
MAX_SENT_LENGTH = 25

# Total number of samples
NUM_SAMPLES = 200

# The input source file (test set)
test_data_file = sys.argv[1]

# The two prediction files
preds_1_file = sys.argv[2]
preds_2_file = sys.argv[3]

# Task name
task_name = sys.argv[4]

#########################################################################################


# Tokenizes a sentence approximately
def tokenize(sent):
	return sent.split()

# Checks if two sentences are identical
def are_identical(t1, t2):
	t1 = tokenize(t1)
	t2 = tokenize(t2)
	if t1.lower() == t2.lower():
		print(t1, t2, " are exactly the same.")
		return True
	return False
	
# Checks if the input sentence satisfies the filter constraints
def passes_filter(s, p1, p2):
	num_tokens = len(tokenize(s))
	if not (MIN_SENT_LENGTH <= num_tokens <= MAX_SENT_LENGTH):
		print(s + " not a valid input sentence length.")
		return False
	if s.lower() == p1.lower() == p2.lower():
		print("Both predictions are the same as the input.", s, p1, p2)
		return False
	return True

#########################################################################################


# Read the test data and the predictions of the two models
test_data = open(test_data_file, 'r', encoding="utf-8").readlines()
preds_1 = open(preds_1_file, 'r', encoding="utf-8").readlines()
preds_2 = open(preds_2_file, 'r', encoding="utf-8").readlines()

# Find the total number of test instances available to sample
test_data_size = len(test_data)
print(test_data_size, " test instances available.")

# Get a random ordering of the samples
permut = list(range(test_data_size))
random.shuffle(permut)

# List of sampled IDs, where ID is the line number of the 
# sample in the complete test set
ids = []
# Whether the predictions should been swapped - a list of booleans
to_swap = []

samples_accepted = 0
for id_ in permut:
	# Check if filters are cleared
	if not passes_filter(test_data[id_], preds_1[id_], preds_2[id_]):
		continue

	# Remember this ID as a selected sample
	ids.append(id_)
	# Decide whether to swap predictions fot this sample
	to_swap.append(random.choice([True, False]))
	# Sample accepted
	samples_accepted += 1

	# Acquired the required number of samples
	if samples_accepted == NUM_SAMPLES:
		break

# Write the selected samples, in both shuffled and unshuffled forms, 
# as well as the shuffling key
key_file = open(task_name + "-key.csv", 'w')
unshuffled_samples_file = open(task_name + "-unshuffled.csv", 'w')
shuffled_samples_file = open(task_name + "-shuffled.csv", 'w')

# Create CSV writers
key_writer = csv.writer(key_file, \
			delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
unshuffled_samples_writer = csv.writer(unshuffled_samples_file, delimiter=',',
                            quotechar='"', quoting=csv.QUOTE_MINIMAL)
shuffled_samples_writer = csv.writer(shuffled_samples_file, delimiter=',',
                            quotechar='"', quoting=csv.QUOTE_MINIMAL)

print('Starting to write the samples.......')
# Write all the CSV files
for id_ , to_swap_for_row in zip(ids, to_swap):
	# Shuffling key
	key_writer.writerow([id_, to_swap_for_row])
	# Unshuffled predictions
	original, pred1, pred2 = test_data[id_].strip(), \
				preds_1[id_].strip(), preds_2[id_].strip()
	row = [id_, original, pred1, pred2]
	unshuffled_samples_writer.writerow(row)
	# Shuffled predictions
	if to_swap_for_row:
		row = [id_, original, pred2, pred1]
	shuffled_samples_writer.writerow(row)
#########################################################################################



