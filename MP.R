getwd()
setwd("C:/Users/jsaravia/Dropbox/Matematicamente posible/Data analysis") # Windows
setwd("/Users/home/Dropbox/Matematicamente posible/Data analysis") # Mac


library(directlabels)
library(haven)
library(ggplot2)
library(psych)
library(effsize) # Para calcular tama??os del efecto. 
library(orddom)
list.files()

#Estas son las ?ltimas eliminatorias Rusia 2018. 

data <- read.csv2("BD_eliminatorias_Rusia.csv", sep = ",")
#dput(data)

names(data)
head(data)
dim(data)
tail(data)
# Hacer tabla resumen de goles seg?n grupo an?lisis. 
tapply(data$Goles_Peru,data$Grupo_analisis, mean)
summary(data$Pases_efectiv)
####################################################################################
####################################################################################
####################################################################################
#Los partidos sin NZ los diferentes equipos y sus puntajes. 

datarusia18 <- read.csv2("Eliminatorias2018.csv", sep = ",")
names(datarusia18)
head(datarusia18)
datarusia18
tail(datarusia18)
library(dplyr)

#Calcular la proporci?n de puntos conseguidos por cada equipo en toda la eliminatoria. 
g <- 3

v <- c("Puntos_Peru", "Puntos_Brasil", "Puntos_Uruguay", 
       "Puntos_Chile", "Puntos_Colombia", "Puntos_Argentina", "Puntos_Paraguay", "Puntos_Ecuador",
       "Puntos_Bolivia", "Puntos_Venezuela")

dataelim_rusia <- datarusia18 %>%
  dplyr::select(v)

head(dataelim_rusia)

x <- vector("numeric", length = 10)

for (i in 1:ncol(dataelim_rusia )) {
  x[i] <- max(dataelim_rusia[,i])/(nrow(datarusia18)*g)
}
x

xmatrix <- matrix(x, nrow = 1, ncol = 10)
xmatrix

colnames(xmatrix) <- c("Proporcion_Puntos_Peru", "Proporcion_Puntos_Brasil", "Proporcion_Puntos_Uruguay", 
                       "Proporcion_Puntos_Chile", "Proporcion_Puntos_Colombia", "Proporcion_Puntos_Argentina", "Proporcion_Puntos_Paraguay", "Proporcion_Puntos_Ecuador",
                       "Proporcion_Puntos_Bolivia", "Proporcion_Puntos_Venezuela")
xmatrix


####################################################################################

