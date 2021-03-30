
library(readxl)
library(tidyr)
library(dplyr)
library(data.table)
library(stringr)
library(stringi)

# Champions 2018 Group A

data_2018A <- read_excel("/Users/home/Desktop/UEFA_2018.xlsx", sheet = 1)


data_2018_A <- data_2018A %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2018_A <- na.omit(data_2018_A)
results <- data.frame(str_split_fixed(data_2018_A$count, "–", 2))

data_2018_A <- data.frame(data_2018_A,results)
names(data_2018_A) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2018_A$Home <- toupper(data_2018_A$Home)
data_2018_A$Away <- toupper(data_2018_A$Away)
data_2018_A <- data.table(data_2018_A)

data_2018_A[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2018_A[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2018_A$Results <- NULL
data_2018_A$Group <- "A" 
data_2018_A$Year <- 2018 

data_2018_A <- data_2018_A  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2018_A,"/Users/home/Downloads/data_2018_A.csv")

# Champions 2018 Group B


data_2018B <- read_excel("/Users/home/Desktop/UEFA_2018.xlsx", sheet = 2)


data_2018_B <- data_2018B %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2018_B <- na.omit(data_2018_B)
results <- data.frame(str_split_fixed(data_2018_B$count, "–", 2))

data_2018_B <- data.frame(data_2018_B,results)
names(data_2018_B) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2018_B$Home <- toupper(data_2018_B$Home)
data_2018_B$Away <- toupper(data_2018_B$Away)
data_2018_B <- data.table(data_2018_B)

data_2018_B[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2018_B[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2018_B$Results <- NULL
data_2018_B$Group <- "B" 
data_2018_B$Year <- 2018 

data_2018_B <- data_2018_B  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2018_B,"/Users/home/Downloads/data_2018_B.csv")

# Champions 2018 Group C


data_2018C <- read_excel("/Users/home/Desktop/UEFA_2018.xlsx", sheet = 3)


data_2018_C <- data_2018C %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2018_C <- na.omit(data_2018_C)
results <- data.frame(str_split_fixed(data_2018_C$count, "–", 2))

data_2018_C <- data.frame(data_2018_C,results)
names(data_2018_C) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2018_C$Home <- toupper(data_2018_C$Home)
data_2018_C$Away <- toupper(data_2018_C$Away)
data_2018_C <- data.table(data_2018_C)

data_2018_C[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2018_C[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2018_C$Results <- NULL
data_2018_C$Group <- "C" 
data_2018_C$Year <- 2018 

data_2018_C <- data_2018_C  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2018_C,"/Users/home/Downloads/data_2018_C.csv")

# Champions 2018 Group D


data_2018D <- read_excel("/Users/home/Desktop/UEFA_2018.xlsx", sheet = 4)


data_2018_D <- data_2018D %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2018_D <- na.omit(data_2018_D)
results <- data.frame(str_split_fixed(data_2018_D$count, "–", 2))

data_2018_D <- data.frame(data_2018_D,results)
names(data_2018_D) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2018_D$Home <- toupper(data_2018_D$Home)
data_2018_D$Away <- toupper(data_2018_D$Away)
data_2018_D <- data.table(data_2018_D)

data_2018_D[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2018_D[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2018_D$Results <- NULL
data_2018_D$Group <- "D" 
data_2018_D$Year <- 2018 

data_2018_D <- data_2018_D  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2018_D,"/Users/home/Downloads/data_2018_D.csv")

# Champions 2018 Group E


data_2018E <- read_excel("/Users/home/Desktop/UEFA_2018.xlsx", sheet = 5)


data_2018_E <- data_2018E %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2018_E <- na.omit(data_2018_E)
results <- data.frame(str_split_fixed(data_2018_E$count, "–", 2))

data_2018_E <- data.frame(data_2018_E,results)
names(data_2018_E) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2018_E$Home <- toupper(data_2018_E$Home)
data_2018_E$Away <- toupper(data_2018_E$Away)
data_2018_E <- data.table(data_2018_E)

data_2018_E[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2018_E[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2018_E$Results <- NULL
data_2018_E$Group <- "E" 
data_2018_E$Year <- 2018 

data_2018_E <- data_2018_E  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2018_E,"/Users/home/Downloads/data_2018_E.csv")

# Champions 2018 Group F


data_2018F <- read_excel("/Users/home/Desktop/UEFA_2018.xlsx", sheet = 6)


data_2018_F <- data_2018F %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2018_F <- na.omit(data_2018_F)
results <- data.frame(str_split_fixed(data_2018_F$count, "–", 2))

data_2018_F <- data.frame(data_2018_F,results)
names(data_2018_F) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2018_F$Home <- toupper(data_2018_F$Home)
data_2018_F$Away <- toupper(data_2018_F$Away)
data_2018_F <- data.table(data_2018_F)

data_2018_F[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2018_F[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2018_F$Results <- NULL
data_2018_F$Group <- "F" 
data_2018_F$Year <- 2018 

data_2018_F <- data_2018_F  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2018_F,"/Users/home/Downloads/data_2018_F.csv")

# Champions 2018 Group G


data_2018G <- read_excel("/Users/home/Desktop/UEFA_2018.xlsx", sheet = 7)


data_2018_G <- data_2018G %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2018_G <- na.omit(data_2018_G)
results <- data.frame(str_split_fixed(data_2018_G$count, "–", 2))

data_2018_G <- data.frame(data_2018_G,results)
names(data_2018_G) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2018_G$Home <- toupper(data_2018_G$Home)
data_2018_G$Away <- toupper(data_2018_G$Away)
data_2018_G <- data.table(data_2018_G)

data_2018_G[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2018_G[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2018_G$Results <- NULL
data_2018_G$Group <- "G" 
data_2018_G$Year <- 2018 

data_2018_G <- data_2018_G  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2018_G,"/Users/home/Downloads/data_2018_G.csv")

# Champions 2018 Group H


data_2018H <- read_excel("/Users/home/Desktop/UEFA_2018.xlsx", sheet = 8)


data_2018_H <- data_2018H %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2018_H <- na.omit(data_2018_H)
results <- data.frame(str_split_fixed(data_2018_H$count, "–", 2))

data_2018_H <- data.frame(data_2018_H,results)
names(data_2018_H) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2018_H$Home <- toupper(data_2018_H$Home)
data_2018_H$Away <- toupper(data_2018_H$Away)
data_2018_H <- data.table(data_2018_H)

data_2018_H[, Home := stri_trans_general(str = Home, 
                                         id = "Latin-ASCII")]
data_2018_H[, Away := stri_trans_general(str = Away, 
                                         id = "Latin-ASCII")]

data_2018_H$Results <- NULL
data_2018_H$Group <- "H" 
data_2018_H$Year <- 2018 

data_2018_H <- data_2018_H  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


#fwrite(data_2018_H,"/Users/home/Downloads/data_2018_H.csv")

data_2018AH <- bind_rows(data_2018_A,data_2018_B,data_2018_C,
                         data_2018_D,data_2018_E,data_2018_F,
                         data_2018_G,data_2018_H) 

fwrite(data_2018AH,"/Users/home/Downloads/data_2018_AH.csv")
