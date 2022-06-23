#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jun 22 22:09:54 2022

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

#Importing Student Data

df_alunos  = pd.read_excel('educacao-es/input/inep-resultado_final_anexo_1_.xlsx', skiprows=4872, nrows=474)
df_alunos.columns = ['c0','infantil creche parcial', 'infantil creche integral', 'infantil preescola parcial', 
                     'infantil preescola integral', 'fundamental iniciais parcial', 'fundamental iniciais integral',
                     'fundamental finais parcial', 'fundamental finais integral', 'medio parcial', 'medio integral', 
                     'eja fundamental', 'eja medio']

# Generating a table with all students from middle school

df_medio = pd.DataFrame(columns=['cidades','estadual', 'estadual urbana', 'estadual rural','municipal', 'municipal urbana', 'municipal rural', 'estadual e municipal'])
for index, row in df_alunos.iterrows():
    if df_alunos.loc[index, 'c0'].isupper() == True:
        df_medio.loc[index, 'cidades'] = df_alunos.loc[index, 'c0']
        df_medio.loc[index, 'estadual'] = (df_alunos.loc[index+1, 'medio parcial'] 
        + df_alunos.loc[index+1, 'medio integral'] 
        + df_alunos.loc[index+1, 'eja medio'] 
        + df_alunos.loc[index+2, 'medio parcial'] 
        + df_alunos.loc[index+2, 'medio integral']   
        + df_alunos.loc[index+2, 'eja medio'])
        df_medio.loc[index, 'estadual urbana'] = (df_alunos.loc[index+1, 'medio parcial'] 
        + df_alunos.loc[index+1, 'medio integral'] 
        + df_alunos.loc[index+1, 'eja medio'])
        df_medio.loc[index, 'estadual rural'] = (df_alunos.loc[index+2, 'medio parcial'] 
        + df_alunos.loc[index+2, 'medio integral']   
        + df_alunos.loc[index+2, 'eja medio'])
        df_medio.loc[index, 'municipal'] = (df_alunos.loc[index+3, 'medio parcial'] 
        + df_alunos.loc[index+3, 'medio integral'] 
        + df_alunos.loc[index+3, 'eja medio']
        + df_alunos.loc[index+4, 'medio parcial'] 
        + df_alunos.loc[index+4, 'medio integral']
        + df_alunos.loc[index+4, 'eja medio'])
        df_medio.loc[index, 'municipal urbana'] = (df_alunos.loc[index+3, 'medio parcial'] 
        + df_alunos.loc[index+3, 'medio integral']
        + df_alunos.loc[index+3, 'eja medio'])
        df_medio.loc[index, 'municipal rural'] = (df_alunos.loc[index+4, 'medio parcial'] 
        + df_alunos.loc[index+4, 'medio integral']
        + df_alunos.loc[index+4, 'eja medio'])
        df_medio.loc[index, 'estadual e municipal'] = (df_alunos.loc[index+5, 'medio parcial'] 
        + df_alunos.loc[index+5, 'medio integral'] 
        + df_alunos.loc[index+5, 'eja medio'])
     
## Lower case
df_medio = df_medio.applymap(lambda s: s.lower() if type(s) == str else s)

## Removing accentuation
cols = df_medio.select_dtypes(include=[np.object]).columns
df_medio[cols] = df_medio[cols].apply(lambda x: x.str.normalize('NFKD').str.encode('ascii', errors='ignore').str.decode('utf-8'))

del(index, row, cols)

# Generating a table with all students from fundamental school

