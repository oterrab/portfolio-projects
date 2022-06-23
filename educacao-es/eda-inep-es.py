#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jun 23 09:06:04 2022

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


# Ploting School, Type of School and City 
## Elementary School

plt.figure(figsize=(15,18))
df_escolascount_fund.unstack().plot(
    kind='bar', 
    stacked=True,
    color=['cornflowerblue', 'gold', 'indianred']
    )
plt.title('Número de Escolas - Fundamental', size=7)
plt.xlabel('Cidades', size = 5)
plt.tick_params(axis='both',labelsize=5)
plt.legend(frameon=False, loc='upper left', 
           prop={'size':4},
           title='Dependência Administrativa',
           title_fontsize='4',
           labels=['Estadual', 'Municipal', 'Privada'])
sns.despine(left=False, bottom=True)
plt.tight_layout()
plt.savefig('educacao-es/output/images/type_school_city_fundamental.png', dpi=600, bbox_inches = "tight")
plt.show()

## Middle School

plt.figure(figsize=(15,18))
df_escolascount_medio.unstack().plot(
    kind='bar', 
    stacked=True,
    color=['cornflowerblue', 'seagreen', 'gold', 'indianred']
    )
plt.title('Número de Escolas - Médio', size=7)
plt.xlabel('Cidades', size = 5)
plt.tick_params(axis='both',labelsize=5)
plt.legend(frameon=False, loc='upper left', 
           prop={'size':4},
           title='Dependência Administrativa',
           title_fontsize='4',
           labels=['Estadual', 'Federal', 'Municipal', 'Privada'])
sns.despine(left=False, bottom=True)
plt.tight_layout()
plt.savefig('educacao-es/output/images/type_school_city_medio.png', dpi=600, bbox_inches = "tight")
plt.show()

# Ploting Cities x Ratio
## Elementary School

plt.figure(figsize=(15,18))
sns.barplot(data=df_result, x='ratio', y='cidades', palette='Blues_d')
plt.ylabel('Cidades')
plt.title('Estudantes por Escola Pública - Fundamental')
sns.despine(left=True, bottom=True)
plt.tight_layout()
plt.savefig('educacao-es/output/images/ratio_student_per_school_fund.png', quality=95, dpi=600, bbox_inches = "tight")
plt.show()


## Middle School

plt.figure(figsize=(15,18))
sns.barplot(data=df_result, x='ratio', y='cidades', palette='Blues_d')
plt.ylabel('Cidades')
plt.title('Estudantes por Escola Pública - Médio')
sns.despine(left=True, bottom=True)
plt.tight_layout()
plt.savefig('educacao-es/output/images/ratio_student_per_school_medio.png', quality=95, dpi=600, bbox_inches = "tight")
plt.show()