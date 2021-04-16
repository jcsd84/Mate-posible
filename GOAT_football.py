import pandas as pd
import sqlite3 as sq3
import matplotlib.pyplot as plt
import seaborn as sns

conn = sq3.connect('GOAT_TABLE.sqlite')
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS GOAT')

cur.execute('CREATE TABLE GOAT (Jugador nvarchar(50), Equipo nvarchar(50), Anho nvarchar(50), Certamen nvarchar(50),'
            'Partidos int, Goles int, Asistencia int, Prop_Goles_Partido number, Prop_asistencias_Partido number)')

data_goat = pd.read_csv('/Users/home/Documents/MP blog 2021/Pele_maradona_Messi_recode.csv')
data_goat['Prop_Goles_Partido'] = data_goat['Goles']/data_goat['Partidos']
data_goat['Prop_asistencias_Partido'] = data_goat['Asistencia']/data_goat['Partidos']
#print(data_goat['Prop_Goles_Partido'])

Liga = ["Liga"]
data_goat_Liga = data_goat[data_goat.Certamen.isin(Liga)]


sns.lineplot(x = "Anho", y = "Prop_Goles_Partido",
             data=data_goat_Liga, hue="Jugador")
plt.legend(bbox_to_anchor=(1.01, 1),borderaxespad=0)
plt.xlabel("")
plt.ylabel('Proporcion de goles por partido en Liga')
plt.xticks(rotation=90)
#plt.show()
plt.savefig('GOAT_goals_season.png')

#sns.lineplot(x = "Anho", y = "Prop_asistencias_Partido",
#             data=data_goat_Liga, hue="Jugador")
#plt.legend(bbox_to_anchor=(1.01, 1),borderaxespad=0)
#plt.xlabel("")
#plt.ylabel('Proporcion de asistencias por partido en Liga')
#plt.xticks(rotation=90)
#plt.show()


data_goat.to_sql('GOAT', conn, if_exists= 'replace', index=True)

cur.execute('SELECT Jugador, Certamen, Equipo FROM GOAT GROUP BY Jugador, Certamen, Equipo')
#cur.execute('SELECT Jugador, SUM(Partidos), SUM(Goles), SUM(Asistencia) FROM GOAT GROUP BY Jugador')
#cur.execute('SELECT Jugador, SUM(Partidos), SUM(Goles), SUM(Asistencia) FROM GOAT WHERE Certamen = "Mundial" GROUP BY Jugador')
#cur.execute('SELECT Jugador, SUM(Partidos), SUM(Goles), SUM(Asistencia) FROM GOAT WHERE Certamen = "Copa America" GROUP BY Jugador')
#cur.execute('SELECT Jugador, SUM(Partidos), SUM(Goles), SUM(Asistencia) FROM GOAT WHERE Certamen = "Liga" GROUP BY Jugador')
#cur.execute('SELECT Jugador, SUM(Partidos), SUM(Goles), SUM(Asistencia) FROM GOAT WHERE Certamen = "Copa del Rey" GROUP BY Jugador')
#cur.execute('SELECT Jugador, Anho, ROUND(Prop_Goles_Partido,2) FROM GOAT')
#cur.execute('SELECT Jugador, Anho, ROUND(Prop_asistencias_Partido,2) FROM GOAT')



for row in cur.fetchall():
    print(row)

conn.commit()
conn.close()