df_fund = pd.DataFrame(columns=['cidades','estadual', 'estadual urbana', 'estadual rural','municipal', 'municipal urbana', 'municipal rural', 'estadual e municipal'])
for index, row in df_alunos.iterrows():
    if df_alunos.loc[index, 'c0'].isupper() == True:
        df_fund.loc[index, 'cidades'] = df_alunos.loc[index, 'c0']
        df_fund.loc[index, 'estadual'] = (df_alunos.loc[index+1, 'fundamental iniciais parcial'] 
        + df_alunos.loc[index+1, 'fundamental iniciais integral'] 
        + df_alunos.loc[index+1, 'fundamental finais parcial'] 
        + df_alunos.loc[index+1, 'fundamental finais integral'] 
        + df_alunos.loc[index+1, 'eja fundamental']
        + df_alunos.loc[index+2, 'fundamental iniciais parcial'] 
        + df_alunos.loc[index+2, 'fundamental iniciais integral']   
        + df_alunos.loc[index+2, 'fundamental finais parcial'] 
        + df_alunos.loc[index+2, 'fundamental finais integral'] 
        + df_alunos.loc[index+2, 'eja fundamental'])
        df_fund.loc[index, 'estadual urbana'] = (df_alunos.loc[index+1, 'fundamental iniciais parcial'] 
        + df_alunos.loc[index+1, 'fundamental iniciais integral'] 
        + df_alunos.loc[index+1, 'fundamental finais parcial'] 
        + df_alunos.loc[index+1, 'fundamental finais integral']
        + df_alunos.loc[index+1, 'eja fundamental'])
        df_fund.loc[index, 'estadual rural'] = (df_alunos.loc[index+2, 'fundamental iniciais parcial'] 
        + df_alunos.loc[index+2, 'fundamental iniciais integral']   
        + df_alunos.loc[index+2, 'fundamental finais parcial'] 
        + df_alunos.loc[index+2, 'fundamental finais integral']  
        + df_alunos.loc[index+2, 'eja fundamental'])
        df_fund.loc[index, 'municipal'] = (df_alunos.loc[index+3, 'fundamental iniciais parcial'] 
        + df_alunos.loc[index+3, 'fundamental iniciais integral'] 
        + df_alunos.loc[index+3, 'fundamental finais parcial'] 
        + df_alunos.loc[index+3, 'fundamental finais integral'] 
        + df_alunos.loc[index+3, 'eja fundamental']
        + df_alunos.loc[index+4, 'fundamental iniciais parcial'] 
        + df_alunos.loc[index+4, 'fundamental iniciais integral'] 
        + df_alunos.loc[index+4, 'fundamental finais parcial'] 
        + df_alunos.loc[index+4, 'fundamental finais integral']
        + df_alunos.loc[index+4, 'eja fundamental'])
        df_fund.loc[index, 'municipal urbana'] = (df_alunos.loc[index+3, 'fundamental iniciais parcial'] 
        + df_alunos.loc[index+3, 'fundamental iniciais integral'] 
        + df_alunos.loc[index+3, 'fundamental finais parcial'] 
        + df_alunos.loc[index+3, 'fundamental finais integral']
        + df_alunos.loc[index+3, 'eja fundamental'])
        df_fund.loc[index, 'municipal rural'] = (df_alunos.loc[index+4, 'fundamental iniciais parcial'] 
        + df_alunos.loc[index+4, 'fundamental iniciais integral'] 
        + df_alunos.loc[index+4, 'fundamental finais parcial'] 
        + df_alunos.loc[index+4, 'fundamental finais integral']
        + df_alunos.loc[index+4, 'eja fundamental'])
        df_fund.loc[index, 'estadual e municipal'] = (df_alunos.loc[index+5, 'fundamental iniciais parcial'] 
        + df_alunos.loc[index+5, 'fundamental iniciais integral'] 
        + df_alunos.loc[index+5, 'fundamental finais parcial'] 
        + df_alunos.loc[index+5, 'fundamental finais integral']
        + df_alunos.loc[index+5, 'eja fundamental'])
        
## Lower case
df_fund = df_fund.applymap(lambda s: s.lower() if type(s) == str else s)

## Removing accentuation
cols = df_fund.select_dtypes(include=[np.object]).columns
df_fund[cols] = df_fund[cols].apply(lambda x: x.str.normalize('NFKD').str.encode('ascii', errors='ignore').str.decode('utf-8'))
          
del(index, row, cols)


#Importing Schools Data

df_escolas_fund  = pd.read_csv('educacao-es/input/Lista das escolas - Fundamental.csv')
df_escolas_medio = pd.read_csv('educacao-es/input/Lista das escolas - Médio.csv')
