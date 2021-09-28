#########################################################################################
# TED Metric Calculator                       
#
#########################################################################################


from apted.helpers import Tree
from apted.apted import APTED
import sys
from tree_utils import *
#########################################################################################

# The two parse files between which edit distane is to be computed
parse_file_1 = sys.argv[1]
parse_file_2 = sys.argv[2]

# Height to prune the parse trees to before computing TED
PRUNE_TO_HEIGHT = 5
#########################################################################################


# Remove terminals from the parse, prune it, and format it
def preprocess_parse(parse):
    #Remove terminals
    parse = remove_terminals(parse)
    #Prune to 3 levels
    parse = prune(parse, PRUNE_TO_HEIGHT)
    #Replace brackets and spaces
    parse = parse.replace(" ", "").replace("(", "{").replace(")", "}").strip()
    #print(parse)
    return parse
#########################################################################################


parses1 = open(parse_file_1, 'r', encoding='utf-8').readlines()
parses2 = open(parse_file_2, 'r', encoding='utf-8').readlines()
print("Total lines to parse: ", len(parses1), len(parses2))
#########################################################################################


errors = 0
p = 0
teds = []
for parse1, parse2 in zip(parses1, parses2):
    
    sent_parses1 = parse1.split("#")
    sent_parses2 = parse2.split("#")
    if "" in sent_parses1 or "" in sent_parses2:
        # If one of the parses is empty, ignore
        continue
    num_sents = min(len(sent_parses1), len(sent_parses2))

    ted = 0
    for i in range(num_sents):
        sent_parse1 = preprocess_parse(sent_parses1[i])
        sent_parse2 = preprocess_parse(sent_parses2[i])
        trees = [sent_parse1, sent_parse2]
        try:
            #print(trees)
            tree1, tree2 = map(Tree.from_text, trees)
            apted = APTED(tree1, tree2)
            ted += apted.compute_edit_distance()
        except:
            # Error in computing TED
            errors += 1
    teds.append(ted)

    if p % 1000 == 0:
        print(str(p) + " lines processed")
    p += 1
    

# TED
avg_ted = sum(teds)/float(len(teds))
print(avg_ted)
print("Error lines: ", errors)
#########################################################################################



