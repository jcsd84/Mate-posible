getwd()
setwd("/Users/home/Dropbox/Matematicamente posible")

library(haven)
library(ggplot2)
library(dplyr)


list.files()

data <- read.csv2("Conmebol_partidos.csv", sep = ",")



cor.test(data$pases, data$disparo_afuera)
cor.test(data$pases, data$disparo_arco)

############################################################
############################################################
############################################################

equipos <- group_by(data, name_) %>%
  summarise(Pases = mean(pases),
            Faltas = mean(faltas),
            Recuperaciones = mean(recuperaciones),
            Disparos.al.arco = mean(disparo_arco),
            Disparos.afuera = mean(disparo_afuera),
            Goles = sum(score_),
            Partidos = length(status))

equipos1 <- equipos[-7,] 
data.frame(equipos1)

cor.test(equipos$Pases, equipos$Goles)
a <- lm(equipos$Goles ~ equipos$Pases)
summary(a)


p<-ggplot(equipos1, aes(x=name_, y=Pases)) +
  geom_bar(stat="identity", fill="steelblue")+
  xlab("Equipos") +
  ylab("Pases") +
  theme_classic()
p
data.frame(equipos)

############################################################
############################################################
############################################################

cor.test(equipos$Pases, equipos$Goles)
cor.test(equipos$Disparos.al.arco, equipos$Goles)

b<-ggplot(equipos, aes(x=Pases, y=Goles)) +
  geom_line(colour = "blue")+
  xlab("Pases") +
  ylab("Goles") +
  geom_smooth(method=lm,  linetype="dashed",
              color="darkred", fill="blue") +
  theme_classic()
b

############################################################
############################################################
############################################################

equipos$Goles.reales <- c(19, 16, 41, 26, 21, 26,
                          0, 19, 26, 32, 19)

equipos$prop_goles <- equipos$Goles/equipos$Partidos 
equipos$prop.goles.reales <- equipos$Goles.reales/equipos$Partidos 
data.frame(equipos)


data.escalamiento <- equipos[,c(1:6,9)]



cor.equipos <- cor(data.escalamiento[,-1], method = "pearson") # Crear una matriz de correlaciones
#cor.equipos # ver si la matriz ya se cre?. 
cor.equiposv <- abs(cor.equipos) # Generar una matriz con valores absolutos
#cor.equiposv # revisar si el objeto tiene datos. 



dis.equipos <- sim2diss(cor.equiposv, method = "corr", to.dist = T) # Hacer una matriz de disimilaridades
#dis.equipos # matriz de disimilaridades


mds1 <- mds(dis.equipos, ndim = 2, type = "ordinal", verbose = TRUE) # correr el modelo. 
#mds1 # ver el ajuste del modelo
#summary(mds1) # ver el stress por punto
#head(mds1)
#mds1$spp # Stress por cada punto para ver qu? ?tem desajusta. 
plot(mds1, plot.dim = c(1,2))


