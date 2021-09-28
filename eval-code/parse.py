#########################################################################################
# Constituency Parser using StanfordCoreNLP                        
#
#########################################################################################


import sys
from pycorenlp import StanfordCoreNLP
#########################################################################################


# Connect to Stanford Server
# To start server, run:
# java -mx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9000 -timeout 15000
nlp = StanfordCoreNLP('http://localhost:9000')
#########################################################################################


# File to parse
name = sys.argv[1]
lines = open(name, 'r', encoding = "utf-8").readlines()
# Parse output file
f = open(name + ".parse", 'w', encoding="utf-8")
#########################################################################################


print("Parsing: " + name)
for l, line in enumerate(lines):
  output = nlp.annotate(line, properties={
                            'annotators': 'parse',
                            'outputFormat': 'json'
                                        })
  try:
    if type(output) is not dict:
      f.write("\n")
      continue
    parses = []
    for sent in output['sentences']:
      parse = sent['parse']
      # Convert parse to a single line
      parse = parse.replace("\n", "")
      parses.append(parse)
    f.write("#".join(parses) + "\n")
  except:
    print(" Error")
    print(line)
    print(output)
    break;

  if l % 1000 == 0:
    print(str(l) + " lines parsed.")
f.close()
#########################################################################################
