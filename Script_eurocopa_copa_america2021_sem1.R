# Analisis copa america y eurocopa primera semana

library(readxl)
library(dplyr)
library(ggplot2)
library(tidyr)


# Cargar data de copa america

##### Copa America ####

data_partidos_CA <- read_excel("/Users/home/Documents/MP blog 2021/Data/Copa America/Copa_America_2021.xlsx")
data_nomina_CA <- read_excel("/Users/home/Documents/MP blog 2021/Data/Copa America/Valor_nomina_ca_2021.xlsx")

# Juntar el ranking FIFA y la nomina a los partidos copa america

data_par_nom_CA <- left_join(data_partidos_CA, data_nomina_CA, by ="Equipo")

# Descriptivos Copa America


Prop_remate_arco_gol_CA <- sum(data_par_nom_CA$Score)/sum(data_par_nom_CA$Remate_arco) # Prop remates y goles

Prop_goles_tiempo1_CA <- sum(data_par_nom_CA$Goles_favor_0_20, data_par_nom_CA$Goles_favor_20_45)/sum(data_par_nom_CA$Score) 
Prop_goles_tiempo2_CA <- sum(data_par_nom_CA$Goles_favor_45_65, data_par_nom_CA$Goles_favor_65_90)/sum(data_par_nom_CA$Score)

Prop_Goles025_CA <- sum(data_par_nom_CA$Goles_favor_0_20)/sum(data_par_nom_CA$Score) #
Prop_Goles2645_CA <- sum(data_par_nom_CA$Goles_favor_20_45)/sum(data_par_nom_CA$Score)
Prop_Goles4570_CA <- sum(data_par_nom_CA$Goles_favor_45_65)/sum(data_par_nom_CA$Score)
Prop_Goles4570_CA <- sum(data_par_nom_CA$Goles_favor_65_90)/sum(data_par_nom_CA$Score)

summary(data_par_nom_CA$Pases) # Pases
summary(data_par_nom_CA$Remate) # Remates
summary(data_par_nom_CA$Faltas) #Faltas

# Descriptivos por equipo CAcopa

data_resumen_CA <- group_by(data_par_nom_CA, Equipo) %>% 
  dplyr::summarise(Suma_goles = sum(Score),
                   Suma_remates = sum(Remate),
                   Suma_remates_arco = sum(Remate_arco),
                   Suma_Pases = sum(Pases),
                   Min_Pases = min(Pases),
                   Max_Pases = max(Pases), 
                   Suma_Faltas = sum(Faltas),
                   Partidos = n(),
                   Ranking = first(Ranking))

data_resumen_CA$Prop_goles_remates <- data_resumen_CA$Suma_goles/data_resumen_CA$Suma_remates_arco 
data_resumen_CA$Pases_partido <- data_resumen_CA$Suma_Pases/data_resumen_CA$Partidos
data_resumen_CA$Remates_partido <- data_resumen_CA$Suma_remates/data_resumen_CA$Partidos
data_resumen_CA$Faltas_partido <- data_resumen_CA$Suma_Faltas/data_resumen_CA$Partidos

#Diferencia de goles en Copa America

data_dif_goles_CA <- group_by(data_par_nom_CA,
                              Partido) %>% 
  summarise(Equipo1 = first(Equipo),
            Score1 = first(Score),
            Equipo2 = last(Equipo),
            Score2 = last(Score))

data_dif_goles_CA$dif_goles <- abs(data_dif_goles_CA$Score1 - data_dif_goles_CA$Score2)

#psych::describe(data_dif_goles_CA$dif_goles)

CA <- ggplot(data_dif_goles_CA, aes(x=dif_goles)) + 
  geom_histogram(binwidth =0.5,fill = "blue", color = "black")+
       theme(panel.background = element_blank())+
         labs(x= "Diferencia Goles", y = "Frecuencia") +
  scale_x_continuous(breaks= c(0:5, 1)) +
  scale_y_continuous(breaks = c(0:15,1)) +
  ggtitle("Copa America")

# Sorpresas según Ranking FIFA Copa America

