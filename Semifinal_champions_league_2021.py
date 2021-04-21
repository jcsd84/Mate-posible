import pandas as pd
import sqlite3 as sq3

conn = sq3.connect('UCL_semifinal.sqlite')
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS SEMIUCL')

cur.execute('CREATE TABLE SEMIUCL (Anho int, Fase nvarchar(50), Equipo nvarchar(50), Score int, Remate int, Remate_arco int,'
            'Posesion number, Pases int, Precision_pases number, Faltas int, Corners int)')

data_UEFA_semi = pd.read_csv("/Users/home/Documents/MP blog 2021/Data/UEFA champions league/data_2021_UCL_semif.csv")
data_UEFA_semi['Prop_remates_certeros'] = data_UEFA_semi['Remate_arco']/data_UEFA_semi['Remate']

data_UEFA_semi.to_sql('SEMIUCL', conn, if_exists= 'replace', index = True)

#print(data_UEFA_semi['Score'].mean())
#print(data_UEFA_semi['Remate'].mean())
#print(data_UEFA_semi['Remate_arco'].mean())
#print(data_UEFA_semi['Pases'].mean())
#print(data_UEFA_semi['Faltas'].mean())
#print(data_UEFA_semi['Corners'].mean())

# Calculos generales, correlaciones con todos los equipos.

#print(data_UEFA_semi['Pases'].corr(data_UEFA_semi['Score']))
#print(data_UEFA_semi['Pases'].corr(data_UEFA_semi['Remate']))
#print(data_UEFA_semi['Pases'].corr(data_UEFA_semi['Remate_arco']))
#print(data_UEFA_semi['Pases'].corr(data_UEFA_semi['Faltas']))
#print(data_UEFA_semi['Pases'].corr(data_UEFA_semi['Corners']))

# Calcular equipos con mayor promedio de pases, goles, remates y faltas.

#cur.execute('SELECT Equipo, AVG(Score), AVG(Pases) AS Pass,  AVG(Remate), AVG(Remate_arco), AVG(Faltas) FROM SEMIUCL GROUP BY Equipo ORDER BY Pass DESC')
#cur.execute('SELECT Equipo, AVG(Pases), AVG(Remate) AS rem, AVG(Remate_arco) FROM SEMIUCL GROUP BY Equipo ORDER BY rem DESC')


RM = 'Real Madrid'
MC = 'Manchester City'
CH = 'Chelsea'
PSG = 'Paris Saint-Germain'



for row in cur.fetchall():
    print(row)

conn.commit()
conn.close()
