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

cur.execute('SELECT Jugador, AVG(Goles) FROM GOAT GROUP BY Jugador')
cur.execute('SELECT Jugador, AVG(Asistencia) FROM GOAT GROUP BY Jugador')

for row in cur.fetchall():
    print(row)

conn.commit()
conn.close()