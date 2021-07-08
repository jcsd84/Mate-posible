import pandas as pd
import sqlite3 as sq3

conn = sq3.connect('Eurocopa_previa_final.sqlite')
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS Eurocopa_previa_final')

cur.execute('CREATE TABLE Eurocopa_previa_final (Anho int, Partido int, Fase nvarchar(50), '
            'Equipo nvarchar(50), Score int, Remate int, Remate_arco int, '
            'Posesion int, Pases int, Faltas int, Rival nvarchar(50))')


data_euro = pd.read_csv("/Users/home/Documents/MP blog 2021/Data/Eurocopa/Eurocopa_2021_previa_final.csv")

data_euro_breve = pd.Data_frame(data_euro, columns=['Anho', 'Partido', 'Fase',
                                                    'Equipo', 'Score', 'Remate',
                                                    'Remate_arco', 'Posesion', 'Pases',
                                                    'Faltas', 'Rival'])

data_euro_breve.to_sql('Eurocopa_previa_final', conn, if_exists = 'replace', index = True)




for row in cur.fetchall:
    print(row)

conn.commit()
conn.close()

data_euro.info()