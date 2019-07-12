# Peru eliminatorias

partidos <- c(1:11)
partidos

resultados <- c(0,0,2,0,1,0,2,2,1,0,1)
resultados

tabla <- matrix(c(partidos,resultados), ncol = 2, dimnames = list(c(),c("partidos","resultados")))
tabla

plot((tabla), col = "red", main = "Perú en eliminatorias", type = "l", lty = "dashed")
lines(lowess(tabla), col = "blue")
abline(lm)
summary(tabla)

tabla

puntos <- c(0,0,3,3,4,4,7,10,11,11,14)
tabla1 <- matrix(c(tabla,puntos), ncol = 3, dimnames = list(c(), c("partidos","resultados", "puntos")))
  
tabla1

plot((puntos~partidos), col = "red", main = "Perú en eliminatorias", type = "l", lty = "dashed")
lines(lowess(tabla), col = "blue")

eliminatoria18 <- rep(0, 11)
eliminatoria18


tabla2018 <- matrix(c(tabla1,eliminatoria18), ncol= 4, dimnames = list(c(),c("partidos","resultados", "puntos", "eliminatoria")))
tabla2018

t2018 <- tabla2018[,c(1,3,4)]
t2018

eliminatoria14 <- rep(1, 11)

puntos <- c(3,3,3,3,3,6,7,8,8,11,14)

tabla2014 <- matrix(c(partidos,puntos,eliminatoria14), ncol = 3, dimnames = list(c(), c("partidos","puntos", "eliminatoria")))
tabla2014

t2018

tablaf <- rbind(t2018,tabla2014)
tablaf
tablafdf <- data.frame(tablaf)
tablafdf <- NA
tablafdf 
library(car)

tablafdf$eliminatoria <- as.factor(tablafdf$eliminatoria)
class(tablafdf$eliminatoria)

tablafdf$eliminatoria[tablafdf$eliminatoria == "0"] <- "2018"
tablafdf$eliminatoria[tablafdf$eliminatoria == "1"] <- "2014"

scatterplot(puntos~partidos | eliminatoria, reg.line = F, span=1, smoother=loessLine,
            data = tablafdf, xlab= "partidos", ylab = "Puntos", main= "Perú",
           labels=row.names(tablafdf), grid  = F)

puntos98 <- c(0,1,2,3,5,5,8,8,9,12,12)

eliminatoria98 <- rep(2,11)

tabla98 <- matrix(c(partidos,puntos98, eliminatoria98), ncol = 3, dimnames = list(c(),c("partidos","puntos", "eliminatoria")))
tabla98

tablaf1 <- rbind(t2018,tabla2014, tabla98)
tablaf1

tablaf1 <- data.frame(tablaf1)
tablaf1$eliminatoria[tablaf1$eliminatoria == "0"] <- "2018"
tablaf1$eliminatoria[tablaf1$eliminatoria == "1"] <- "2014"
tablaf1$eliminatoria[tablaf1$eliminatoria == "2"] <- "1998"

tablaf1$eliminatoria <- as.factor(tablaf1$eliminatoria)
class(tablafdf$eliminatoria)

tablaf1
install.packages("car")
library(car)
scatterplot(puntos~partidos | eliminatoria, reg.line = F, span =2, smoother=loessLine,
            data = tablaf1, xlab= "partidos", ylab = "Puntos", main= "Perú en eliminatorias", 
            legend.coords = "topleft", labels=row.names(tablaf1), grid  = F)

difquinto <- c(-3, 
            -3,
               -1,
               -4,
               -4,
               -6,
               -4,
               -3,
               -5,
               -6,
               -3)

t2018f <- matrix(c(t2018,difquinto), ncol = 4, dimnames = list(c(),c("partidos","puntos", "eliminatoria", "diferencia_quinto")))
t2018f

plot(partidos,difquinto, type = "l", lty = "dashed", main = "Peru 2018: Distancia quinto lugar", 
     xlab = "Partidos", ylab = "Distancia en puntos", col = "red")
lines(lowess(partidos,difquinto), col = "blue")

########## Proporci?n de puntos ganados ########
# Per?
#6 partidos local: Gan? 2, empat? 2 y perdi? 2. (Per?) (8/18 puntos posibles)

#Brasil
# Gan? 5, empat? 1 y perdi? (16/18 puntos)

#Argentina

# Gan? 3, empat? 1 y perdi? 1 (10/15 puntos)
