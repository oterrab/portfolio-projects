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


# Ploting School, Type of School and City for Fundamental School

plt.figure(figsize=(15,18))
df_escolascount_fund.unstack().plot(
    kind='bar', 
    stacked=True
    )
plt.ylabel('Número de Escolas - Fundamental')
plt.legend(frameon=False, loc='upper left', 
           prop={'size':13},
           title='Dependência Administrativa',
           title_fontsize='13',
           labels=['Estadual', 'Municipal', 'Privada'])
sns.despine(left=False, bottom=True)
plt.tight_layout()
plt.savefig('educacao-es/output/images/type_school_city_fundamental.png', dpi=600, bbox_inches = "tight")
plt.show()


# Ploting School, Type of School and City for Middle School

plt.figure(figsize=(15,18))
df_escolascount_medio.unstack().plot(
    kind='bar', 
    stacked=True
    )
plt.ylabel('Número de Escolas - Médio')
plt.legend(frameon=False, loc='upper left', 
           prop={'size':13},
           title='Dependência Administrativa',
           title_fontsize='13',
           labels=['Estadual', 'Federal', 'Municipal', 'Privada'])
sns.despine(left=False, bottom=True)
plt.tight_layout()
plt.savefig('educacao-es/output/images/type_school_city_medio.png', dpi=600, bbox_inches = "tight")
plt.show()
