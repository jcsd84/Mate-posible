import pandas as pd
import sqlite3 as sq3

conn = sq3.connect('Eurocopa_previa_final.sqlite')
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS Eurocopa_pfinal')

cur.execute('CREATE TABLE Eurocopa_pfinal (Anho int, Partido int, '
            'Fase nvarchar(50), '
            'Equipo nvarchar(50), Score int, Remate int, Remate_arco int, '
            'Posesion int, Pases int, Faltas int, Rival nvarchar(50))')


data_euro = pd.read_csv("/Users/home/Documents/MP blog 2021/Data/Eurocopa/Eurocopa_2021_previa_final.csv")

data_euro_breve = pd.DataFrame(data_euro, columns=['Anho', 'Partido', 'Fase',
                                                    'Equipo', 'Score', 'Remate',
                                                    'Remate_arco', 'Posesion', 'Pases',
                                                    'Faltas', 'Rival'])

data_euro_breve.to_sql('Eurocopa_pfinal', conn, if_exists = 'replace', index = True)
#print(data_euro_breve.head())

#cur.execute('SELECT Rival, SUM(Score) AS goles_contra, SUM(Remate), SUM(Remate_arco), SUM(Faltas) FROM Eurocopa_previa_final WHERE Rival IN ("Inglaterra","Dinamarca", "Italia", "España") GROUP BY Rival ORDER BY goles_contra')
#cur.execute('SELECT Equipo, SUM(Score) AS goles_favor, SUM(Remate), SUM(Remate_arco), SUM(Faltas), AVG(Pases) FROM Eurocopa_previa_final WHERE Equipo IN ("Inglaterra","Dinamarca", "Italia", "España") GROUP BY Equipo ORDER BY goles_favor DESC')
#cur.execute('SELECT Equipo, AVG(Pases) FROM Eurocopa_pfinal WHERE Equipo IN ("Inglaterra","Dinamarca", "Italia", "España") GROUP BY Equipo')
#cur.execute('SELECT Rival, SUM(Score) AS goles_contra, SUM(Remate), SUM(Remate_arco), AVG(Remate_arco) FROM Eurocopa_previa_final GROUP BY Rival ORDER BY goles_contra')
#cur.execute('SELECT Equipo, SUM(Score) AS goles_favor, SUM(Remate), SUM(Remate_arco), SUM(Faltas), AVG(Pases) FROM Eurocopa_previa_final GROUP BY Equipo ORDER BY goles_favor DESC')
#cur.execute('SELECT AVG(Faltas) FROM Eurocopa_previa_final')

for row in cur.fetchall():
    print(row)

conn.commit()
conn.close()