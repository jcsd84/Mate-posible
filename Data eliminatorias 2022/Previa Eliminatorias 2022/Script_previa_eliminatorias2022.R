# Analisis previos a las eliminatorias para Qatar

library(data.table)
library(ggplot2)
library(dplyr)
library(ggrepel)

## Cargar data
data <- fread("/Users/home/Documents/Documentos/Mate Posible/Matematicamente posible 2018/Conmebol_partidos.csv")
names(data)
head(data)
tail(data)

## Relacionar goles y pases

m1 <- lm(score_equipo ~ pases, data=data)
summary(m1)

### Resumen general de relacion pases y goles

data_resumida <- data %>% 
  filter(season != "REPECHAJE") %>% 
  group_by(Equipo) %>% 
  summarise(Pases = mean(pases),
            Goles = mean(score_equipo))


# Grafica resumen

ggplot(data_resumida, aes(x=Pases, y=Goles, label=Equipo))+
  geom_point(color="red")+
  geom_text_repel(
    nudge_y      = 0.05,
    direction    = "x",
    angle        = 90,
    vjust        = 0,
    segment.size = 0.2,
    size = 2
  )+
  theme(panel.background = element_blank())+
  scale_x_continuous(limits = c(100, 450), breaks = seq(100,450, by =50))+
  scale_y_continuous(limits = c(0,4), breaks = seq(0,5, by = 1))+
  labs(title = "Partidos del 1 al 18")

### Fase 1

fechas16 <- c("FECHA 1", "FECHA 2", "FECHA 3", "FECHA 4",
              "FECHA 5", "FECHA 6")


data_1_6 <- data %>% 
  filter(Fecha %in% fechas16)

data_resumida16 <- data_1_6 %>% 
  group_by(Equipo) %>% 
  summarise(Pases = mean(pases),
            Goles = mean(score_equipo))

### graficar del 1-6


ggplot(data_resumida16, aes(x=Pases, y=Goles, label=Equipo))+
  geom_point(color="red")+
  geom_text_repel(
    nudge_y      = 0.05,
    direction    = "x",
    angle        = 90,
    vjust        = 0,
    segment.size = 0.2,
    size = 2
  )+
  theme(panel.background = element_blank())+
  scale_x_continuous(limits = c(100, 450), breaks = seq(100,450, by =50))+
  scale_y_continuous(limits = c(0,3), breaks = seq(0,3, by = 1))+
  labs(title = "Partidos del 1 al 6")


### Fase 2

fechas712 <- c("FECHA 7", "FECHA 8", "FECHA 9", "FECHA 10",
               "FECHA 11", "FECHA 12")

data_7_12 <- data %>% 
  filter(Fecha %in% fechas712)

data_resumida712 <- data_7_12 %>% 
  group_by(Equipo) %>% 
  summarise(Pases = mean(pases),
            Goles = mean(score_equipo))

### graficar del 7-12

ggplot(data_resumida712, aes(x=Pases, y=Goles, label=Equipo))+
  geom_point(color="red")+
  geom_text_repel(
    nudge_y      = 0.05,
    direction    = "x",
    angle        = 90,
    vjust        = 0,
    segment.size = 0.2,
    size = 2
  )+
  theme(panel.background = element_blank())+
  scale_x_continuous(limits = c(100, 500), breaks = seq(100,500, by =50))+
  scale_y_continuous(limits = c(0,3), breaks = seq(0,3, by = 1))+
  labs(title = "Partidos del 7 al 12")


### Fase 3

fechas1318 <- c("FECHA 13", "FECHA 14", "FECHA 15", "FECHA 16",
                "FECHA 17", "FECHA 18")

data_13_18 <- data %>% 
  filter(Fecha %in% fechas1318)

data_resumida1318 <- data_13_18 %>% 
  group_by(Equipo) %>% 
  summarise(Pases = mean(pases),
            Goles = mean(score_equipo))

### Graficar 13-18


ggplot(data_resumida1318, aes(x=Pases, y=Goles, label=Equipo))+
  geom_point(color="red")+
  geom_text_repel(
    nudge_y      = 0.05,
    direction    = "x",
    angle        = 90,
    vjust        = 0,
    segment.size = 0.2,
    size = 2
  )+
  theme(panel.background = element_blank())+
  scale_x_continuous(limits = c(100, 500), breaks = seq(100,500, by =50))+
  scale_y_continuous(limits = c(0,3), breaks = seq(0,3, by = 1))+
  labs(title = "Partidos del 13 al 18")

### Juntar los 4 graficos




