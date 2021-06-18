# Champions league

library(readxl)
library(tidyr)
library(dplyr)
library(data.table)
library(stringr)
library(stringi)

data_2020 <- read_excel("/Users/home/Desktop/UEFA_2020.xlsx", sheet = 1)


data_2020_A <- data_2020 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2020_A <- na.omit(data_2020_A)
results <- data.frame(str_split_fixed(data_2020_A$count, "–", 2))

data_2020_A <- data.frame(data_2020_A,results)
names(data_2020_A) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2020_A$Home <- toupper(data_2020_A$Home)
data_2020_A$Away <- toupper(data_2020_A$Away)
data_2020_A <- data.table(data_2020_A)

data_2020_A$Results <- NULL
data_2020_A$Group <- "A" 
data_2020_A$Year <- 2020 

data_2020_A <- data_2020_A  %>%
  select(Year, Group, Home, Away, Home_score, Away_score)


fwrite(data_2020_Ae,"/Users/home/Downloads/data_2020_A.csv")