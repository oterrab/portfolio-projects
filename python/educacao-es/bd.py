#packages

import os
import pandas as pd
#pip install basedosdados==1.6.4b5
import basedosdados as bd
from geobr import read_municipality


# import dataframes

pd.set_option('display.max_columns', 500)
pd.set_option('display.max_rows', 500)

# Setting working directory

os.chdir(r'/Users/lucaspb/git-repositories/portfolio-projects')


## enviroment variables
# pip install python-dotenv
from dotenv import load_dotenv
from pathlib import Path
 
load_dotenv()
env_path = Path(r'/Users/lucaspb/git-repositories/portfolio-projects/')/'.env'
load_dotenv(dotenv_path=env_path)
load_dotenv()
#print(os.getenv('billing_project_id'))

#############################
#                           #
#     Loading Dataset       #
#                           #
#############################

bd.list_datasets()

billing_project_id = os.getenv('billing_project_id')
df_inep_ideb = bd.read_table('br-inep-ideb', 'municipio', billing_project_id= 'billing_project_id')










# Read specific municipality at a given year
mun = read_municipality(code_muni=1200179, year=2017)

# Read all municipalities of given state at a given year
mun = read_municipality(code_muni=33, year=2010) # or
mun = read_municipality(code_muni="RJ", year=2010)

# Read all municipalities in the country at a given year
mun = read_municipality(code_muni="all", year=2018)