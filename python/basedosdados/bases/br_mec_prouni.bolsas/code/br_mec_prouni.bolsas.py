
import os
import pandas as pd
import numpy as np
import glob
import time

# Setting working directory

os.chdir(r'/Users/lucaspb/git-repositories/portfolio-projects/python/basedosdados/bases/br_mec_prouni.bolsas')

# Setting parameters for renaming and reordering of columns

rename = {'ANO_CONCESSAO_BOLSA':'ano', 
          'ï»¿ANO_CONCESSAO_BOLSA':'ano',
          'UF_BENEFICIARIO':'sigla_uf',
          'SIGLA_UF_BENEFICIARIO_BOLSA':'sigla_uf',
          'MUNICIPIO_BENEFICIARIO':'id_municipio',
          'MUNICIPIO_BENEFICIARIO_BOLSA':'id_municipio',
          'CPF_BENEFICIARIO':'cpf',
          'CPF_BENEFICIARIO_BOLSA':'cpf',
          'SEXO_BENEFICIARIO':'sexo',
          'SEXO_BENEFICIARIO_BOLSA':'sexo',
          'RACA_BENEFICIARIO':'raca_cor',
          'RACA_BENEFICIARIO_BOLSA':'raca_cor',
          'DATA_NASCIMENTO':'data_nascimento',
          'DT_NASCIMENTO_BENEFICIARIO':'data_nascimento',
          'BENEFICIARIO_DEFICIENTE_FISICO':'beneficiario_deficiente',
          'CODIGO_EMEC_IES_BOLSA':'id_ies',
          'CAMPUS':'campus',
          'MUNICIPIO':'id_municipio_ies',
          'NOME_CURSO_BOLSA':'curso',
          'NOME_TURNO_CURSO_BOLSA':'turno_curso',
          'TIPO_BOLSA':'tipo_bolsa',
          'MODALIDADE_ENSINO_BOLSA':'modalidade_ensino' }


ordem = ["ano", "sigla_uf", "id_municipio", "cpf", "sexo", "raca_cor", "data_nascimento", 
         "beneficiario_deficiente", "id_ies", "curso", "turno_curso", "tipo_bolsa", "modalidade_ensino"]


ordem2020 = ['ano', 'sigla_uf', 'id_municipio', 'cpf', 'sexo', 'raca_cor', 'data_nascimento',
         'beneficiario_deficiente', 'id_ies', 'campus', 'id_municipio_ies', 'curso', 'turno_curso', 'tipo_bolsa', 'modalidade_ensino']


# Settings parameters for partitioning the output 

anos = [2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020]

ufs = ['AC', 'AL', 'AM', 'AP', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MG', 'MS', 'MT', 
       'PA', 'PB', 'PE', 'PI', 'PR', 'RJ', 'RN', 'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO']


# Creating folders for output partitioning
## chmod -R 777 output
for ano in anos:
  for uf in ufs:
    directory = 'output/ano={}/sigla_uf={}'.format(ano, uf)
    if not os.path.exists(directory):
      os.makedirs(directory)


# Getting CSV files list from my folder
path = 'input/'
csv_files = glob.glob(path + "/*.csv")

# Reading into a list of dataframes
dfs = [pd.read_csv(file, sep=";", encoding='latin-1') for file in csv_files]

## this could be made into one bit dataframe, but I've decided not to go on this route
## prounidata = pd.concat(dfs,ignore_index=True)

# Cleaning data
for df in dfs:
    df.rename(columns=rename, inplace=True)
    df.drop(['NOME_IES_BOLSA', 'REGIAO_BENEFICIARIO_BOLSA', 'REGIAO_BENEFICIARIO'], errors='ignore', axis=1, inplace=True)
    df['sexo'] = df['sexo'].str.upper().replace({'FEMININO':'F', 'MASCULINO':'M'})
    df['sexo'] = df['sexo'].replace({'F':'1', 'M':'2'})
    df['raca_cor'] = df['raca_cor'].str.upper().replace({'AMARELA':'1', 'BRANCA':'2', 'INDÍGENA':'3', 'PARDA':'4', 'PRETA':'5', 'NÃO INFORMADA':'6', 'NÆO INFORMADA':'6'})
    df['beneficiario_deficiente'] = df['beneficiario_deficiente'].str.upper().replace({'SIM':'1', 'NÃO':'0'})
    df['beneficiario_deficiente'] = df['beneficiario_deficiente'].str.upper().replace({'S':'1', 'N':'0'})
    df['turno_curso'] = df['turno_curso'].str.upper().replace({'MATUTINO':'1', 'VESPERTINO':'2', 'NOTURNO':'3', 'INTEGRAL':'4', 'CURSO A DISTÂNCIA':'5', 'CURSO A DIST¶NCIA':'5'})
    df['tipo_bolsa'] = df['tipo_bolsa'].str.upper().replace({'BOLSA INTEGRAL':'1', 'BOLSA PARCIAL 50%':'2'})
    df['tipo_bolsa'] = df['tipo_bolsa'].str.upper().replace({'INTEGRAL':'1', 'PARCIAL':'2'})
    df['modalidade_ensino'] = df['modalidade_ensino'].str.upper().replace({'PRESENCIAL':'1', 'EDUCAÇÃO A DISTÂNCIA':'2', 'EAD':'2'})
    df['data_nascimento'] = pd.to_datetime(df['data_nascimento'], errors='coerce')
    df['data_nascimento'] = df['data_nascimento'].dt.strftime('%Y-%m-%d')