Elim2018<- ggplot(data=datarusia18, aes(x=Partidos))+
  geom_line(aes(y= Puntos_Peru, colour="Peru")) +
  geom_line(aes(y= Puntos_Brasil,  colour = "Brasil")) +
  geom_line(aes(y= Puntos_Uruguay, colour ="Uruguay")) +
  geom_line(aes(y= Puntos_Argentina,  colour ="Argentina")) +
  geom_line(aes(y= Puntos_Colombia,  colour ="Colombia")) +
  geom_line(aes(y= Puntos_Chile, colour = "Chile")) +
  geom_line(aes(y= Puntos_Paraguay, colour = "Paraguay")) +
  geom_line(aes(y= Puntos_Ecuador, colour = "Ecuador")) +
  geom_line(aes(y= Puntos_Bolivia, colour = "Bolivia")) +
  geom_line(aes(y= Puntos_Venezuela, colour = "Venezuela")) +
  scale_colour_manual("", 
                      breaks = c("Peru", "Brasil", "Uruguay", "Argentina", "Colombia", "Chile", "Paraguay", "Ecuador", "Bolivia", "Venezuela"),
                      values = c("Peru"="red", "Brasil"="green", "Uruguay"="#458ac6", "Argentina"="blue", "Colombia"="yellow", 
                                 "Chile"="brown", "Paraguay"="pink", "Ecuador"="grey", "Bolivia"="orange", "Venezuela"="black")) +
  scale_x_continuous(limits=c(1, 18), breaks=seq(1,18,by=1)) + 
  scale_y_continuous(limits=c(0, 42), breaks=seq(0,42,by=2)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
Elim2018

####################################################################################
####################################################################################
####################################################################################
####################################################################################

#########################################################################################################
#Per? en ataque cuando gana.

describe.by()

#Defensa

ggplot(data=data, aes(x=SEDE, y=Disp_contr_gen, fill=factor(Grupo_analisis))) +
  geom_bar(stat="identity", position=position_dodge()) +
  scale_fill_discrete(name="Sede",
                      labels=c("Partidos: 1-6", "Partidos: 7-11", "Partidos: 12-16", "Partidos: 17 y 18", "NZ"))+
  theme_classic()+
  xlab("Sede")+
  ylab("Promedio de tiros en contra")



#Ataque

ggplot(data=data, aes(x=SEDE, y=Peru_pases_tot, fill=factor(Grupo_analisis))) +
  geom_bar(stat="identity", position=position_dodge()) +
  scale_fill_discrete(name="Sede",
                      labels=c("Partidos: 1-6", "Partidos: 7-11", "Partidos: 12-16", "Partidos: 17 y 18", "NZ"))+ 
  theme_classic()+
  xlab("Sede")+
  ylab("Promedio de pases")

#########################################################################################################


#Calculos de tama??o del efecto. 

cohen.d(data$Peru_pases_tot ~ data$SEDE, hedges.correction=TRUE)

# Ideas generales de lo que fue Peru y sus tres momentos. 

# Basic line plot. Como le fue a Peru partido a partido.  Puntos_2018
general <- ggplot(data=data, aes(x=ID, y=Puntos))+
  geom_line(linetype="solid", color="#458ac6", size = 1) +
  scale_x_continuous(limits=c(1, 18), breaks=seq(1,18,by=1)) + 
  scale_y_continuous(limits=c(0, 26), breaks=seq(0,26,by=2)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
general

# Basic line plot. Como le fue a Peru partido a partido.  
generalinea <- ggplot(data=data, aes(x=ID, y=Puntos))+
  geom_line(linetype="solid", color="#458ac6", size = 1) +
  scale_x_continuous(limits=c(1, 16), breaks=seq(1,16,by=1)) + 
  scale_y_continuous(limits=c(0, 25), breaks=seq(0,25,by=2)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos") +
  geom_vline(xintercept=6, color ="red")+
  geom_vline(xintercept=12, color ="red")+
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
generalinea



# Como le fue a Per?? partido a partido de local y visitante. 
Sede<-ggplot(data, aes(x=ID, y=Puntos, group=SEDE)) +
  geom_line(aes(color=SEDE))+
  geom_point(aes(color=SEDE)) +
  scale_x_continuous(limits=c(1, 20), breaks=seq(1,20,by=1)) + 
  scale_y_continuous(limits=c(0, 26), breaks=seq(0,26,by=2)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos") 
Sede

#Tiros al arco 

general <- ggplot(data=data, aes(x=ID, y=Peru_disp_gen))+
  geom_line(linetype="solid", color="#458ac6", size = 1) +
  scale_x_continuous(limits=c(1, 20), breaks=seq(1,20,by=1)) + 
  scale_y_continuous(limits=c(0, 20), breaks=seq(0,20,by=2)) + theme_classic() +
  labs(x = "Partidos", y = "Tiros al arco") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
general


#Tiros al arco local y visitante

TirosSede<-ggplot(data, aes(x=ID, y=Peru_disp_gen, group=SEDE)) +
  geom_line(aes(color=SEDE))+
  geom_point(aes(color=SEDE)) +
  scale_x_continuous(limits=c(1, 20), breaks=seq(1,20,by=1)) + 
  scale_y_continuous(limits=c(0, 20), breaks=seq(0,20,by=2)) + theme_classic() +
  labs(x = "Partidos", y = "Tiros") 
TirosSede

# Faltas 

Faltas <- ggplot(data=data, aes(x=ID, y=Peru_faltas))+
  geom_line(linetype="solid", color="#458ac6", size = 1) +
  scale_x_continuous(limits=c(1, 20), breaks=seq(1,20,by=1)) + 
  scale_y_continuous(limits=c(0, 26), breaks=seq(0,26,by=2)) + theme_classic() +
  labs(x = "Partidos", y = "Faltas (fouls)") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
Faltas

# Faltas local y visitante

FaltasSede<-ggplot(data, aes(x=ID, y=Peru_faltas, group=SEDE)) +
  geom_line(aes(color=SEDE))+
  geom_point(aes(color=SEDE)) +
  scale_x_continuous(limits=c(1, 20), breaks=seq(1,20,by=1)) + 
  scale_y_continuous(limits=c(0, 25), breaks=seq(0,25,by=2)) + theme_classic() +
  labs(x = "Partidos", y = "Faltas") 
FaltasSede

######  ######  ######  ######  ######  ######

data$prop_tirot_tigol <- data$Goles_Peru/data$Peru_disp_gen
describe(data$prop_tirot_tigol)
hist(data$prop_tirot_tigol)


######  ######  ######  ######  ######  ######  ######


describe(data)
describe.by(data, data$SEDE)
describe.by(data, data$Resultado_g2_e1_p0)



####################################################################################
####################################################################################
#########################################################################################

################### Segmentar la data en 3 ###########

calentamiento <- subset(data, Grupo_analisis == "0")
primertiempo <- subset(data, Grupo_analisis == "1")
segundotiempo <- subset(data, Grupo_analisis == "2")
rectafinal <- subset(data, Grupo_analisis == "3")
Perunz <- subset(data, Grupo_analisis == "4")



calentamiento
primertiempo
segundotiempo
rectafinal
Perunz

describe.by(calentamiento$Goles_contr, calentamiento$SEDE)

#########################################
#Peru cuando gana

Peru_gana <- subset(data, Resultado_g2_e1_p0 == "2")
Peru_gana

mean(Peru_gana$Peru_pases_tot, na.rm = T)
mean(Peru_gana$Goles_Peru)
mean(Peru_gana$Peru_correctos_tot, na.rm = T) # 260
mean(Peru_gana$Peru_disp_gen) # 10.7
mean(Peru_gana$Disp_contr_gen, na.rm = T) # 7.66
mean(Peru_gana$Disp_contra_arco, na.rm = T) # 2.66
mean(Peru_gana$Peru_min_1er_gol, na.rm = T)
mean(Peru_gana$Goles_contr)
mean(Peru_gana$Peru_faltas, na.rm = T)

#L y #V cuando gana

describeBy(Peru_gana$Peru_pases_tot, Peru_gana$SEDE)

###Probando algunas relaciones con toda la data###################


m1 <- lm(Goles_Peru ~ Peru_disp_arco + data$Peru_pases_tot, data=data)
summary(m1)

cor.test(data$Goles_Peru, data$Peru_disp_arco, method = "pearson", na.rm = T) # Goles disparos al arco.
cor.test(data$Goles_Peru, data$Peru_disp_afuera, method = "pearson", na.rm = T) # Goles disparos afuera.

cor.test(data$Goles_Peru, data$Peru_recupero, method = "pearson", na.rm = T) # Goles con recuperaci?n

cor.test(data$Goles_Peru, data$Peru_pases_tot, method = "pearson", na.rm = T) # Goles y pases.

Pases_goles <- ggplot(data=data, aes(x=Peru_pases_tot, y=Goles_Peru, group=Resultado_g2_e1_p0))+
  geom_line(linetype="solid", color="#458ac6", size = 1) +
  geom_smooth(method='lm',formula=y~x, colour = "red") +
  scale_x_continuous(limits=c(1, 500), breaks=seq(1,500,by=30)) + 
  scale_y_continuous(limits=c(0, 6), breaks=seq(0,6,by=1)) + theme_classic() +
  labs(x = "Pases", y = "Goles") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
Pases_goles

cor.test(data$Goles_Peru, data$Peru_correctos_tot, method = "pearson", na.rm = T)

cor.test(data$Goles_Peru, data$Peru_faltas, method = "pearson", na.rm = T)

data$Peru_pases_tot2 <- data$Peru_pases_tot^2
data$Peru_pases_tot3 <- data$Peru_pases_tot^3

m1 <- lm(Goles_Peru ~ data$Peru_pases_tot, data=data)
summary(m1)

m1 <- lm(Goles_Peru ~ data$Peru_pases_tot + data$Peru_pases_tot2, data=data)
summary(m1)



m01 <- lm(Goles_Peru ~ data$Peru_pases_tot + data$SEDE_NUM,  data=data)
summary(m1)

m1 <- lm(Goles_Peru ~ data$Peru_pases_tot + data$SEDE_NUM + data$Peru_pases_tot*data$SEDE_NUM,  data=data)
summary(m1)

anova(m01,m1)


m1 <- lm(Goles_Peru ~ data$Peru_pases_tot + data$Peru_pases_tot2 + SEDE_NUM, data=data)
summary(m1)


ggplot(data, aes(x=Peru_pases_tot, y=Goles_Peru)) +
  geom_point(shape=1)      # Use hollow circles
geom_smooth(se=FALSE)            # Add a loess smoothed fit curve with confidence region

ggplot(data, aes(x=Peru_recupero, y=Goles_Peru)) +
  geom_point(shape=1)      # Use hollow circles
geom_smooth(se=FALSE)  

ggplot(data, aes(x=Peru_faltas, y=Goles_Peru)) +
  geom_point(shape=1)      # Use hollow circles
geom_smooth(se=FALSE)


#####################Probando lo que ocurri? en los partidos que gan? y perdi?##############

m01 <- glm(Resultado_g2_e1_p0 ~ Peru_pases_tot,  family ="poisson",data=data)
summary(m01)

m01 <- glm(Resultado_g2_e1_p0 ~ Goles_Peru + Peru_pases_tot,  family ="poisson",data=data)
summary(m01)

m02 <- glm(Resultado_g2_e1_p0 ~ SEDE_NUM,  family ="poisson",data=data)
summary(m02)

#Calentamiento

# descriptivos calentamiento
propperucal <- max(calentamiento$Puntos)/(nrow(calentamiento)*g)
propperucal

mean(calentamiento$Goles_Peru)

describe(calentamiento$Goles_Peru)


gcalentamiento <- ggplot(data=calentamiento, aes(x=ID, y=Goles_Peru))+
  geom_line(linetype="solid", color="#458ac6", size = 1) +
  scale_x_continuous(limits=c(1, 6), breaks=seq(1,6,by=1)) + 
  scale_y_continuous(limits=c(0, 5), breaks=seq(0,5,by=1)) + theme_classic() +
  labs(x = "Partidos", y = "Goles") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
gcalentamiento

gcalentamientolv<-ggplot(data=calentamiento, aes(x=ID, y=Goles_Peru, group=SEDE)) +
  geom_line(aes(color=SEDE))+
  geom_point(aes(color=SEDE)) +
  scale_x_continuous(limits=c(1, 6), breaks=seq(1,6,by=1)) + 
  scale_y_continuous(limits=c(0, 5), breaks=seq(0,5,by=1)) + theme_classic() +
  labs(x = "Partidos", y = "Goles") 
gcalentamientolv

sum(calentamiento$Goles_cont)
sum(primertiempo$Goles_cont)
sum(segundotiempo$Goles_cont)
sum(data$Goles_cont)

sum(calentamiento$Goles_Peru)
sum(primertiempo$Goles_Peru)
sum(segundotiempo$Goles_Peru)
sum(data$Goles_Peru)


########################################################
#Calentamiento

################################Puntos calentamiento##############

gcalp <- ggplot(data=calentamiento, aes(x=ID, y=Puntos))+
  geom_line(linetype="solid", color="#458ac6", size = 1) +
  scale_x_continuous(limits=c(1, 6), breaks=seq(1, 6,by=1)) + 
  scale_y_continuous(limits=c(0, 25), breaks=seq(0,5,by=1)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
gcalp

gcallvp<-ggplot(calentamiento, aes(x=ID, y=Puntos, group=SEDE)) +
  geom_line(aes(color=SEDE))+
  geom_point(aes(color=SEDE)) +
  scale_x_continuous(limits=c(1, 6), breaks=seq(1, 6,by=1)) + 
  scale_y_continuous(limits=c(0, 25), breaks=seq(0,5,by=1)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos") 
gcallvp


################################################################################
#Primer tiempo

describe(primertiempo)
primertiempo



#########################################################
# descriptivos primer tiempo

gpt <- ggplot(data=primertiempo, aes(x=ID, y=Goles_Peru))+
  geom_line(linetype="solid", color="#458ac6", size = 1) +
  scale_x_continuous(limits=c(7, 12), breaks=seq(7, 12,by=1)) + 
  scale_y_continuous(limits=c(0, 5), breaks=seq(0,5,by=1)) + theme_classic() +
  labs(x = "Partidos", y = "Goles") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
gpt

gptlv<-ggplot(primertiempo, aes(x=ID, y=Goles_Peru, group=SEDE)) +
  geom_line(aes(color=SEDE))+
  geom_point(aes(color=SEDE)) +
  scale_x_continuous(limits=c(7, 12), breaks=seq(7,12,by=1)) + 
  scale_y_continuous(limits=c(0, 5), breaks=seq(0,5,by=1)) + theme_classic() +
  labs(x = "Partidos", y = "Goles") 
gptlv

################################Puntos

gptp <- ggplot(data=primertiempo, aes(x=ID, y=Puntos))+
  geom_line(linetype="solid", color="#458ac6", size = 1) +
  scale_x_continuous(limits=c(13, 16), breaks=seq(13, 16,by=1)) + 
  scale_y_continuous(limits=c(0, 25), breaks=seq(0,5,by=1)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
gptp

gptlvp<-ggplot(primertiempo, aes(x=ID, y=Puntos, group=SEDE)) +
  geom_line(aes(color=SEDE))+
  geom_point(aes(color=SEDE)) +
  scale_x_continuous(limits=c(13, 16), breaks=seq(13,16,by=1)) + 
  scale_y_continuous(limits=c(0, 25), breaks=seq(0,5,by=1)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos") 
gptlvp

########################################################
#Segundo tiempo

describe(segundotiempo)

describe.by(segundotiempo, segundotiempo$SEDE)
segundotiempo


#########################################################
# descriptivos segundo tiempo

gst <- ggplot(data=segundotiempo, aes(x=ID, y=Goles_Peru))+
  geom_line(linetype="solid", color="#458ac6", size = 1) +
  scale_x_continuous(limits=c(13, 16), breaks=seq(13, 16,by=1)) + 
  scale_y_continuous(limits=c(0, 5), breaks=seq(0,5,by=1)) + theme_classic() +
  labs(x = "Partidos", y = "Goles") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
gst

gstlv<-ggplot(segundotiempo, aes(x=ID, y=Goles_Peru, group=SEDE)) +
  geom_line(aes(color=SEDE))+
  geom_point(aes(color=SEDE)) +
  scale_x_continuous(limits=c(13, 16), breaks=seq(13, 16,by=1)) + 
  scale_y_continuous(limits=c(0, 5), breaks=seq(0,5,by=1)) + theme_classic() +
  labs(x = "Partidos", y = "Goles") 
gstlv

########################################################

# descriptivos segundo tiempo (puntos)

gstp <- ggplot(data=segundotiempo, aes(x=ID, y=Puntos))+
  geom_line(linetype="solid", color="#458ac6", size = 1) +
  scale_x_continuous(limits=c(13, 16), breaks=seq(13, 16,by=1)) + 
  scale_y_continuous(limits=c(0, 25), breaks=seq(0,5,by=1)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
gstp

gstlvp<-ggplot(segundotiempo, aes(x=ID, y=Puntos, group=SEDE)) +
  geom_line(aes(color=SEDE))+
  geom_point(aes(color=SEDE)) +
  scale_x_continuous(limits=c(13, 16), breaks=seq(13, 16,by=1)) + 
  scale_y_continuous(limits=c(0, 25), breaks=seq(0,5,by=1)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos") 
gstlvp

####################################################

###############Creando la funci?n de ELO para futbol##############
# Weighted average of points obtained during the last four years.
# Importance of match
# Strength of opposing team
# Strength of the confederations are all taken into account

## The number of points for team i in a match between teams i and j is given by

#Equation: 

#Pij = Mij ? Iij ? Tj ? 1/2(Ci + Cj)

#Mij = Match result W:3, D: 1, L: 0
#Iij = Importance of match. 1. friendly, 2.5 qualifier, 3, for confederation, 4. WC
#Tj = 200-Rj Rj = ranking of team j (rival) in the FIFA world Ranking. 
# Note: Minimum Tj is 50 and Tj = 200 for the team leading the FIFA world cup at match moment.
#Ci = the strength of the conferetation the team belongs (January 2016). 
#1 for conmebol, 0.99 UEFA, 0.85 other confederations. 

#i is team
#j is rival

#Finally, played during the last 12 months count fully, matches
#between 1 and 2 year old count 50%, matches 2-3 years old count 30% and matches between
#3 and 4 years old count 20%. Matches older than 4 years do not count at all.

# Por ejemplo: 
#Peru vs Croacia (si gana Per?)

# Tj el valor que se resta es el ranking del rival (en este caso croacia)

Mij <- c(3,1,0) # resultados posibles
Iij <- c(1,2.5,3,4) # importancia del partido
Tj <- 1:100 #Esto a?n se puede mejorar para automatizar (solo pones el ranking del rival)
Ci <- c(1, 0.99, 0.85) # Confederaci?n del equipo
Cj <- c(1, 0.99, 0.85) # Confederaci?n del rival. 

#Peru ranking 11
# Croacia ranking 15

Elo.prueba <- function(a,b,c,d,e) {
  (a*b*(200-c)*(1/2*(d+e))) 
}

Elo.prueba(Mij[1],Iij[1],Tj[15],Ci[1],Cj[2]) # Ya el calculo es correcto,ahora me falta saber c?mo cambia.


###############Creando el ESPY para futbol##############






####################1998####################################1998####################################1998################
####################1998####################################1998################
####################1998####################################1998####################################1998################
####################1998####################################1998####################################1998################

data98 <- read.csv2("BD_eliminatorias_98.csv", sep = ",")
names(data98)
head(data98)
data98

general98 <- ggplot(data=data98, aes(x=ID_1998, y=Puntos))+
  geom_line(linetype="solid", color="red", size = 1) +
  scale_x_continuous(limits=c(1, 18), breaks=seq(1,18,by=1)) + 
  scale_y_continuous(limits=c(0, 26), breaks=seq(0,26,by=2)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos_1998") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
general98

sum(data$Goles_Peru)
sum(data$Goles_fuera_area, na.rm = T)
sum(data$Peru_goles2do.tiempo, na.rm = T)

#########################1998###################

####################################################################################
#####################Todas las eliminatorias de Per? desde 1998 al 2018###############

data982018 <- read.csv2("BD_eliminatorias_98_2018.csv", sep = ",")
names(data982018)
head(data982018)
data982018


general982018 <- ggplot(data=data982018, aes(x=Partidos))+
  geom_line(aes(y= Puntos_98), linetype="solid", colour="red", size = 1) +
  geom_line(aes(y= Puntos_2002), linetype="solid", colour = "orange", size = 1) +
  geom_line(aes(y= Puntos_2006), linetype="solid", colour ="blue", size = 1) +
  geom_line(aes(y= Puntos_2010), linetype="solid", colour ="purple", size = 1) +
  geom_line(aes(y= Puntos_2014), linetype="solid", colour ="brown", size = 1) +
  geom_line(aes(y= Puntos_2018), linetype="solid", colour = "#458ac6", size = 1) +
  scale_x_continuous(limits=c(1, 18), breaks=seq(1,18,by=1)) + 
  scale_y_continuous(limits=c(0, 26), breaks=seq(0,26,by=2)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
general982018


general982018 <- ggplot(data=data982018, aes(x=Partidos))+
  geom_line(aes(y= Puntos_98, colour="1998 (Oblitas)")) +
  geom_line(aes(y= Puntos_2002,  colour = "2002 (Maturana-Uribe)")) +
  geom_line(aes(y= Puntos_2006, colour ="2006 (Autori-Ternero)")) +
  geom_line(aes(y= Puntos_2010,  colour ="2010 (Del Solar)")) +
  geom_line(aes(y= Puntos_2014,  colour ="2014 (Markarian-Bengochea)")) +
  geom_line(aes(y= Puntos_2018, colour = "2018 (Gareca)")) +
  scale_colour_manual("", 
                      breaks = c("1998 (Oblitas)", "2002 (Maturana-Uribe)", "2006 (Autori-Ternero)", "2010 (Del Solar)", "2014 (Markarian-Bengochea)", "2018 (Gareca)"),
                      values = c("1998 (Oblitas)"="red", "2002 (Maturana-Uribe)"="orange", "2006 (Autori-Ternero)"="blue", "2010 (Del Solar)"="purple", "2014 (Markarian-Bengochea)"="brown", 
                                 "2018 (Gareca)"="#458ac6")) +
  scale_x_continuous(limits=c(1, 18), breaks=seq(1,18,by=1)) + 
  scale_y_continuous(limits=c(0, 26), breaks=seq(0,26,by=2)) + theme_classic() +
  labs(x = "Partidos", y = "Puntos") +
  theme(axis.title = element_text(size = 12, color = "black"),
        axis.title.x = element_text(vjust = 0, angle = 0, face = "italic", size = 12))
general982018



####################################################################################
#Per? del 1998 - 2018 (por partido)

data9820181 <- read.csv2("BD_eliminatorias_98_2018_1.csv", sep = ",")
names(data9820181)
head(data9820181)
data9820181

##########################
####################################################################################
####################################################################################
####################################################################################





