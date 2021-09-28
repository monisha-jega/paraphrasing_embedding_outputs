import sys

bert_threshold = float(sys.argv[1])

# Input sentences
#inputs = open("../dump/tst201516.tok.true.en", 'r', encoding='utf-8').readlines()
inputs = open("../dump/eng-test.txt.tok.true", 'r', encoding='utf-8').readlines()

# Baseline
base_folder = "../dump/big_noisy_ce/big/"
base_predictions = open(base_folder + "predictions", 'r', encoding='utf-8').readlines()
base_berts = [float(n) for n in open(base_folder + "berts.txt").readlines()]

# Our Model
model_folder = "../dump/big_noisy_vmf/big/"
model_predictions = open(model_folder + "predictions", 'r', encoding='utf-8').readlines()
model_berts = [float(n) for n in open(model_folder + "berts.txt").readlines()]

# Outputting selected samples
sample_folder = "samples/"
sample_inputs = open(sample_folder + "inputs-" + str(bert_threshold), 'w', encoding='utf-8')
sample_base_predictions = open(sample_folder + "base-" + str(bert_threshold), 'w', encoding='utf-8')
sample_model_predictions = open(sample_folder + "model-" + str(bert_threshold), 'w', encoding='utf-8')


# The diversity metrics and their file names
metrics = {"iou" : "ious.txt",
			"wers" : "wers.txt",
			"teds" : "teds.txt"}

# Linewise diversity metrics for the entire test set
base_vals = {}
model_vals = {}
# Linewise diversity metrics for the samples with bertscores
# higher than the threshold
sample_base_vals = {}
sample_model_vals = {}

# Read instance-wise metrics from the corresponding files.
for metric, name in metrics.items():
	base_vals[metric] = open(base_folder + name).readlines()
	model_vals[metric] = open(model_folder + name).readlines()

	sample_base_vals[metric] = []
	sample_model_vals[metric] = []

count = 0
# Check the BERT scores for each test input instance	
for i, (base_bert, model_bert) in enumerate(zip(base_berts, model_berts)):
	if (model_bert >= bert_threshold and base_bert >= bert_threshold):
		# Consider this example and add the metrics
		count += 1
		for metric in metrics:
			model_val = model_vals[metric][i]
			base_val = base_vals[metric][i]
			if ("ERROR" not in [model_val.strip(), base_val.strip()]):
				sample_model_vals[metric].append(float(model_val))
				sample_base_vals[metric].append(float(base_val))
		# Write the example
		sample_inputs.write(inputs[i])
		sample_base_predictions.write(base_predictions[i])
		sample_model_predictions.write(model_predictions[i])


# Calculate the average of each metric of the selected samples
print("-----------------------------------------------------")
print("No. filtered samples for BERT threshold of " +
	str(bert_threshold) + " is: " + str(count))
for metric in metrics:
	net_model_val = \
		sum(sample_model_vals[metric])/len(sample_model_vals[metric])
	net_base_val = \
		sum(sample_base_vals[metric])/len(sample_base_vals[metric])
	# Print the result for this metri
	print("Baseline, Model Scores for " + metric \
 		+ ": " + str(net_base_val) + ", " + str(net_model_val))
	if ((metric == "iou" and net_model_val <  net_base_val) or (metric != "iou" and \
		net_model_val >  net_base_val)):
		print("Model wins for BERT threshold of " + \
			str(bert_threshold) + " for the metric " + metric + "!!")





