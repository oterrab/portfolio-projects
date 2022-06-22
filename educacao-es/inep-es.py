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
         
        

        