data_sorpresas_CA <- group_by(data_par_nom_CA,
                                Partido) %>% 
  summarise(Equipo1 = first(Equipo),
            Score1 = first(Score),
            Equipo2 = last(Equipo),
            Score2 = last(Score),
            Ranking1 = first(Ranking),
            Ranking2 = last(Ranking),
            Valor1 = first(Valor_nomina),
            Valor2 = last(Valor_nomina),
            Favorito = if_else(first(Ranking) < last(Ranking),paste0(first(Equipo)),paste0(last(Equipo))),
            Underdog = if_else(first(Ranking) > last(Ranking), paste0(first(Equipo)),paste0(last(Equipo))))

# Juntar con la diferencia de goles

data_dif_goles_CA_momentanea <- data_dif_goles_CA %>% 
  dplyr::select(Partido, dif_goles)

data_sorpresas_CA <- inner_join(data_sorpresas_CA, 
                                data_dif_goles_CA_momentanea,
                                by = "Partido")

data_dif_goles_CA_momentanea <- NULL


# Crear las variables para filtrar las sorpresas

data_sorpresas_CA <- data_sorpresas_CA %>% 
  mutate(Ganador = case_when(
    Score1 == Score2 ~ "Empate",
    Score1 > Score2 ~ paste0(data_sorpresas_CA$Equipo1),
    TRUE ~ paste0(data_sorpresas_CA$Equipo2)))

data_sorpresas_CA <- data_sorpresas_CA %>% 
  mutate(Sorpresas = case_when(
    Favorito == Ganador ~ "Coherente",
    Favorito != Ganador ~ "Sorpresa"))

data_sorpresas_CA_sorpresa <- data_sorpresas_CA %>% 
  filter(Sorpresas == "Sorpresa",
         Ganador != "Empate")

data_sorpresas_CA_msorpresa <- data_sorpresas_CA %>% 
  filter(Sorpresas == "Sorpresa",
         Ganador == "Empate")

# Diferencia en costo de la plantilla Copa America

data_sorpresas_CA_msorpresa$Dif_nomina <- data_sorpresas_CA_msorpresa$Valor1 - data_sorpresas_CA_msorpresa$Valor2


##### Eurocopa ####

# Cargar data de Eurocopa

data_partidos_EURO <- read_excel("/Users/home/Documents/MP blog 2021/Data/Eurocopa/Eurocopa_2021.xlsx") 
data_nomina_EURO <- read_excel("/Users/home/Documents/MP blog 2021/Data/Eurocopa/Valor_nomina_euro_2021.xlsx")

# Juntar el ranking FIFA y la nomina a los partidos Eurocopa

data_par_nom_EURO <- left_join(data_partidos_EURO, data_nomina_EURO, by = "Equipo")

# Descriptivos Eurocopa

Prop_remate_arco_gol_EURO <- sum(data_par_nom_EURO$Score)/sum(data_par_nom_EURO$Remate_arco) # Prop remates y goles

Prop_goles_tiempo1_EURO <- sum(data_par_nom_EURO$Goles_favor_0_20, data_par_nom_EURO$Goles_favor_20_45)/sum(data_par_nom_EURO$Score) 
Prop_goles_tiempo2_EURO <- sum(data_par_nom_EURO$Goles_favor_45_65, data_par_nom_EURO$Goles_favor_65_90)/sum(data_par_nom_EURO$Score)

Prop_Goles025_EURO <- sum(data_par_nom_EURO$Goles_favor_0_20)/sum(data_par_nom_EURO$Score) #
Prop_Goles2645_EURO <- sum(data_par_nom_EURO$Goles_favor_20_45)/sum(data_par_nom_EURO$Score)
Prop_Goles4570_EURO <- sum(data_par_nom_EURO$Goles_favor_45_65)/sum(data_par_nom_EURO$Score)
Prop_Goles4570_EURO <- sum(data_par_nom_EURO$Goles_favor_65_90)/sum(data_par_nom_EURO$Score)

summary(data_par_nom_EURO$Pases) # Pases
summary(data_par_nom_EURO$Remate) # Remates
summary(data_par_nom_EURO$Faltas) #Faltas


# Descriptivos por equipo Eurocopa

data_resumen_EURO <- group_by(data_par_nom_EURO, Equipo) %>% 
  dplyr::summarise(Suma_goles = sum(Score),
                   Suma_remates = sum(Remate),
                   Suma_remates_arco = sum(Remate_arco),
                   Suma_Pases = sum(Pases),
                   Min_Pases = min(Pases),
                   Max_Pases = max(Pases), 
                   Suma_Faltas = sum(Faltas),
                   Partidos = n(),
                   Ranking = first(Ranking))

