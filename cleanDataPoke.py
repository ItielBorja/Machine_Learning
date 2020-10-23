import pandas as pd

import re
import numpy as np
from sklearn import tree
import matplotlib.pyplot as plt

data = pd.read_csv("pokedex_(Update.04.20).csv", low_memory=False)

#data2= data.isnull() #Verify Null Values

data2=data[['pokedex_number','name','generation','is_sub_legendary','is_legendary','is_mythical','species','total_points','hp','attack','defense','sp_attack','sp_defense','speed']]


print(data2)

data2.to_csv(path_or_buf="pokeSelectData.csv")