# Setting working directory

import os
os.chdir(r'F:\Arquivos Acadêmicos\UFMG\Doutorado\Resultados\Python')


                        #############################
                        #                           #
                        #                           #
                        #                           #
                        #############################

# open text
                        
with open('NLP/data/rochel.txt', 'r', encoding='utf-8') as df:
   text = df.read()
   

# separate each sentence in the text
## nltk.download('averaged_perceptron_tagger')
from nltk.tokenize import sent_tokenize
sent_tokens = sent_tokenize(text)


# clean each sentence

import re
import string

def clean_text_round1(text):
    '''Make text lowercase, remove text in square brackets, remove punctuation and remove words containing numbers.'''
    text = text.lower()
    text = re.sub('\[.*?\]', '', text)
    text = re.sub('[%s]' % re.escape(string.punctuation), '', text)
    text = re.sub('\w*\d\w*', '', text)
    return text

round1 = lambda x: clean_text_round1(x)

clean_sentences1 = list(map(round1, sent_tokens)); clean_sentences1

def clean_text_round2(text):
    '''Get rid of some additional punctuation and non-sensical text that was missed the first time around.'''
    text = re.sub('[‘’“”…]', '', text)
    text = re.sub('\n', '', text)
    return text

round2 = lambda x: clean_text_round2(x)

clean_sentences2 = list(map(round2, clean_sentences1)); clean_sentences2


# apply word token to each sentence token in the list
from nltk.tokenize import word_tokenize

wt = lambda x: word_tokenize(x)
untagged_tokens = list(map(wt, clean_sentences2)); untagged_tokens

# tag each word

from nltk.tag import pos_tag

tagged_tokens=[]
for token in untagged_tokens:
    tagged_tokens.append(pos_tag(token))

# extract only nouns from the list
nouns = []
for i in tagged_tokens:
    temp = [j[0] for j in i if j[1].startswith("NN" or 'NNP' or 'NNS' or 'NNPS')]
    nouns.append(temp)
    


                        #############################
                        #                           #
                        #  Redacting Names with NER #
                        #                           #
                        #############################

import spacy
from spacy import displacy # for visualization
import en_core_web_sm
nlp = en_core_web_sm.load()
import textacy

           
# Parse the text with spaCy. This runs the entire NLP pipeline.
doc = nlp(text)


# Redacting

def redact_names(text):
    doc = nlp(text)
    redacted_sentence = []
    for ent in doc.ents:
        ent.merge()
    for token in doc:
        if token.ent_type_ == "PERSON":
            redacted_sentence.append("[REDACTED]")
        else:
            redacted_sentence.append(token.string)
    return "".join(redacted_sentence)

redact_names(text)



                        #############################
                        #                           #
                        #     Dependency Parsing    # 
                        #                           #
                        #############################


import spacy
from spacy import displacy
from pathlib import Path
nlp = spacy.load('en_core_web_sm', parse=True, tag=True, entity=True)

# open text
                        
with open('NLP/data/rochel.txt', 'r', encoding='utf-8') as df:
   text = df.read()

# Visualizing
## open at :  localhost:5000

doc = nlp(text)
sentence_spans = list(doc.sents)
displacy.serve(sentence_spans, style="dep", options = {"compact": True, "color": "black", "collapse_punct": True})

# Rendering  
    
count = 1
doc = nlp(text)

sentence_spans = list(doc.sents)
    
for sent in sentence_spans:
    svg = displacy.render(sent, style="dep", jupyter=False, options={"compact": True, "color": "black", "collapse_punct": True})
    file_name = str(count) + ".svg"
    count = int(count) + 1
    output_path = Path("NLP/output/images/rochel/" + file_name)
    output_path.open("w", encoding="utf-8").write(svg)



                        #############################
                        #                           #
                        #     rel    # 
                        #                           #
                        #############################




#for token in doc:
#    print(token.i, token.text, token.tag_, token.head.text, token.lemma_, 
#          token.pos_, token.dep_)

content = "When I combine two molecules, two hydrogen atoms to make the molecule H2, ok, I can draw a diagram of the energy that is more or less like this here, is that cool, folks?"
doc = nlp(content)

for token in doc:
    print(token.head.text, token.dep_, token.text)


    
for chunk in doc.noun_chunks:
    print (chunk)
    










from __future__ import unicode_literals, print_function

import plac
import spacy



#### TESTAR AINDA

relations = []
    for money in filter(lambda w: w.ent_type_ == "MONEY", doc):
        if money.dep_ in ("attr", "dobj"):
            subject = [w for w in money.head.lefts if w.dep_ == "nsubj"]
            if subject:
                subject = subject[0]
                relations.append((subject, money))
        elif money.dep_ == "pobj" and money.head.dep_ == "prep":
            relations.append((money.head.head, money))
    return relations




