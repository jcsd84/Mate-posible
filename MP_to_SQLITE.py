
import pandas as pd
import sqlite3 as sq3

conn = sq3.connect('Gareca_historico.sqlite')
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS mateposible_info')

cur.execute('CREATE TABLE mateposible_info (Torneo nvarchar(50),'
               'ANHO int, SEDE nvarchar(50), Goles_Peru int, Goles_contr int,'
            'Peru_pases_tot int, Resultado_g2_e1_p0 nvarchar(50), Peru_disp_gen int,'
            'Peru_disp_arco int, Disp_contr_gen int, Disp_contra_arco int, Peru_recupero int,' 
            'Contr_recupero int, Peru_faltas int, Contr_faltas int, Lado_jugador1 nvarchar(50),'
            'Lado_jugador2 nvarchar(50))')

data_mp = pd.read_csv("/Users/home/Documents/Documentos/Mate Posible/Matematicamente posible 2018/Data analysis/BD_Oficial_Gareca.csv")
data_mp = pd.DataFrame(data_mp, columns=['Torneo','ANHO',
                                          'SEDE','Goles_Peru', 'Goles_contr', 'Resultado_g2_e1_p0',
                                          'Peru_pases_tot', 'Peru_disp_gen', 'Peru_disp_arco',
                                         'Disp_contr_gen', 'Disp_contra_arco',
                                         'Peru_recupero', 'Contr_recupero',
                                         'Peru_faltas','Contr_faltas', 'Lado_jugador1',
                                         'Lado_jugador2'])

data_mp.to_sql('mateposible_info', conn, if_exists='replace', index=True)


#cur.execute('SELECT AVG(Goles_Peru) FROM mateposible_info')
#cur.execute('''SELECT AVG(Goles_Peru) FROM mateposible_info WHERE Resultado_g2_e1_p0 = '2'''')
#cur.execute('''SELECT AVG(Goles_Peru) FROM mateposible_info GROUP BY Resultado_g2_e1_p0''')
#cur.execute('SELECT ROUND(AVG(Goles_Peru),2) FROM mateposible_info GROUP BY Torneo')
#cur.execute('SELECT Torneo, ROUND(AVG(Goles_Peru),2) FROM mateposible_info GROUP BY Torneo')



for row in cur.fetchall():
    print(row)

conn.commit()
conn.close()