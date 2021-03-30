
library(readxl)
library(tidyr)
library(dplyr)
library(data.table)
library(stringr)
library(stringi)

# Champions 2017 Group A

data_2017A <- read_excel("/Users/home/Desktop/UEFA_2017.xlsx", sheet = 1)


data_2017_A <- data_2017A %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2017_A <- na.omit(data_2017_A)
results <- data.frame(str_split_fixed(data_2017_A$count, "–", 2))

data_2017_A <- data.frame(data_2017_A,results)
names(data_2017_A) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2017_A$Home <- toupper(data_2017_A$Home)
data_2017_A$Away <- toupper(data_2017_A$Away)
data_2017_A <- data.table(data_2017_A)

data_2017_A[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2017_A[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2017_A$Results <- NULL
data_2017_A$Group <- "A" 
data_2017_A$Year <- 2017 

data_2017_A <- data_2017_A  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2017_A,"/Users/home/Downloads/data_2017_A.csv")

# Champions 2017 Group B


data_2017B <- read_excel("/Users/home/Desktop/UEFA_2017.xlsx", sheet = 2)


data_2017_B <- data_2017B %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2017_B <- na.omit(data_2017_B)
results <- data.frame(str_split_fixed(data_2017_B$count, "–", 2))

data_2017_B <- data.frame(data_2017_B,results)
names(data_2017_B) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2017_B$Home <- toupper(data_2017_B$Home)
data_2017_B$Away <- toupper(data_2017_B$Away)
data_2017_B <- data.table(data_2017_B)

data_2017_B[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2017_B[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2017_B$Results <- NULL
data_2017_B$Group <- "B" 
data_2017_B$Year <- 2017 

data_2017_B <- data_2017_B  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2017_B,"/Users/home/Downloads/data_2017_B.csv")

# Champions 2017 Group C


data_2017C <- read_excel("/Users/home/Desktop/UEFA_2017.xlsx", sheet = 3)


data_2017_C <- data_2017C %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2017_C <- na.omit(data_2017_C)
results <- data.frame(str_split_fixed(data_2017_C$count, "–", 2))

data_2017_C <- data.frame(data_2017_C,results)
names(data_2017_C) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2017_C$Home <- toupper(data_2017_C$Home)
data_2017_C$Away <- toupper(data_2017_C$Away)
data_2017_C <- data.table(data_2017_C)

data_2017_C[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2017_C[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2017_C$Results <- NULL
data_2017_C$Group <- "C" 
data_2017_C$Year <- 2017 

data_2017_C <- data_2017_C  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2017_C,"/Users/home/Downloads/data_2017_C.csv")

# Champions 2017 Group D


data_2017D <- read_excel("/Users/home/Desktop/UEFA_2017.xlsx", sheet = 4)


data_2017_D <- data_2017D %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2017_D <- na.omit(data_2017_D)
results <- data.frame(str_split_fixed(data_2017_D$count, "–", 2))

data_2017_D <- data.frame(data_2017_D,results)
names(data_2017_D) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2017_D$Home <- toupper(data_2017_D$Home)
data_2017_D$Away <- toupper(data_2017_D$Away)
data_2017_D <- data.table(data_2017_D)

data_2017_D[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2017_D[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2017_D$Results <- NULL
data_2017_D$Group <- "D" 
data_2017_D$Year <- 2017 

data_2017_D <- data_2017_D  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2017_D,"/Users/home/Downloads/data_2017_D.csv")

# Champions 2017 Group E


data_2017E <- read_excel("/Users/home/Desktop/UEFA_2017.xlsx", sheet = 5)


data_2017_E <- data_2017E %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2017_E <- na.omit(data_2017_E)
results <- data.frame(str_split_fixed(data_2017_E$count, "–", 2))

data_2017_E <- data.frame(data_2017_E,results)
names(data_2017_E) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2017_E$Home <- toupper(data_2017_E$Home)
data_2017_E$Away <- toupper(data_2017_E$Away)
data_2017_E <- data.table(data_2017_E)

data_2017_E[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2017_E[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2017_E$Results <- NULL
data_2017_E$Group <- "E" 
data_2017_E$Year <- 2017 

data_2017_E <- data_2017_E  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2017_E,"/Users/home/Downloads/data_2017_E.csv")

# Champions 2017 Group F


data_2017F <- read_excel("/Users/home/Desktop/UEFA_2017.xlsx", sheet = 6)


data_2017_F <- data_2017F %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2017_F <- na.omit(data_2017_F)
results <- data.frame(str_split_fixed(data_2017_F$count, "–", 2))

data_2017_F <- data.frame(data_2017_F,results)
names(data_2017_F) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2017_F$Home <- toupper(data_2017_F$Home)
data_2017_F$Away <- toupper(data_2017_F$Away)
data_2017_F <- data.table(data_2017_F)

data_2017_F[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2017_F[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2017_F$Results <- NULL
data_2017_F$Group <- "F" 
data_2017_F$Year <- 2017 

data_2017_F <- data_2017_F  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2017_F,"/Users/home/Downloads/data_2017_F.csv")

# Champions 2017 Group G


data_2017G <- read_excel("/Users/home/Desktop/UEFA_2017.xlsx", sheet = 7)


data_2017_G <- data_2017G %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2017_G <- na.omit(data_2017_G)
results <- data.frame(str_split_fixed(data_2017_G$count, "–", 2))

data_2017_G <- data.frame(data_2017_G,results)
names(data_2017_G) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2017_G$Home <- toupper(data_2017_G$Home)
data_2017_G$Away <- toupper(data_2017_G$Away)
data_2017_G <- data.table(data_2017_G)

data_2017_G[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2017_G[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2017_G$Results <- NULL
data_2017_G$Group <- "G" 
data_2017_G$Year <- 2017 

data_2017_G <- data_2017_G  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2017_G,"/Users/home/Downloads/data_2017_G.csv")

# Champions 2017 Group H


data_2017H <- read_excel("/Users/home/Desktop/UEFA_2017.xlsx", sheet = 8)


data_2017_H <- data_2017H %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2017_H <- na.omit(data_2017_H)
results <- data.frame(str_split_fixed(data_2017_H$count, "–", 2))

data_2017_H <- data.frame(data_2017_H,results)
names(data_2017_H) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2017_H$Home <- toupper(data_2017_H$Home)
data_2017_H$Away <- toupper(data_2017_H$Away)
data_2017_H <- data.table(data_2017_H)

data_2017_H[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2017_H[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2017_H$Results <- NULL
data_2017_H$Group <- "H" 
data_2017_H$Year <- 2017 

data_2017_H <- data_2017_H  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2017_H,"/Users/home/Downloads/data_2017_H.csv")

data_2017AH <- bind_rows(data_2017_A,data_2017_B,data_2017_C,
                         data_2017_D,data_2017_E,data_2017_F,
                         data_2017_G,data_2017_H) 

fwrite(data_2017AH,"/Users/home/Downloads/data_2017_AH.csv")