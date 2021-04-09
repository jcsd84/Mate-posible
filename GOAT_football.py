import pandas as pd
import sqlite3 as sq3

conn = sq3.connect('GOAT_TABLE.sqlite')
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS GOAT')

cur.execute('CREATE TABLE GOAT (Jugador nvarchar(50), Equipo nvarchar(50), Anho nvarchar(50), Certamen nvarchar(50),'
            'Partidos int, Goles int, Asistencia int)')

data_goat = pd.read_csv('/Users/home/Documents/MP blog 2021/Pele_maradona_Messi.csv', sep='\t')
#print(data_goat.head())

data_goat.to_sql('GOAT', conn, if_exists= 'replace', index=True)

cur.execute('ALTER TABLE GOAT ADD Prop_Goles_Partido int')
cur.execute('UPDATE GOAT SET Prop_Goles_Partido = COALESCE(Goles,0)/COALESCE(Partidos,0)')


#cur.execute('SELECT Jugador, AVG(Goles) FROM GOAT GROUP BY Jugador')
#cur.execute('SELECT Jugador, AVG(Asistencia) FROM GOAT GROUP BY Jugador')
#cur.execute('SELECT Jugador, Certamen, ROUND(AVG(Goles),2) FROM GOAT GROUP BY Jugador, Certamen')
#cur.execute('SELECT Jugador, Certamen, ROUND(AVG(Asistencia),2) FROM GOAT GROUP BY Jugador, Certamen')
#cur.execute('SELECT Jugador, Equipo, ROUND(AVG(Goles),2) FROM GOAT GROUP BY Jugador, Equipo')
#cur.execute('SELECT Jugador, Equipo, ROUND(AVG(Goles),2) FROM GOAT WHERE Certamen = "Mundial" GROUP BY Jugador, Equipo')
#cur.execute('SELECT Jugador, Equipo, SUM(Goles) FROM GOAT WHERE Certamen = "Mundial" GROUP BY Jugador, Equipo')
#cur.execute('SELECT Jugador, Equipo, SUM(Asistencia) FROM GOAT WHERE Certamen = "Mundial" GROUP BY Jugador, Equipo')
cur.execute('SELECT Jugador, AVG(Prop_Goles_Partido) FROM GOAT GROUP BY Jugador')


for row in cur.fetchall():
    print(row)

conn.commit()
conn.close()