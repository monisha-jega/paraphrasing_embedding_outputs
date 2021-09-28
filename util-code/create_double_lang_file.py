#########################################################################################
# Creates a .lang file for a given dataset, containing the target language descriptors
# for each data point. This is only used for the ParaVMF model. The .lang file will
# contain 'translation_data_size' data points for French to English translation,
# followed by translation_data_size' data points for English to French translation, 
# followed by "autoencoding_data_size" data points for X to X autoencoding where X is the
# 'autoencoding_lang'. This .lang file will be used to prepend language specific start
# tokens to the data.
# 
#########################################################################################

import sys
#########################################################################################

# Define the language descriptors
EN_DESCRIPTOR = "En"
FR_DESCRIPTOR = "Fr"

# Type of data - train/val/test - used to name the output .lang file
datatype = "train"
# The number of translation data points in a single direction
translation_data_size = 2000000


# The root data folder
folder = sys.argv[1]
# The sub-folder inside the root data folder that contains the training files.
name = sys.argv[2]
# The number of autoencoding data points
autoencoding_data_size = int(sys.argv[3])
#########################################################################################


# Create a new .lang file
f = open(folder + name + datatype + ".lang", 'w')

# Target language is English for the first half of translation data points
for i in range(translation_data_size):
	f.write(EN_DESCRIPTOR + "\n")
# Target language is French for the second half of translation data points
for i in range(translation_data_size):
	f.write(FR_DESCRIPTOR + "\n")
	# Target language is French for the first half of autoencoding data pointss
for i in range(autoencoding_data_size):
	f.write(FR_DESCRIPTOR + "\n")
# Target language is English for the second half of autoencoding data pointss
for i in range(autoencoding_data_size):
	f.write(EN_DESCRIPTOR + "\n")
#########################################################################################


