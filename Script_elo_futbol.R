###### Creando la funcion de ELO para futbol##############
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
Tj <- 1:100 #Esto aun se puede mejorar para automatizar (solo pones el ranking del rival)
Ci <- c(1, 0.99, 0.85) # Confederacion del equipo
Cj <- c(1, 0.99, 0.85) # Confederacion del rival. 

#Peru ranking 11
# Croacia ranking 15

Elo.prueba <- function(a,b,c,d,e) {
  (a*b*(200-c)*(1/2*(d+e))) 
}

Elo.prueba(Mij[1],Iij[1],Tj[15],Ci[1],Cj[2]) # Ya el calculo es correcto,ahora me falta saber como cambia.