data_resumen_EURO$Prop_goles_remates <- data_resumen_EURO$Suma_goles/data_resumen_EURO$Suma_remates_arco 
data_resumen_EURO$Pases_partido <- data_resumen_EURO$Suma_Pases/data_resumen_EURO$Partidos
data_resumen_EURO$Remates_partido <- data_resumen_EURO$Suma_remates/data_resumen_EURO$Partidos
data_resumen_EURO$Faltas_partido <- data_resumen_EURO$Suma_Faltas/data_resumen_EURO$Partidos

#Diferencia de goles en Eurocopa

data_dif_goles_EURO <- group_by(data_par_nom_EURO,
                              Partido) %>% 
  summarise(Equipo1 = first(Equipo),
            Score1 = first(Score),
            Equipo2 = last(Equipo),
            Score2 = last(Score))

data_dif_goles_EURO$dif_goles <- abs(data_dif_goles_EURO$Score1 - data_dif_goles_EURO$Score2)

#psych::describe(data_dif_goles_EURO$dif_goles)

EURO <- ggplot(data_dif_goles_EURO, aes(x=dif_goles)) + 
  geom_histogram(binwidth =0.5,fill = "grey", color = "black")+
  theme(panel.background = element_blank())+
  labs(x= "Diferencia Goles", y = "Frecuencia") +
  scale_x_continuous(breaks=c(0:5, 1)) +
  scale_y_continuous(breaks=c(0:15,1))
  ggtitle("Eurocopa")



# Sorpresas según Ranking FIFA EUROCOPA

data_sorpresas_EURO <- group_by(data_par_nom_EURO,
                                 Partido) %>% 
  summarise(Equipo1 = first(Equipo),
            Score1 = first(Score),
            Equipo2 = last(Equipo),
            Score2 = last(Score),
            Ranking1 = first(Ranking),
            Ranking2 = last(Ranking),
            Valor1 = first(Valor_nomina),
            Valor2 = last(Valor_nomina),
            Favorito = if_else(first(Ranking) < last(Ranking),paste0(first(Equipo)),paste0(last(Equipo))),
            Underdog = if_else(first(Ranking) > last(Ranking), paste0(first(Equipo)),paste0(last(Equipo))))

# Juntar con la diferencia de goles

data_dif_goles_EURO_momentanea <- data_dif_goles_EURO %>% 
  dplyr::select(Partido, dif_goles)

data_sorpresas_EURO <- inner_join(data_sorpresas_EURO, 
                                data_dif_goles_EURO_momentanea,
                                by = "Partido")

data_dif_goles_EURO_momentanea <- NULL

# Crear las variables para filtrar las sorpresas

data_sorpresas_EURO <- data_sorpresas_EURO %>% 
  mutate(Ganador = case_when(
    Score1 == Score2 ~ "Empate",
    Score1 > Score2 ~ paste0(data_sorpresas_EURO$Equipo1),
      TRUE ~ paste0(data_sorpresas_EURO$Equipo2)))

data_sorpresas_EURO <- data_sorpresas_EURO %>% 
  mutate(Sorpresas = case_when(
    Favorito == Ganador ~ "Coherente",
    Favorito != Ganador ~ "Sorpresa"))

data_sorpresas_EURO_sorpresa <- data_sorpresas_EURO %>% 
  filter(Sorpresas == "Sorpresa",
         Ganador != "Empate")

data_sorpresas_EURO_msorpresa <- data_sorpresas_EURO %>% 
  filter(Sorpresas == "Sorpresa",
         Ganador == "Empate")

# Diferencia en costo de la plantilla Eurocopa

data_sorpresas_EURO_sorpresa$Dif_nomina <- data_sorpresas_EURO_sorpresa$Valor1 - data_sorpresas_EURO_sorpresa$Valor2
  
data_sorpresas_EURO_msorpresa$Dif_nomina <-  data_sorpresas_EURO_msorpresa$Valor1 - data_sorpresas_EURO_msorpresa$Valor2 

#### Graficos histograma diferencia de goles

Histogramas <- ggpubr::ggarrange(CA, EURO,
                     labels = c("", ""),
                     ncol = 2, nrow = 1)

ggsave("histograma_diferencia.png", plot = Histogramas,
       width = 7, height = 3, 
       limitsize = F)

