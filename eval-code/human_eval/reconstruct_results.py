#########################################################################################
# Reconstructs readable results from human annotation                   
#
#########################################################################################

import sys
import csv
#########################################################################################

# Task name
task_name = sys.argv[1]

# The name of the two models to which the predictions belong
model1_name = sys.argv[2]
model2_name = sys.argv[3]

# The human votes with numbers indicating the predictions
votes_file = sys.argv[4]
#########################################################################################

# Open the files required
keys_file = open(task_name + "-key.csv", 'r')
unshuffled_samples_file = open(task_name + "-unshuffled.csv", 'r')
results_file = open(task_name + "-readable_results.csv", 'w')

# Read the files
keys = csv.reader(keys_file, delimiter=',')
unshuffled_samples = csv.reader(unshuffled_samples_file, 
							delimiter=',', quotechar='"')

# Create CSV writer
results_writer = csv.writer(results_file, \
			delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

# Read the results
votes = [int(v) for in open(votes_file, 'r').readlines()]

# Count the votes and write the result for each vote readably 
model1_votes, model2_votes = 0, 0
for key_row, sample_row, vote in zip(keys, unshuffled_samples, votes):
	id_, to_swap = key_row
	id_, original, pred1, pred2 = sample_row

	# Classify the vote
	if not to_swap:
		if vote == 1:
			model1_votes += 1
		else:
			model2_votes += 1
	else:
		if vote == 1:
			model2_votes += 1
		else:
			model1_votes += 1

	row = [id_, original, pred1, pred2, vote]
	results_writer.write(row)


# Print the results
print(model1_name + " got votes: " + str(model1_votes))
print(model2_name + " got votes: " + str(model2_votes))

if model1_votes > model2_votes:
	print(model1_name + ' wins at ' + \
		(model1_votes*100)/float(model1_votes+model2_votes) + "%")
elif model2_votes > model1_votes:
	print(model2_name + ' wins at ' + \
		(model2_votes*100)/float(model1_votes+model2_votes) + "%")
#########################################################################################
	