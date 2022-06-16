# Importing packages

import os
import pandas as pd
from sklearn.feature_extraction import text 
from sklearn.feature_extraction.text import CountVectorizer
import pickle
# Terminal / Anaconda Prompt: conda install -c conda-forge wordcloud
from wordcloud import WordCloud
# pip install matplotlib.pyplot
import matplotlib.pyplot as plt
import numpy as np
#pip install PIL
from PIL import Image


# Setting working directory

os.chdir(r'/Users/lucaspb/git-repositories/portifolio-projects')


                        #############################
                        #                           #
                        # Exploratory Data Analysis #
                        #                           #
                        #############################


#############################
#                           #
#        Wordcloud          #
#                           #
#############################

# Read in the document-term matrix

data = pd.read_pickle('nlp-learning/output/corpus/dtm.pkl')
data = data.transpose()
data.head()

# Find the top 30 words said by the professor
top_dict = {}
for c in data.columns:
    top = data[c].sort_values(ascending=False).head(30)
    top_dict[c]= list(zip(top.index, top.values))

top_dict

# Let's make a list of these common words to be excluded from the list
add_stop_words = ['ok', 'right','little','form', 'thats', 'got', 'called', 'folks', 'cool', 'process']
add_stop_words

# Let's update our document-term matrix with the new list of stop words
# Read in cleaned data
data_clean = pd.read_pickle('nlp-learning/output/corpus/data_clean.pkl')

# Add new stop words
stop_words = text.ENGLISH_STOP_WORDS.union(add_stop_words)

# Recreate document-term matrix
cv = CountVectorizer(stop_words=stop_words)
data_cv = cv.fit_transform(data_clean.transcript)
data_stop = pd.DataFrame(data_cv.toarray(), columns=cv.get_feature_names())
data_stop.index = data_clean.index

# Transposing and joining data counted
data_stop = data_stop.transpose()
data_stop['Rochel']= data_stop.sum(axis=1)
data_stop.drop(data_stop.columns.difference(['Rochel']), 1, inplace=True)
print (data_stop.head(5))
data_stop = data_stop.transpose()

# Pickle it for later use
pickle.dump(cv, open("nlp-learning/output/corpus/cv_stop.pkl", "wb"))
data_stop.to_pickle("nlp-learning/output/corpus/dtm_stop.pkl")

# Let's make some word clouds!
currdir = os.path.dirname(os.path.realpath('__file__'))
mask = np.array(Image.open(os.path.join("nlp-learning/input/cloud.png")))

wcdata = ' '.join(data_clean.transcript)

wc = WordCloud(stopwords=stop_words, background_color="white", colormap="Dark2",
               max_font_size=150, mask=mask, random_state=42).generate(wcdata)

# Create wordcloud plot
plt.rcParams['figure.figsize'] = [16, 6]
plt.imshow(wc, interpolation="bilinear")
plt.axis("off")
fig1 = plt.gcf()
fig1


# Save wordcloud plot

fig1.savefig('nlp-learning/output/images/wordcloud.png', quality=95, dpi=1000)