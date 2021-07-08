import pandas as pd
import sqlite3 as sq3

conn = sq3.connect("ca.sqlite")
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS CA')

data_ca = pd.read_csv("/Users/home/Documents/MP blog 2021/Data/Copa America/Copa_America_2021_pfinal.csv")
data_ca_breve = pd.DataFrame(data_ca, columns=['Partido', 'Equipo', 'Score', 'Remate',
                                               'Remate_arco', 'Pases', 'Faltas', 'Rival'])

cur.execute('CREATE TABLE CA (Partido int, Equipo nvarchar(50), Score int, '
            'Remate int, Remate_arco int, Pases int, Faltas int, Rival nvarchar(50))')

data_ca.to_sql('CA', conn, if_exists = 'replace', index = True)

#cur.execute('SELECT Equipo, SUM(Score) AS goles_favor, SUM(Remate), SUM(Remate_arco), SUM(Faltas) FROM CA WHERE Equipo IN ("Brasil", "Argentina", "Peru", "Colombia") GROUP BY Equipo ORDER BY goles_favor DESC')
cur.execute('SELECT Rival, SUM(Score) AS goles_contra, SUM(Remate), SUM(Remate_arco) FROM CA WHERE Rival IN ("Brasil", "Argentina", "Peru", "Colombia") GROUP BY Rival ORDER BY goles_contra')

for row in cur.fetchall():
    print(row)

conn.commit()
conn.close()