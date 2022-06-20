
#packages

import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import warnings

pd.set_option('display.max_columns', 500)
pd.set_option('display.max_rows', 500)

# Setting working directory

os.chdir(r'/Users/lucaspb/git-repositories/portifolio-projects')

#Importing Data

data_rendimento  = pd.read_csv('educacao-es/input/DADOSRENDIMENTO.csv')


#Getting to know the data

data_rendimento.head()
data_rendimento.shape
data_rendimento.info()
data_rendimento.isnull().sum()
data_rendimento.nunique()
data_rendimento.columns

data_rendimento.groupby('Ano').Ano.nunique()

## Plotting just to have a boarder view

df = data_rendimento[['Municipio','NivelOrganizacional', 'Turno', 'TipoEnsino', 'Serie', 'Modalidade', 'Submodalidade']]

for i in df.columns:
  plt.figure(figsize=(15,6))
  sns.countplot(df[i],data=df,palette='hls')
  plt.xticks(rotation = 90)
  plt.show()


# Data need more cleaning
df = data_rendimento[data_rendimento['Ano'] == 2022]
## Lower case
df = df.applymap(lambda s: s.lower() if type(s) == str else s)

## Removing accentuation
cols = df.select_dtypes(include=[np.object]).columns
df[cols] = df[cols].apply(lambda x: x.str.normalize('NFKD').str.encode('ascii', errors='ignore').str.decode('utf-8'))


# Plotting Municipios

## Lets plot Schools x Counties
df_sccount = df[['Inep','Municipio']]

# df_sccount.groupby('Inep').Municipio.nunique()

### Agregating by Inep which is a unique number of a school in Brazil
aggregation_dict = {'Inep': 'first', 'Municipio': 'first'}
df_sccount = df_sccount.groupby(df_sccount['Inep']).aggregate(aggregation_dict).reset_index(drop=True)

### Just confirming if there is not any error with Inep Unique numbers
# df_sccount[df_sccount.duplicated(['Inep'], keep=False)].sort_values("Inep")
# or
#pd.concat(g for _, g in df_sccount.groupby("Inep") if len(g) > 1)


### Finally plotting
plt.figure(figsize=(30,18))
sns.countplot(df_sccount['Municipio'],data=df_sccount,palette='hls',
              order = df_sccount['Municipio'].value_counts().index)
plt.xticks(rotation = 90)

plt.savefig('educacao-es/output/images/escolaxmunicipios.png', quality=95, dpi=600)


# Plotting Turnos

df_turnos = df[['Inep', 'Turno', 'Escola']]

## Specific data cleaning
df_turnos['Turno'].replace({'intermediario - manha': 'manha'}, regex=True, inplace=True)
df_turnos['Turno'].replace({'intermediario - tarde': 'tarde'}, regex=True, inplace=True)


## subsetting turnos and aggregating

group = df_turnos.groupby('Inep')

df_turnos2 = group.apply(lambda x: x['Turno'].unique())
df_turnos2 = df_turnos2.apply(pd.Series)
df_turnos2 = df_turnos2.reset_index()

df_turnosmelted = df_turnos2.melt(value_vars=df_turnos2.columns)
df_turnosmelted = df_turnosmelted.dropna()

## Plotting
order = ['manha', 'tarde', 'noite', 'integral']

plt.figure(figsize=(15,12))
sns.countplot(data=df_turnosmelted, x="value", palette='hls',
              order = order)
plt.xticks(rotation = 90)

plt.savefig('educacao-es/output/images/turno.png', quality=95, dpi=600)
