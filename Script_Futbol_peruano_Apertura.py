import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sea
import sqlite3 as sq3

conn = sq3.connect('Futbol_peruano.sqlite')
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS Futbol_peruano')

cur.execute('CREATE TABLE Futbol_peruano (Fecha int, Match int, Equipos nvarchar(50),'
            'Score int, Remate int, Remate_arco int, Posesion int, Pases int, Precision_pases int,'
            'Faltas int, Corners int)')


data_apertura = pd.read_csv("/Users/home/Documents/MP blog 2021/Data/Peru/Matches_2021_peru.csv")

print(data_apertura['Score'].corr(data_apertura['Pases']))


data_apertura.to_sql('Futbol_peruano', conn, if_exists='replace', index=True)



for row in cur.fetchall():
    print(row)

conn.commit()
conn.close()