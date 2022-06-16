# Importing packages

import os
import pandas as pd
# Terminal / Anaconda Navigator: conda install -c conda-forge textblob
from textblob import TextBlob
import matplotlib.pyplot as plt



# Setting working directory

os.chdir(r'/Users/lucaspb/git-repositories/portifolio-projects')


                        #############################
                        #                           #
                        #     Sentiment Analysis    #
                        #                           #
                        #############################

# We'll start by reading in the corpus, which preserves word order

data = pd.read_pickle('nlp-learning/output/corpus/corpus2.pkl')
data

# Create quick lambda functions to find the polarity and subjectivity of each routine

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
plt.plot(data.polarity)
plt.title('Polarity')
fig1 = plt.gcf()
fig1

# Save
fig1.savefig('nlp-learning/output/images/polarity.png', quality=95, dpi=1000)

# Show the plot for subjectivity
plt.plot(data.subjectivity)
plt.title('Subjectivity')
fig1 = plt.gcf()
fig1

# Save
fig1.savefig('nlp-learning/output/images/subjectivity.png', quality=95, dpi=1000)


## together

plt.plot(data.polarity, 'r', label='polarity')
plt.plot(data.subjectivity, 'b', label='subjectivity')
plt.title('Class Sentiment Analysis', fontsize=22)
plt.grid(axis='y', alpha=.3)
plt.legend(loc="bottom left")
plt.axhline(y=0, xmin=0, xmax=9, color='orange')

# Lighten borders
plt.gca().spines["top"].set_alpha(.3)
plt.gca().spines["bottom"].set_alpha(.3)
plt.gca().spines["right"].set_alpha(.3)
plt.gca().spines["left"].set_alpha(.3)

# limits
plt.ylim(0, 1)    
plt.xlim(0, 9) 


fig1 = plt.gcf()
fig1


fig1.savefig('nlp-learning/output/images/sentiment1.png', quality=95, dpi=1000)



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
ax.set_title('Class Sentiment Analysis', fontsize=18)
ax.set(ylim=[0, 1])
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


fig1.savefig('nlp-learning/output/images/sentiment2.png', quality=95, dpi=1000)