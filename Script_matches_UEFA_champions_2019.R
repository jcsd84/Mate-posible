
library(readxl)
library(tidyr)
library(dplyr)
library(data.table)
library(stringr)
library(stringi)

# Champions 2019 Group A

data_2019A <- read_excel("/Users/home/Desktop/UEFA_2019.xlsx", sheet = 1)


data_2019_A <- data_2019A %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2019_A <- na.omit(data_2019_A)
results <- data.frame(str_split_fixed(data_2019_A$count, "–", 2))

data_2019_A <- data.frame(data_2019_A,results)
names(data_2019_A) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2019_A$Home <- toupper(data_2019_A$Home)
data_2019_A$Away <- toupper(data_2019_A$Away)
data_2019_A <- data.table(data_2019_A)

data_2019_A[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2019_A[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2019_A$Results <- NULL
data_2019_A$Group <- "A" 
data_2019_A$Year <- 2019 

data_2019_A <- data_2019_A  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2019_A,"/Users/home/Downloads/data_2019_A.csv")

# Champions 2019 Group B


data_2019B <- read_excel("/Users/home/Desktop/UEFA_2019.xlsx", sheet = 2)


data_2019_B <- data_2019B %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2019_B <- na.omit(data_2019_B)
results <- data.frame(str_split_fixed(data_2019_B$count, "–", 2))

data_2019_B <- data.frame(data_2019_B,results)
names(data_2019_B) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2019_B$Home <- toupper(data_2019_B$Home)
data_2019_B$Away <- toupper(data_2019_B$Away)
data_2019_B <- data.table(data_2019_B)

data_2019_B[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2019_B[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2019_B$Results <- NULL
data_2019_B$Group <- "B" 
data_2019_B$Year <- 2019 

data_2019_B <- data_2019_B  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2019_B,"/Users/home/Downloads/data_2019_B.csv")

# Champions 2019 Group C


data_2019C <- read_excel("/Users/home/Desktop/UEFA_2019.xlsx", sheet = 3)


data_2019_C <- data_2019C %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2019_C <- na.omit(data_2019_C)
results <- data.frame(str_split_fixed(data_2019_C$count, "–", 2))

data_2019_C <- data.frame(data_2019_C,results)
names(data_2019_C) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2019_C$Home <- toupper(data_2019_C$Home)
data_2019_C$Away <- toupper(data_2019_C$Away)
data_2019_C <- data.table(data_2019_C)

data_2019_C[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2019_C[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2019_C$Results <- NULL
data_2019_C$Group <- "C" 
data_2019_C$Year <- 2019 

data_2019_C <- data_2019_C  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2019_C,"/Users/home/Downloads/data_2019_C.csv")

# Champions 2019 Group D


data_2019D <- read_excel("/Users/home/Desktop/UEFA_2019.xlsx", sheet = 4)


data_2019_D <- data_2019D %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2019_D <- na.omit(data_2019_D)
results <- data.frame(str_split_fixed(data_2019_D$count, "–", 2))

data_2019_D <- data.frame(data_2019_D,results)
names(data_2019_D) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2019_D$Home <- toupper(data_2019_D$Home)
data_2019_D$Away <- toupper(data_2019_D$Away)
data_2019_D <- data.table(data_2019_D)

data_2019_D[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2019_D[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2019_D$Results <- NULL
data_2019_D$Group <- "D" 
data_2019_D$Year <- 2019 

data_2019_D <- data_2019_D  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2019_D,"/Users/home/Downloads/data_2019_D.csv")

# Champions 2019 Group E


data_2019E <- read_excel("/Users/home/Desktop/UEFA_2019.xlsx", sheet = 5)


data_2019_E <- data_2019E %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2019_E <- na.omit(data_2019_E)
results <- data.frame(str_split_fixed(data_2019_E$count, "–", 2))

data_2019_E <- data.frame(data_2019_E,results)
names(data_2019_E) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2019_E$Home <- toupper(data_2019_E$Home)
data_2019_E$Away <- toupper(data_2019_E$Away)
data_2019_E <- data.table(data_2019_E)

data_2019_E[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2019_E[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2019_E$Results <- NULL
data_2019_E$Group <- "E" 
data_2019_E$Year <- 2019 

data_2019_E <- data_2019_E  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2019_E,"/Users/home/Downloads/data_2019_E.csv")

# Champions 2019 Group F


data_2019F <- read_excel("/Users/home/Desktop/UEFA_2019.xlsx", sheet = 6)


data_2019_F <- data_2019F %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2019_F <- na.omit(data_2019_F)
results <- data.frame(str_split_fixed(data_2019_F$count, "–", 2))

data_2019_F <- data.frame(data_2019_F,results)
names(data_2019_F) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2019_F$Home <- toupper(data_2019_F$Home)
data_2019_F$Away <- toupper(data_2019_F$Away)
data_2019_F <- data.table(data_2019_F)

data_2019_F[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2019_F[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2019_F$Results <- NULL
data_2019_F$Group <- "F" 
data_2019_F$Year <- 2019 

data_2019_F <- data_2019_F  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2019_F,"/Users/home/Downloads/data_2019_F.csv")

# Champions 2019 Group G


data_2019G <- read_excel("/Users/home/Desktop/UEFA_2019.xlsx", sheet = 7)


data_2019_G <- data_2019G %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2019_G <- na.omit(data_2019_G)
results <- data.frame(str_split_fixed(data_2019_G$count, "–", 2))

data_2019_G <- data.frame(data_2019_G,results)
names(data_2019_G) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2019_G$Home <- toupper(data_2019_G$Home)
data_2019_G$Away <- toupper(data_2019_G$Away)
data_2019_G <- data.table(data_2019_G)

data_2019_G[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2019_G[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2019_G$Results <- NULL
data_2019_G$Group <- "G" 
data_2019_G$Year <- 2019 

data_2019_G <- data_2019_G  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2019_G,"/Users/home/Downloads/data_2019_G.csv")

# Champions 2019 Group H


data_2019H <- read_excel("/Users/home/Desktop/UEFA_2019.xlsx", sheet = 8)


data_2019_H <- data_2019H %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2019_H <- na.omit(data_2019_H)
results <- data.frame(str_split_fixed(data_2019_H$count, "–", 2))

data_2019_H <- data.frame(data_2019_H,results)
names(data_2019_H) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2019_H$Home <- toupper(data_2019_H$Home)
data_2019_H$Away <- toupper(data_2019_H$Away)
data_2019_H <- data.table(data_2019_H)

data_2019_H[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2019_H[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2019_H$Results <- NULL
data_2019_H$Group <- "H" 
data_2019_H$Year <- 2019 

data_2019_H <- data_2019_H  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2019_H,"/Users/home/Downloads/data_2019_H.csv")

data_2019AH <- bind_rows(data_2019_A,data_2019_B,data_2019_C,
                         data_2019_D,data_2019_E,data_2019_F,
                         data_2019_G,data_2019_H) 

fwrite(data_2019AH,"/Users/home/Downloads/data_2019_AH.csv")