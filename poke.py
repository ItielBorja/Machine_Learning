import pandas as pd
from sklearn import tree
import matplotlib.pyplot as plt

data = pd.read_csv("pokeSelectData.csv", low_memory=False)

data2= data.dropna()



#data2['species']=data2['species'].str.replace('Seed Pokémon','0')



#,("Flame Pokémon","1"))

#data2.replace(to_replace ="Seed Pokémon",  value = "0",  inplace = True)

#data2["species"]= data2["species"].replace("Seed Pokémon", "0")

data3=data2["species"].replace(to_replace ="Seed Pokémon", value =0)



print(data3)


data3.to_csv(path_or_buf="pokeSelectData2.csv")




#Decision Tree
#dt = tree.DecisionTreeClassifier(criterion='entropy',max_depth=2)



#samples = data2[['is_sub_legendary','is_legendary','is_mythical',
#                    'total_points','hp','defense','sp_attack','sp_defense',
#                    'speed']]

#labels = data2[['attack']]

#dt = dt.fit(samples, labels,)

#Display tree
#dt = dt.fit(samples, labels,)
#tree.plot_tree(dt, feature_names=samples.columns)
#plt.show()