# Reordering columns
for i in range(len(dfs)):
    ano = int(dfs[i]['ano'].iat[0])
    if ano != 2020:
        dfs[i] = dfs[i][ordem]
    if ano == 2020:
        dfs[i] = dfs[i][ordem2020]   

# Setting to replace counties names for its unique id
## Importing dataframe with counties and unique ids
id_uf = pd.read_csv(r'/Users/lucaspb/git-repositories/portfolio-projects/python/basedosdados/assets/dir_municipio.csv', sep=',', dtype='string')

## Normalizing names
### Upper Case
id_uf = id_uf.applymap(lambda s: s.upper() if type(s) == str else s)

for df in dfs:
    ano = int(df['ano'][0])
    if ano != 2020:
        df['id_municipio'] = df['id_municipio'].apply(lambda s: s.upper() if type(s) == str else s)
    if ano == 2020: 
        df['id_municipio'] = df['id_municipio'].apply(lambda s: s.upper() if type(s) == str else s)
        df['id_municipio_ies'] = df['id_municipio_ies'].apply(lambda s: s.upper() if type(s) == str else s)


### Removing accentuation
cols = id_uf.select_dtypes(include=[np.object]).columns
id_uf[cols] = id_uf[cols].apply(lambda x: x.str.normalize('NFKD').str.encode('ascii', errors='ignore').str.decode('utf-8'))
id_uf['f0_'] = id_uf['f0_'].apply(lambda x: x.replace("‘", ' ').replace("’", ' ').replace("'", ' '))

for df in dfs:
    ano = int(df['ano'][0])
    if ano != 2020:
        #df['id_municipio'] = [unidecode.unidecode(x) for x in df['id_municipio']]
        df['id_municipio'] = [lambda x: x.str.normalize('NFKD').str.encode('ascii', errors='ignore').str.decode('utf-8') for x in df['id_municipio']]
        df['id_municipio'] = df['id_municipio'].apply(lambda x: x.replace("‘", ' ').replace("’", ' ').replace("'", ' ') if type(x) == str else x)
    if ano == 2020: 
        cols = df.select_dtypes(include=[np.object]).id_municipio
        df[cols] = df[cols].apply(lambda x: x.str.normalize('NFKD').str.encode('ascii', errors='ignore').str.decode('utf-8'))
        df['id_municipio'] = df['id_municipio'].apply(lambda x: x.replace("‘", ' ').replace("’", ' ').replace("'", ' '))
        cols = df.select_dtypes(include=[np.object]).id_municipio_ies
        df[cols] = df[cols].apply(lambda x: x.str.normalize('NFKD').str.encode('ascii', errors='ignore').str.decode('utf-8'))
        df['id_municipio_ies'] = df['id_municipio_ies'].apply(lambda x: x.replace("‘", ' ').replace("’", ' ').replace("'", ' '))

## Replacing counties names for its unique id 
id_uf = id_uf.set_index('f0_').to_dict()['id_municipio']

for i in range(len(dfs)):
    ano = int(dfs[i]['ano'].iat[0])
    if ano != 2020:
        dfs[i] = dfs[i].replace({"id_municipio": id_uf})
    if ano == 2020:
        dfs[i] = dfs[i].replace({"id_municipio": id_uf})
        dfs[i] = dfs[i].replace({"id_municipio_ies": id_uf})

# Saving partitioned data into specific folders
for df in dfs:
    ano = int(df['ano'][0])
    print("Particionando ano {}".format(ano))
    time.sleep(2)
    for uf in ufs:
        print("Particionando {} de {}".format(uf, ano))
        time.sleep(2)
        df_uf = df[df['sigla_uf'] == uf]
        df_uf.drop(['ano', 'sigla_uf'], axis=1, inplace=True)
        exec("df_uf.to_csv('output/ano={}/sigla_uf={}/microdados.csv', index=False, encoding='utf-8', na_rep='')".format(ano, uf))