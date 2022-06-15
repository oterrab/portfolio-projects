# Setting working directory

import os
os.chdir(r'F:\Arquivos Acadêmicos\UFMG\Doutorado\Resultados\Python')


                        #############################
                        #                           #
                        #     Sentiment Analysis    #
                        #                           #
                        #############################

# We'll start by reading in the corpus, which preserves word order
import pandas as pd

data = pd.read_pickle('NLP/output/corpus/corpus2.pkl')
data

# Create quick lambda functions to find the polarity and subjectivity of each routine
# Terminal / Anaconda Navigator: conda install -c conda-forge textblob
from textblob import TextBlob

pol = lambda x: TextBlob(x).sentiment.polarity
sub = lambda x: TextBlob(x).sentiment.subjectivity

data['polarity'] = data['transcript'].apply(pol)
data['subjectivity'] = data['transcript'].apply(sub)
data

                        #############################
                        #                           #
                        #          Plotting         #
                        #                           #
                        #############################

# Show the plot for polarity
import matplotlib.pyplot as plt
plt.plot(data.polarity)
plt.title('Rochel')
fig1 = plt.gcf()
fig1

# Save
fig1.savefig('NLP/output/images/polarityrochel.png', quality=95, dpi=1000)


# Show the plot for subjectivity
import matplotlib.pyplot as plt
plt.plot(data.subjectivity)
plt.title('Rochel')
fig1 = plt.gcf()
fig1

# Save
fig1.savefig('NLP/output/images/subjrochel.png', quality=95, dpi=1000)


## together


plt.plot(data.polarity, 'r', label='polarity')
plt.plot(data.subjectivity, 'b', label='subjectivity')
plt.title('Rochel Class Sentiment Analysis', fontsize=22)
plt.grid(axis='y', alpha=.3)
plt.legend(loc="bottom left")
plt.axhline(y=0, xmin=0, xmax=9, color='orange')

# Lighten borders
plt.gca().spines["top"].set_alpha(.3)
plt.gca().spines["bottom"].set_alpha(.3)
plt.gca().spines["right"].set_alpha(.3)
plt.gca().spines["left"].set_alpha(.3)

# limits
plt.ylim(-1, 1)    
plt.xlim(0, 9) 


fig1 = plt.gcf()
fig1


fig1.savefig('NLP/output/images/sentimentrochel.png', quality=95, dpi=1000)



                        #############################
                        #                           #
                        #     Plotting Beatiful     #
                        #                           #
                        #############################


# Prepare Data
x = list(range(0,10))
x = [int(i) for i in x]
y1 = data['polarity'].values.tolist()
y2 = data['subjectivity'].values.tolist()
mycolors = ['tab:red', 'tab:blue', 'tab:green', 'tab:orange', 'tab:brown', 'tab:grey', 'tab:pink', 'tab:olive']      
columns = ['polarity', 'subjectivity']


# Draw Plot 

fig, ax = plt.subplots(1, 1, figsize=(16,9), dpi= 80)
ax.fill_between(x, y1=y1, y2=0, label=columns[1], alpha=0.9, color=mycolors[1], linewidth=2)
ax.fill_between(x, y1=y2, y2=0, label=columns[0], alpha=0.2, color=mycolors[2], linewidth=2)

# Decorations
ax.set_title('Rochel Class Sentiment Analysis', fontsize=18)
ax.set(ylim=[-1, 1])
ax.legend(loc='best', fontsize=12)
plt.xlim(0, 9)
plt.grid(axis='y', which='major', alpha=.3, linestyle="--", lw=0.5, color='black')

    
# Lighten borders
plt.gca().spines["top"].set_alpha(0)
plt.gca().spines["bottom"].set_alpha(.3)
plt.gca().spines["right"].set_alpha(0)
plt.gca().spines["left"].set_alpha(.3)

fig1 = plt.gcf()
fig1


fig1.savefig('NLP/output/images/sentimentrochel.png', quality=95, dpi=1000)




                        #############################
                        #                           #
                        #      Splitting Text       #
                        #                           #
                        #############################



 with open('NLP/data/rochel.txt', 'r', encoding='utf-8') as df:
   text = df.read()
     text = "".join(text.splitlines())
     text = text.replace("\t", " ")
   data = text


# Function to split each routine into 10 parts
import numpy as np
import math

def split_text(text, n=10):
    '''Takes in a string of text and splits into n equal parts, with a default of 10 equal parts.'''

    # Calculate length of text, the size of each chunk of text and the starting points of each chunk of text
    length = len(text)
    size = math.floor(length / n)
    start = np.arange(0, length, size)
    
    # Pull out equally sized pieces of text and put it into a list
    split_list = []
    for piece in range(n):
        split_list.append(text[start[piece]:start[piece]+size])
    return split_list

# Let's create a list to hold all of the pieces of text
list_pieces = []

    split = split_text(data)
    list_pieces.append(split)
    
list_pieces


def splitter(n, s):
    pieces = s.split()
    return (" ".join(pieces[i:i+n]) for i in xrange(0, len(pieces), n)

for piece in splitter(1000, really_long_string):
    print piece







