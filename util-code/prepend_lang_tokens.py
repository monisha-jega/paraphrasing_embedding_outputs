#########################################################################################
# Prepends language start tokens to the data points based no the target language 
# descriptors in the .lang file.									
#
#########################################################################################

import sys
#########################################################################################

# Define the language descriptors
EN_DESCRIPTOR = "En"
FR_DESCRIPTOR = "Fr"
# Define the language specific start tokens
EN_START_TOKEN = "<es>"
FR_START_TOKEN = "<fs>"

# Type of data - train/val/test - used to name the output .lang file
datatype = "train.shuffled"

# The root data folder
folder = sys.argv[1]
# The sub-folder inside the root data folder that contains the training files.
name = sys.argv[2]
#########################################################################################


# Open the source data
src_file = folder + name + datatype + ".src"
src = open(src_file, 'r', encoding='utf-8').readlines()
# Open the lang descriptors for the data
lang_file = folder + name + datatype + ".lang"
lang = open(lang_file, 'r', encoding='utf-8').readlines()
# Open the target data
tgt_file = folder + name + datatype + ".tgt"
tgt = open(tgt_file, 'r', encoding='utf-8').readlines()
#########################################################################################



# Create a new source file inside trans/ subfolder
new_src_filename = folder + name + "trans/" + datatype + ".src"
new_src_file = open(new_src_filename, 'w', encoding='utf-8')
# Create a new target file inside trans/ subfolder
new_tgt_filename = folder + name + "trans/" + datatype + ".tgt"
new_tgt_file = open(new_tgt_filename, 'w', encoding='utf-8')

# Iterate through each data instance and rewrite it in the new source
# and target files with the language token corresponding to the target
# language prepended
for sl, ll, tl in zip(src, lang, tgt):
	# Assign start token based on language descriptor in the .lang file
	if ll.strip() == FR_DESCRIPTOR:
		start = FR_START_TOKEN
	elif ll.strip() == EN_DESCRIPTOR:
		start = EN_START_TOKEN
	else:
		print("Invalid Language Descriptor")
	# Prepend start token to source data and write in new source file
	new_sl = start + " " + sl.strip() + "\n"
	new_src_file.write(new_sl)
	# Prepend start token to target data and write in new target file
	new_tl = start + " " + tl.strip() + "\n"
	new_tgt_file.write(new_tl)

# Close file objects
new_src_file.close()
new_tgt_file.close()
#########################################################################################
