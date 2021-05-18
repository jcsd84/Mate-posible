import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import sqlite3 as sq3

conn = sq3.connect('Futbol_peruano.sqlite')
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS Futbol_peruano')

cur.execute('CREATE TABLE Futbol_peruano (Fecha int, Match int, Equipos nvarchar(50), Estado nvarchar(50),'
            'Score int, Remate int, Remate_arco int, Posesion int, Pases int, Precision_pases int,'
            'Faltas int, Corners int)')


data_apertura = pd.read_csv("/Users/home/Documents/MP blog 2021/Data/Peru/Matches_2021_peru.csv", sep='\t')

#print(data_apertura['Score'].corr(data_apertura['Pases']))
#print(data_apertura['Score'].corr(data_apertura['Remate']))
#print(data_apertura['Score'].corr(data_apertura['Remate_arco']))
#print(data_apertura['Remate'].corr(data_apertura['Pases']))
#print(data_apertura['Remate_arco'].corr(data_apertura['Pases']))

# Separar entre los equipos

#Alianza Lima

AL = ['Alianza Lima']
data_apertura_AL = data_apertura[data_apertura.Equipos.isin(AL)]
print(data_apertura_AL['Score'].corr(data_apertura_AL['Pases']))

#Universitario

Uni = ['Universitario']
data_apertura_U = data_apertura[data_apertura.Equipos.isin(Uni)]
print(data_apertura_U['Score'].corr(data_apertura_U['Pases']))
#Sporting Cristal

SC = ['Sporting Cristal']
data_apertura_SC = data_apertura[data_apertura.Equipos.isin(SC)]
print(data_apertura_SC['Score'].corr(data_apertura_SC['Pases']))



#sns.lmplot(x='Pases', y = 'Score', data= data_apertura, hue='Estado')
#plt.legend(bbox_to_anchor=(1.01, 1),borderaxespad=0)
#plt.xlabel("Cantidad de pases")
#plt.ylabel("Goles")
#plt.xticks(rotation=90)
#plt.show()


p = sns.lmplot(x='Pases', y = 'Remate_arco', data= data_apertura,
        hue='Estado', markers =['o', 'v'])
p._legend.remove()
plt.legend(bbox_to_anchor=(1.01, 1),borderaxespad=0)
plt.xlabel("Cantidad de pases")
plt.ylabel("Goles")
plt.xticks(rotation=90)
plt.show()

data_apertura.to_sql('Futbol_peruano', conn, if_exists='replace', index=True)

cur.execute('SELECT Equipos, ROUND(AVG(Score),2), ROUND(AVG(Pases),2), ROUND(AVG(Remate_arco),2), ROUND(AVG(Faltas),2), MIN(Posesion), MAX(Posesion)  FROM Futbol_peruano WHERE Equipos IN ("Alianza Lima", "Universitario", "Sporting Cristal") GROUP BY Equipos')
cur.execute('SELECT Equipos, SUM(Score), SUM(Remate), SUM(Remate_arco) FROM Futbol_peruano WHERE Equipos IN ("Alianza Lima", "Universitario", "Sporting Cristal") GROUP BY Equipos')


for row in cur.fetchall():
    print(row)

conn.commit()
conn.close()