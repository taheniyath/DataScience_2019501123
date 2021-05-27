import pandas as pd
import seaborn as sns



data =  pd.read_csv('E:/DataScience_2019501123/DADV/assignments/task3/rank_votes.csv')
final_data = data[data['numVotes'] >= 10000 ]


sns_plot  = sns.jointplot(x = final_data["averageRating"], y = final_data["numVotes"], kind = 'scatter')
sns_plot.savefig("scatterplot.svg")