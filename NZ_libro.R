getwd()
setwd("C:/Users/jsaravia/Dropbox/Matematicamente posible/Data analysis") # Windows

list.files()



library(directlabels)
library(foreign)
library(ggplot2)
library(psych)
library(effsize) # Para calcular tamaÃ±os del efecto. 
library(orddom)

datanz <- read.csv2("nz.csv", sep = ",")
names(datanz)
head(datanz)
datanz

total <- length(datanz$SEDE)

favor <- sum(datanz$Goles_favor, na.rm = F)

favor/total # Promedio goles por partido. 

area <- sum(datanz$Goles_area)
area # goles en el area

4/favor # Goles de tiro Libre
area/favor # Proproción goles dentro del área. 
2/favor # Goles de cabeza y fuera del área. 
3/favor # Fallas del rival. 


# De los 4 goles que le hicieron 2 fueron de Local y 2 de visitante. 
# Todos los goles que le hicieron fueron de penal. 



