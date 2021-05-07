import pandas as pd
import sqlite3 as sq3
import seaborn as sns
import matplotlib.pyplot as plt

conn = sq3.connect('Data_espania.sqlite')
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS Liga_Santander')

cur.execute('CREATE TABLE Liga_Santander (Fecha int, Match int, Equipo navar(50), '
            'Score int, Resultado int, Remate int, Remate_arco int, Posesion number,'
            'Pases int, Faltas int, Minuto_gol1 int, Minuto_gol2 int, Minuto_gol3 int)')

data_4equipos = pd.read_csv("/Users/home/Documents/MP blog 2021/Data/Espania/Data_liga_espania_2021.csv")

data_4equipos.to_sql('Liga_Santander', conn, if_exists= 'replace', index=True)

#print(data_4equipos.info())

#cur.execute('SELECT Equipo, SUM(Score), ROUND(AVG(Pases),2), SUM(Remate), SUM(Remate_arco), ROUND(AVG(Faltas),2), MIN(Posesion), MAX(Posesion) FROM Liga_Santander WHERE Equipo IN ("Real Madrid", "Atletico de Madrid", "Barcelona","Sevilla") GROUP BY Equipo')

# Filtrar 4 equipos

lideres = ["Real Madrid", "Atletico de Madrid", "Barcelona","Sevilla"]

data_lideres = data_4equipos[data_4equipos.Equipo.isin(lideres)]


sns.barplot(x='Equipo', y='Score', data = data_lideres, estimator = sum, ci=None)
plt.title('')
plt.xlabel('')
plt.ylabel('Total de Goles')
plt.savefig('Goles_lideres.png')
#plt.show()

for row in cur.fetchall():
    print(row)

conn.commit()
conn.close()
