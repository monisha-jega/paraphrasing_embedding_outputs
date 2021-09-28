#########################################################################################
# Plot validation losses of a model against number of training steps, based on the 
# training output log file.							
#
#########################################################################################


import matplotlib.pyplot as plt
#########################################################################################


# The name of the model being plotted
modelname = "vmf"
# The name of the validation set being used - used only to display in the graph
valname = "oneperc"
#########################################################################################


# The output log file
train_out_file = "../dump/" + modelname + "/train.out"
train_out = open(train_out_file).readlines()

all_losses = []
for line in train_out:
	# If the line states the validation perplexity
	if "INFO] Validation perplexity" in line:
		print(line)
		# Transform the loss to a redable value
		if modelname == "ce":
			loss = float(line.split(":")[-1].strip())/100.0
		else:
			loss = float(line.split(":")[-1].split('e')[0].strip())/10.0
		all_losses.append(loss)

# We don't want to print all the losses. Store losses at a specific interval.		
losses = []
for i in range(14):
	index = i * 3 + 0
	loss = float(all_losses[index])
	losses.append(loss)
print(losses)
#########################################################################################


# Plot the losses against steps
x_steps = [(i+1)*5000 for i in range(14)]
plt.plot(x_steps, losses, label="Loss/10")
plt.legend()
plt.title(modelname + " ( " + valname + " ) validation stats")
plt.xlabel("steps")
plt.savefig(dump + modelname + "/" + valname + "/valplot.png")
plt.show()
#########################################################################################
