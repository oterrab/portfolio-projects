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


# Importing Fundamental Schools Data

df_escolas_fund  = pd.read_csv('educacao-es/input/Lista das escolas - Fundamental.csv', sep=';')

## Grouping into a new DF and counting number and type of schools per city 

df_escolas_fund['Total Escolas'] = 1

aggregation_dict = {
        'Total Escolas' : 'sum'
}

g = df_escolas_fund.groupby(['Município', 'Dependência Administrativa'])
df_escolascount_fund = g.agg(aggregation_dict)
del(aggregation_dict, g)


# Importing Middle Schools Data

df_escolas_medio = pd.read_csv('educacao-es/input/Lista das escolas - Médio.csv', sep=';')

## Grouping into a new DF and counting number and type of schools per city 

df_escolas_medio['Total Escolas'] = 1

aggregation_dict = {
        'Total Escolas' : 'sum'
}

g = df_escolas_medio.groupby(['Município', 'Dependência Administrativa'])
df_escolascount_medio = g.agg(aggregation_dict)
del(aggregation_dict, g)

# Generating new DF that do not have Federal and Private Schools
## Fundamental
df_escolascount_fund2 = df_escolascount_fund.reset_index()
df_escolascount_fund2 = df_escolascount_fund2[~df_escolascount_fund2.isin(['Privada', 'Federal']).any(axis=1)]

### Lower case
df_escolascount_fund2 = df_escolascount_fund2.applymap(lambda s: s.lower() if type(s) == str else s)

### Removing accentuation
cols = df_escolascount_fund2.select_dtypes(include=[np.object]).columns
df_escolascount_fund2[cols] = df_escolascount_fund2[cols].apply(lambda x: x.str.normalize('NFKD').str.encode('ascii', errors='ignore').str.decode('utf-8'))
          
del(index, row, cols)

## Medio
df_escolascount_medio2 = df_escolascount_medio.reset_index()
df_escolascount_medio2 = df_escolascount_medio2[~df_escolascount_medio2.isin(['Privada', 'Federal']).any(axis=1)]

### Lower case
df_escolascount_medio2 = df_escolascount_medio2.applymap(lambda s: s.lower() if type(s) == str else s)

### Removing accentuation
cols = df_escolascount_medio2.select_dtypes(include=[np.object]).columns
df_escolascount_medio2[cols] = df_escolascount_medio2[cols].apply(lambda x: x.str.normalize('NFKD').str.encode('ascii', errors='ignore').str.decode('utf-8'))
          
del(index, row, cols)

# Generating a new DF to count number of students per city
## Fundamental
df_alunos_total_fund = df_fund.loc[1:, 'cidades':'estadual'].join(df_fund.loc[1:, 'municipal'])
df_alunos_total_fund['total'] = df_alunos_total_fund['estadual'] + df_alunos_total_fund['municipal']

## Medio
df_alunos_total_medio = df_medio.loc[1:, 'cidades':'estadual'].join(df_medio.loc[1:, 'municipal'])
df_alunos_total_medio['total'] = df_alunos_total_medio['estadual'] + df_alunos_total_medio['municipal']


# Adding students schools ratio to the table
## Fundamental

df_escolascount_fund2 = df_escolascount_fund2.pivot_table(index='Município', columns='Dependência Administrativa', values='Total Escolas', aggfunc='sum')

df_result = pd.merge(pd.DataFrame(df_alunos_total_fund), pd.DataFrame(df_escolascount_fund2), left_on=['cidades'], 
             right_on= ['Município'], how='left')

df_result = df_result.fillna(0)
df_result.columns = ['cidades', 'estudantes estadual', 'estudantes municipal', 'total', 'escolas estadual', 'escolas municipal']
df_result['total escolas'] = df_result['escolas estadual'] + df_result['escolas municipal']
df_result['ratio'] = df_result['total'] / df_result['total escolas']

#del(df_escolascount_fund2)

## Médio

df_escolascount_medio2 = df_escolascount_medio2.pivot_table(index='Município', columns='Dependência Administrativa', values='Total Escolas', aggfunc='sum')

df_result2 = pd.merge(pd.DataFrame(df_alunos_total_medio), pd.DataFrame(df_escolascount_medio2), left_on=['cidades'], 
             right_on= ['Município'], how='left')

df_result2 = df_result2.fillna(0)
df_result2.columns = ['cidades', 'estudantes estadual', 'estudantes municipal', 'total', 'escolas estadual', 'escolas municipal']
df_result2['total escolas'] = df_result2['escolas estadual'] + df_result2['escolas municipal']
df_result2['ratio'] = df_result2['total'] / df_result2['total escolas']

#del(df_escolascount_medio2)


