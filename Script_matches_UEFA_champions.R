# Champions league

library(readxl)
library(tidyr)
library(dplyr)
library(data.table)
library(stringr)
library(stringi)

# Champions 2020 Group A

data_2020A <- read_excel("/Users/home/Desktop/UEFA_2020.xlsx", sheet = 1)


data_2020_A <- data_2020A %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2020_A <- na.omit(data_2020_A)
results <- data.frame(str_split_fixed(data_2020_A$count, "–", 2))

data_2020_A <- data.frame(data_2020_A,results)
names(data_2020_A) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2020_A$Home <- toupper(data_2020_A$Home)
data_2020_A$Away <- toupper(data_2020_A$Away)
data_2020_A <- data.table(data_2020_A)

data_2020_A[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2020_A[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]

data_2020_A$Results <- NULL
data_2020_A$Group <- "A" 
data_2020_A$Year <- 2020 

data_2020_A <- data_2020_A  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2020_A,"/Users/home/Downloads/data_2020_A.csv")

# Champions 2020 Group B


data_2020B <- read_excel("/Users/home/Desktop/UEFA_2020.xlsx", sheet = 2)


data_2020_B <- data_2020B %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2020_B <- na.omit(data_2020_B)
results <- data.frame(str_split_fixed(data_2020_B$count, "–", 2))

data_2020_B <- data.frame(data_2020_B,results)
names(data_2020_B) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2020_B$Home <- toupper(data_2020_B$Home)
data_2020_B$Away <- toupper(data_2020_B$Away)
data_2020_B <- data.table(data_2020_B)

data_2020_B[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2020_B[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2020_B$Results <- NULL
data_2020_B$Group <- "B" 
data_2020_B$Year <- 2020 

data_2020_B <- data_2020_B  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2020_B,"/Users/home/Downloads/data_2020_B.csv")

# Champions 2020 Group C


data_2020C <- read_excel("/Users/home/Desktop/UEFA_2020.xlsx", sheet = 3)


data_2020_C <- data_2020C %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2020_C <- na.omit(data_2020_C)
results <- data.frame(str_split_fixed(data_2020_C$count, "–", 2))

data_2020_C <- data.frame(data_2020_C,results)
names(data_2020_C) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2020_C$Home <- toupper(data_2020_C$Home)
data_2020_C$Away <- toupper(data_2020_C$Away)
data_2020_C <- data.table(data_2020_C)

data_2020_C[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2020_C[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2020_C$Results <- NULL
data_2020_C$Group <- "C" 
data_2020_C$Year <- 2020 

data_2020_C <- data_2020_C  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2020_C,"/Users/home/Downloads/data_2020_C.csv")

# Champions 2020 Group D


data_2020D <- read_excel("/Users/home/Desktop/UEFA_2020.xlsx", sheet = 4)


data_2020_D <- data_2020D %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2020_D <- na.omit(data_2020_D)
results <- data.frame(str_split_fixed(data_2020_D$count, "–", 2))

data_2020_D <- data.frame(data_2020_D,results)
names(data_2020_D) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2020_D$Home <- toupper(data_2020_D$Home)
data_2020_D$Away <- toupper(data_2020_D$Away)
data_2020_D <- data.table(data_2020_D)

data_2020_D[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2020_D[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2020_D$Results <- NULL
data_2020_D$Group <- "D" 
data_2020_D$Year <- 2020 

data_2020_D <- data_2020_D  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2020_D,"/Users/home/Downloads/data_2020_D.csv")

# Champions 2020 Group E


data_2020E <- read_excel("/Users/home/Desktop/UEFA_2020.xlsx", sheet = 5)


data_2020_E <- data_2020E %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2020_E <- na.omit(data_2020_E)
results <- data.frame(str_split_fixed(data_2020_E$count, "–", 2))

data_2020_E <- data.frame(data_2020_E,results)
names(data_2020_E) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2020_E$Home <- toupper(data_2020_E$Home)
data_2020_E$Away <- toupper(data_2020_E$Away)
data_2020_E <- data.table(data_2020_E)

data_2020_E[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2020_E[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2020_E$Results <- NULL
data_2020_E$Group <- "E" 
data_2020_E$Year <- 2020 

data_2020_E <- data_2020_E  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2020_E,"/Users/home/Downloads/data_2020_E.csv")

# Champions 2020 Group F


data_2020F <- read_excel("/Users/home/Desktop/UEFA_2020.xlsx", sheet = 6)


data_2020_F <- data_2020F %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2020_F <- na.omit(data_2020_F)
results <- data.frame(str_split_fixed(data_2020_F$count, "–", 2))

data_2020_F <- data.frame(data_2020_F,results)
names(data_2020_F) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2020_F$Home <- toupper(data_2020_F$Home)
data_2020_F$Away <- toupper(data_2020_F$Away)
data_2020_F <- data.table(data_2020_F)

data_2020_F[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2020_F[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2020_F$Results <- NULL
data_2020_F$Group <- "F" 
data_2020_F$Year <- 2020 

data_2020_F <- data_2020_F  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2020_F,"/Users/home/Downloads/data_2020_F.csv")

# Champions 2020 Group G


data_2020G <- read_excel("/Users/home/Desktop/UEFA_2020.xlsx", sheet = 7)


data_2020_G <- data_2020G %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2020_G <- na.omit(data_2020_G)
results <- data.frame(str_split_fixed(data_2020_G$count, "–", 2))

data_2020_G <- data.frame(data_2020_G,results)
names(data_2020_G) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2020_G$Home <- toupper(data_2020_G$Home)
data_2020_G$Away <- toupper(data_2020_G$Away)
data_2020_G <- data.table(data_2020_G)

data_2020_G[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2020_G[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2020_G$Results <- NULL
data_2020_G$Group <- "G" 
data_2020_G$Year <- 2020 

data_2020_G <- data_2020_G  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2020_G,"/Users/home/Downloads/data_2020_G.csv")

# Champions 2020 Group H


data_2020H <- read_excel("/Users/home/Desktop/UEFA_2020.xlsx", sheet = 8)


data_2020_H <- data_2020H %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2020_H <- na.omit(data_2020_H)
results <- data.frame(str_split_fixed(data_2020_H$count, "–", 2))

data_2020_H <- data.frame(data_2020_H,results)
names(data_2020_H) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2020_H$Home <- toupper(data_2020_H$Home)
data_2020_H$Away <- toupper(data_2020_H$Away)
data_2020_H <- data.table(data_2020_H)

data_2020_H[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2020_H[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2020_H$Results <- NULL
data_2020_H$Group <- "H" 
data_2020_H$Year <- 2020 

data_2020_H <- data_2020_H  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2020_H,"/Users/home/Downloads/data_2020_H.csv")

data_2020AH <- bind_rows(data_2020_A,data_2020_B,data_2020_C,
data_2020_D,data_2020_E,data_2020_F,
data_2020_G,data_2020_H) 

fwrite(data_2020AH,"/Users/home/Downloads/data_2020_AH.csv")

