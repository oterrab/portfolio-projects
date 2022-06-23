#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jun 19 16:32:17 2022

@author: lucaspb
"""

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

data_inep  = pd.read_excel('educacao-es/input/inep-resultado_final_anexo_1_.xlsx', skiprows=4872, nrows=474)
data_inep.columns = ['c0','infantil creche parcial', 'infantil creche integral', 'infantil preescola parcial', 
                     'infantil preescola integral', 'fundamental iniciais parcial', 'fundamental iniciais integral',
                     'fundamental finais parcial', 'fundamental finais integral', 'medio Parcial', 'medio integral', 
                     'eja fundamental', 'eja medio']

# Generating new table with students from middle school from each city
        
df_medio = pd.DataFrame(columns=['cidades','Estadual', 'Estadual Urbana', 'Estadual Rural','Municipal', 'Municipal Urbana', 'Municipal Rural', 'Estadual e Municipal'])
for index, row in data_inep.iterrows():
    if data_inep.loc[index, 'c0'].isupper() == True:
        df_medio.loc[index, 'cidades'] = data_inep.loc[index, 'c0']
        df_medio.loc[index, 'Estadual'] = data_inep.loc[index+1, 'medio Parcial'] + data_inep.loc[index+1, 'medio integral'] + data_inep.loc[index+2, 'medio Parcial'] + data_inep.loc[index+2, 'medio integral']    
        df_medio.loc[index, 'Estadual Urbana'] = data_inep.loc[index+1, 'medio Parcial'] + data_inep.loc[index+1, 'medio integral']
        df_medio.loc[index, 'Estadual Rural'] = data_inep.loc[index+2, 'medio Parcial'] + data_inep.loc[index+2, 'medio integral']    
        df_medio.loc[index, 'Municipal'] = data_inep.loc[index+3, 'medio Parcial'] + data_inep.loc[index+3, 'medio integral'] + data_inep.loc[index+4, 'medio Parcial'] + data_inep.loc[index+4, 'medio integral']
        df_medio.loc[index, 'Municipal Urbana'] = data_inep.loc[index+3, 'medio Parcial'] + data_inep.loc[index+3, 'medio integral']
        df_medio.loc[index, 'Municipal Rural'] = data_inep.loc[index+4, 'medio Parcial'] + data_inep.loc[index+4, 'medio integral']
        df_medio.loc[index, 'Estadual e Municipal'] = data_inep.loc[index+5, 'medio Parcial'] + data_inep.loc[index+5, 'medio integral']       
     
## Plotting

plt.figure(figsize=(15,18))
sns.barplot(data=df_medio.iloc[1:], x='cidades', y='Estadual e Municipal')
plt.xticks(rotation = 90)

plt.savefig('educacao-es/output/images/medioalunosxcidade.png', quality=95, dpi=600)

## Plotting Students from Urban versus Rural setting

df_medio = df_medio.sort_values(['Estadual Urbana'], ascending=False).reset_index(drop=True)

xticks = df_medio.iloc[1:,0]
bars1 = df_medio.iloc[1:,2].astype('float')
bars2 = df_medio.iloc[1:,3].astype('float')

barWidth1 = 0.065
barWidth2 = 0.032
x_range = np.arange(len(bars1) / 8, step=0.125)

plt.bar(x_range, bars1, color='#dce6f2', width=barWidth1/2, edgecolor='#c3d5e8', label='Urban')
plt.bar(x_range, bars2, color='#ffc001', width=barWidth2/2, edgecolor='#c3d5e8', label='Rural')
#for i, bar in enumerate(bars2):
#    plt.text(i / 8 - 0.015, bar + 1, bar, fontsize=14)
    
plt.xticks(x_range, xticks, rotation = 90)
plt.tick_params(
    bottom=False,
    left=False,
    labelsize=15
)
plt.rcParams['figure.figsize'] = [25, 7]
plt.axhline(y=0, color='gray')
plt.legend(frameon=False, loc='best', prop={'size':20})
plt.box(False)
plt.savefig('educacao-es/output/images/mediourbanoxmediorural.png', quality=95, dpi=600, bbox_inches = "tight")
plt.show()


# Doing Students per School ratio

## Lower case
df_medio = df_medio.applymap(lambda s: s.lower() if type(s) == str else s)

## Removing accentuation
cols = df_medio.select_dtypes(include=[np.object]).columns
df_medio[cols] = df_medio[cols].apply(lambda x: x.str.normalize('NFKD').str.encode('ascii', errors='ignore').str.decode('utf-8'))
        

df_escolas = df_sccount.groupby(['Municipio']).count().reset_index()
df_medio = df_medio.reset_index(inplace=True)

df_result = pd.merge(pd.DataFrame(df_medio), pd.DataFrame(df_escolas), left_on=['cidades'], 
             right_on= ['Municipio'], how='left')

df_result = df_result.dropna()
df_result.rename(columns={'Inep':'escolas'}, inplace = True)
del(df_result['Municipio'])

df_result['ratio'] = df_result['Estadual'] / df_result['escolas']
df_result = df_result.sort_values(['ratio'], ascending=False).reset_index(drop=True)


plt.figure(figsize=(15,18))
sns.barplot(data=df_result, x='ratio', y='cidades', palette='Blues_d')
sns.despine(left=True, bottom=True)
plt.tight_layout()
plt.savefig('educacao-es/output/images/ratiostudentperschool.png', quality=95, dpi=600, bbox_inches = "tight")
plt.show()


###

# Generating new table with students from fundamental school from each city
        
df_medio = pd.DataFrame(columns=['cidades','Estadual', 'Estadual Urbana', 'Estadual Rural','Municipal', 'Municipal Urbana', 'Municipal Rural', 'Estadual e Municipal'])
for index, row in data_inep.iterrows():
    if data_inep.loc[index, 'c0'].isupper() == True:
        df_medio.loc[index, 'cidades'] = data_inep.loc[index, 'c0']
        df_medio.loc[index, 'Estadual'] = data_inep.loc[index+1, 'medio Parcial'] + data_inep.loc[index+1, 'medio integral'] + data_inep.loc[index+2, 'medio Parcial'] + data_inep.loc[index+2, 'medio integral']    
        df_medio.loc[index, 'Estadual Urbana'] = data_inep.loc[index+1, 'medio Parcial'] + data_inep.loc[index+1, 'medio integral']
        df_medio.loc[index, 'Estadual Rural'] = data_inep.loc[index+2, 'medio Parcial'] + data_inep.loc[index+2, 'medio integral']    
        df_medio.loc[index, 'Municipal'] = data_inep.loc[index+3, 'medio Parcial'] + data_inep.loc[index+3, 'medio integral'] + data_inep.loc[index+4, 'medio Parcial'] + data_inep.loc[index+4, 'medio integral']
        df_medio.loc[index, 'Municipal Urbana'] = data_inep.loc[index+3, 'medio Parcial'] + data_inep.loc[index+3, 'medio integral']
        df_medio.loc[index, 'Municipal Rural'] = data_inep.loc[index+4, 'medio Parcial'] + data_inep.loc[index+4, 'medio integral']
        df_medio.loc[index, 'Estadual e Municipal'] = data_inep.loc[index+5, 'medio Parcial'] + data_inep.loc[index+5, 'medio integral']       
   
