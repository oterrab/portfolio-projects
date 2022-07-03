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

#############################
#                           #
#      Schools x City       #
#                           #
#############################

# Ploting School, Type of School and City 
## Elementary School

plt.figure(figsize=(15,18))
df_escolascount_fund.unstack().plot(
    kind='bar', 
    stacked=True,
    color=['cornflowerblue', 'gold', 'indianred']
    )
plt.title('Number of Schools - Elementary', size=7)
plt.xlabel('Cities', size = 5)
plt.tick_params(axis='both',labelsize=5)
plt.legend(frameon=False, loc='upper left', 
           prop={'size':4},
           title='Administrative Instance',
           title_fontsize='4',
           labels=['State', 'Municipal', 'Private'])
sns.despine(left=False, bottom=True)
plt.tight_layout()
#plt.savefig('educacao-es/output/images/type_school_city_fundamental.png', dpi=600, bbox_inches = "tight")
plt.show()

## Middle School

plt.figure(figsize=(15,18))
df_escolascount_medio.unstack().plot(
    kind='bar', 
    stacked=True,
    color=['cornflowerblue', 'seagreen', 'gold', 'indianred']
    )
plt.title('Number of Schools  - Middle', size=7)
plt.xlabel('Cities', size = 5)
plt.tick_params(axis='both',labelsize=5)
plt.legend(frameon=False, loc='upper left', 
           prop={'size':4},
           title='Administrative Instance',
           title_fontsize='4',
           labels=['State', 'Federal', 'Municipal', 'Private'])
sns.despine(left=False, bottom=True)
plt.tight_layout()
#plt.savefig('educacao-es/output/images/type_school_city_medio.png', dpi=600, bbox_inches = "tight")
plt.show()


#############################
#                           #
#    Students per School    #
#                           #
#############################

# Ploting Cities x Ratio
## modified from: https://stackoverflow.com/questions/42861049/horizontal-barplot-with-annotations/42865017

def show_values_on_bars(axs, h_v="v", hspace=0.4, vspace=0.4):
    def _show_on_single_plot(ax):
        if h_v == "v":
            for p in ax.patches:
                _x = p.get_x() + p.get_width() / 2
                _y = p.get_y() + p.get_height()
                value = int(p.get_height())
                ax.text(_x, _y, value, ha="center") 
        elif h_v == "h":
            for p in ax.patches:
                _x = p.get_x() + p.get_width() + float(hspace)
                _y = p.get_y() + p.get_height()+ float(vspace)
                value = int(p.get_width())
                ax.text(_x, _y, value, ha="left", va="center")

    if isinstance(axs, np.ndarray):
        for idx, ax in np.ndenumerate(axs):
            _show_on_single_plot(ax)
    else:
        _show_on_single_plot(axs)


## modified from: https://stackoverflow.com/questions/36271302/changing-color-scale-in-seaborn-bar-plot
def colors_from_values(values, palette_name):
    # normalize the values to range [0, 1]
    normalized = (values - min(values)) / (max(values) - min(values))
    # convert to indices
    indices = np.round(normalized * (len(values) - 1)).astype(np.int32)
    # use the indices to get the colors
    palette = sns.color_palette(palette_name, len(values))
    return np.array(palette).take(indices, axis=0)

## Elementary School

plt.figure(figsize=(15,18))
ax = sns.barplot(data=df_result, x='ratio', y='cidades', palette=colors_from_values(df_result.ratio, "Reds"))
plt.ylabel('Cities')
plt.title('Students per Public School - Elementary School')
plt.xlabel('Student per School')
sns.despine(left=True, bottom=True)
plt.tick_params(axis='x',labelsize=15)
plt.tight_layout()
show_values_on_bars(ax, "h", 10, -0.4)
#plt.savefig('educacao-es/output/images/ratio_student_per_school_fund.png', quality=95, dpi=600, bbox_inches = "tight")
plt.show()


## Middle School

plt.figure(figsize=(15,18))
ax = sns.barplot(data=df_result2, x='ratio', y='cidades', palette=colors_from_values(df_result2.ratio, "Reds"))
plt.ylabel('Cidades')
plt.title('Students per Public School - Middle School')
plt.xlabel('Student per School')
sns.despine(left=True, bottom=True)
plt.tick_params(axis='x',labelsize=15)
plt.tight_layout()
show_values_on_bars(ax, "h", 10, -0.4)

#plt.savefig('educacao-es/output/images/ratio_student_per_school_medio.png', quality=95, dpi=600, bbox_inches = "tight")
plt.show()


#############################
#                           #
#   Expenses in Education   #
#                           #
#############################

plt.figure(figsize=(10,5))
sns.lineplot(
    data=df_despesas[df_despesas["EsferaAdministrativa"].isin(["Alegre", "Cariacica", "Vitória", "Serra", "Guarapari", "Vila Velha", "Marataízes", "Cachoeiro do Itapemerim",  "Viana"])], 
    x=df_despesas.Ano[df_despesas.Ano != 2022], 
    y=df_despesas["AplicacaoPercentual"].astype(float), 
    hue="EsferaAdministrativa",
    markers=True
)
plt.title('Educational Expenses', size=15)
plt.xlabel('Year', size = 15)
plt.ylabel('Percentage of Total FUDEB Budget', size = 8)
plt.tick_params(axis='both',labelsize=15)
plt.legend(frameon=False, loc='upper right', 
           prop={'size':10},
           title='Administrative Instance',
           title_fontsize='10')
sns.despine(left=False, bottom=False)
plt.tight_layout()
#plt.savefig('educacao-es/output/images/despesas_educacionais.png', quality=95, dpi=600, bbox_inches = "tight")
plt.show()


#############################
#                           #
#   Expenses per Student    #
#                           #
#############################

# Ploting Expenses / Student x Cities

## Elementary School

plt.figure(figsize=(15,18))
ax = sns.barplot(data=df_despesas_2021, x='ExpStu_raw', y='EsferaAdministrativa', palette='YlOrBr_r')
plt.ylabel('Cities')
plt.title('Investment per Student - 2021')
plt.xlabel('R$')
sns.despine(left=True, bottom=True)
plt.tight_layout()
show_values_on_bars(ax, "h", 100, -0.4)
#plt.savefig('educacao-es/output/images/expernses_per_student_per_city.png', quality=95, dpi=600, bbox_inches = "tight")
plt.show()
