library(readxl)
library(tidyr)
library(dplyr)
library(data.table)
library(stringr)
library(stringi)

# 2010 Stage 1

data_2010 <- read_excel("/Users/home/Desktop/T_2010.xlsx", sheet = 1)


data_2010_st1 <- data_2010 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2010_st1 <- na.omit(data_2010_st1)
results <- data.frame(str_split_fixed(data_2010_st1$count, "–", 2))

data_2010_st1 <- data.frame(data_2010_st1,results)
names(data_2010_st1) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2010_st1$Home <- toupper(data_2010_st1$Home)
data_2010_st1$Away <- toupper(data_2010_st1$Away)
data_2010_st1 <- data.table(data_2010_st1)

data_2010_st1[, Home := stri_trans_general(str = Home, 
                                   id = "Latin-ASCII")]
data_2010_st1[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2010_st1$Results <- NULL

data_2010_st1$Stage <- 1 

data_2010_st1$Year <- 2010 

fwrite(data_2010_st1,"/Users/home/Downloads/data_2010_st1.csv")

##################

# 2010 Lig A


data_liga_2010 <- read_excel("/Users/home/Desktop/T_2010.xlsx", sheet = 2)


data_2010_liga <- data_liga_2010 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2010_liga <- na.omit(data_2010_liga)
results <- data.frame(str_split_fixed(data_2010_liga$count, "–", 2))

data_2010_liga <- data.frame(data_2010_liga,results)
names(data_2010_liga) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2010_liga$Home <- toupper(data_2010_liga$Home)
data_2010_liga$Away <- toupper(data_2010_liga$Away)
data_2010_liga <- data.table(data_2010_liga)

data_2010_liga[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2010_liga[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2010_liga$Results <- NULL

data_2010_liga$Stage <- 2 

data_2010_liga$Liguilla <- "A"

data_2010_liga$Year <- 2010 

fwrite(data_2010_liga,"/Users/home/Downloads/data_2010_liga.csv")

# 2010 Lig B


data_ligb_2010 <- read_excel("/Users/home/Desktop/T_2010.xlsx", sheet = 3)


data_2010_ligb <- data_ligb_2010 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2010_ligb <- na.omit(data_2010_ligb)
results <- data.frame(str_split_fixed(data_2010_ligb$count, "–", 2))

data_2010_ligb <- data.frame(data_2010_ligb,results)
names(data_2010_ligb) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2010_ligb$Home <- toupper(data_2010_ligb$Home)
data_2010_ligb$Away <- toupper(data_2010_ligb$Away)
data_2010_ligb <- data.table(data_2010_ligb)

data_2010_ligb[, Home := stri_trans_general(str = Home, 
                                            id = "Latin-ASCII")]
data_2010_ligb[, Away := stri_trans_general(str = Away, 
                                            id = "Latin-ASCII")]
data_2010_ligb$Results <- NULL

data_2010_ligb$Stage <- 2 

data_2010_ligb$Liguilla <- "B"

data_2010_ligb$Year <- 2010 

fwrite(data_2010_ligb,"/Users/home/Downloads/data_2010_ligb.csv")

#######

# 2011 stage 1


data_T2011 <- read_excel("/Users/home/Desktop/T_2011.xlsx", sheet = 1)


data_2011_st1 <- data_T2011 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2011_st1 <- na.omit(data_2011_st1)
results <- data.frame(str_split_fixed(data_2011_st1$count, "–", 2))

data_2011_st1 <- data.frame(data_2011_st1,results)
names(data_2011_st1) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2011_st1$Home <- toupper(data_2011_st1$Home)
data_2011_st1$Away <- toupper(data_2011_st1$Away)
data_2011_st1 <- data.table(data_2011_st1)

data_2011_st1[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2011_st1[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2011_st1$Results <- NULL

data_2011_st1$Stage <- 1 

data_2011_st1$Year <- 2011 

fwrite(data_2011_st1,"/Users/home/Downloads/data_2011_st1.csv")

####

# 2012 stg 1


data_T2012 <- read_excel("/Users/home/Desktop/T_2012.xlsx", sheet = 1)


data_2012_st1 <- data_T2012 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2012_st1 <- na.omit(data_2012_st1)
results <- data.frame(str_split_fixed(data_2012_st1$count, "–", 2))

data_2012_st1 <- data.frame(data_2012_st1,results)
names(data_2012_st1) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2012_st1$Home <- toupper(data_2012_st1$Home)
data_2012_st1$Away <- toupper(data_2012_st1$Away)
data_2012_st1 <- data.table(data_2012_st1)

data_2012_st1[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2012_st1[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2012_st1$Results <- NULL

data_2012_st1$Stage <- 1 

data_2012_st1$Year <- 2012 

fwrite(data_2012_st1,"/Users/home/Downloads/data_2012_st1.csv")

# 2012 Lig A


data_liga2012 <- read_excel("/Users/home/Desktop/T_2012.xlsx", sheet = 2)


data_2012_liga <- data_liga2012 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2012_liga <- na.omit(data_2012_liga)
results <- data.frame(str_split_fixed(data_2012_liga$count, "–", 2))

data_2012_liga <- data.frame(data_2012_liga,results)
names(data_2012_liga) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2012_liga$Home <- toupper(data_2012_liga$Home)
data_2012_liga$Away <- toupper(data_2012_liga$Away)
data_2012_liga <- data.table(data_2012_liga)

data_2012_liga[, Home := stri_trans_general(str = Home, 
                                            id = "Latin-ASCII")]
data_2012_liga[, Away := stri_trans_general(str = Away, 
                                            id = "Latin-ASCII")]
data_2012_liga$Results <- NULL

data_2012_liga$Stage <- 2 

data_2012_liga$Liguilla <- "A"

data_2012_liga$Year <- 2012 

fwrite(data_2012_liga,"/Users/home/Downloads/data_2012_liga.csv")

# 2012 Lig B



data_ligb_2012 <- read_excel("/Users/home/Desktop/T_2012.xlsx", sheet = 3)


data_2012_ligb <- data_ligb_2012 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2012_ligb <- na.omit(data_2012_ligb)
results <- data.frame(str_split_fixed(data_2012_ligb$count, "–", 2))

data_2012_ligb <- data.frame(data_2012_ligb,results)
names(data_2012_ligb) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2012_ligb$Home <- toupper(data_2012_ligb$Home)
data_2012_ligb$Away <- toupper(data_2012_ligb$Away)
data_2012_ligb <- data.table(data_2012_ligb)

data_2012_ligb[, Home := stri_trans_general(str = Home, 
                                            id = "Latin-ASCII")]
data_2012_ligb[, Away := stri_trans_general(str = Away, 
                                            id = "Latin-ASCII")]
data_2012_ligb$Results <- NULL

data_2012_ligb$Stage <- 2 

data_2012_ligb$Liguilla <- "B"

data_2012_ligb$Year <- 2012 

fwrite(data_2012_ligb,"/Users/home/Downloads/data_2012_ligb.csv")

# 2013 Stage 1


data_2013 <- read_excel("/Users/home/Desktop/T_2013.xlsx", sheet = 1)


data_2013_st1 <- data_2013 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2013_st1 <- na.omit(data_2013_st1)
results <- data.frame(str_split_fixed(data_2013_st1$count, "–", 2))

data_2013_st1 <- data.frame(data_2013_st1,results)
names(data_2013_st1) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2013_st1$Home <- toupper(data_2013_st1$Home)
data_2013_st1$Away <- toupper(data_2013_st1$Away)
data_2013_st1 <- data.table(data_2013_st1)

data_2013_st1[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2013_st1[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2013_st1$Results <- NULL

data_2013_st1$Stage <- 1 

data_2013_st1$Year <- 2013 

fwrite(data_2013_st1,"/Users/home/Downloads/data_2013_st1.csv")

# 2013 Lig A


data_liga2013 <- read_excel("/Users/home/Desktop/T_2013.xlsx", sheet = 2)


data_2013_liga <- data_liga2013 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2013_liga <- na.omit(data_2013_liga)
results <- data.frame(str_split_fixed(data_2013_liga$count, "–", 2))

data_2013_liga <- data.frame(data_2013_liga,results)
names(data_2013_liga) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2013_liga$Home <- toupper(data_2013_liga$Home)
data_2013_liga$Away <- toupper(data_2013_liga$Away)
data_2013_liga <- data.table(data_2013_liga)

data_2013_liga[, Home := stri_trans_general(str = Home, 
                                            id = "Latin-ASCII")]
data_2013_liga[, Away := stri_trans_general(str = Away, 
                                            id = "Latin-ASCII")]
data_2013_liga$Results <- NULL

data_2013_liga$Stage <- 2 

data_2013_liga$Liguilla <- "A"

data_2013_liga$Year <- 2013 

fwrite(data_2013_liga,"/Users/home/Downloads/data_2013_liga.csv")

# 2013 Lig B




data_ligb_2013 <- read_excel("/Users/home/Desktop/T_2013.xlsx", sheet = 3)


data_2013_ligb <- data_ligb_2013 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2013_ligb <- na.omit(data_2013_ligb)
results <- data.frame(str_split_fixed(data_2013_ligb$count, "–", 2))

data_2013_ligb <- data.frame(data_2013_ligb,results)
names(data_2013_ligb) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2013_ligb$Home <- toupper(data_2013_ligb$Home)
data_2013_ligb$Away <- toupper(data_2013_ligb$Away)
data_2013_ligb <- data.table(data_2013_ligb)

data_2013_ligb[, Home := stri_trans_general(str = Home, 
                                            id = "Latin-ASCII")]
data_2013_ligb[, Away := stri_trans_general(str = Away, 
                                            id = "Latin-ASCII")]
data_2013_ligb$Results <- NULL

data_2013_ligb$Stage <- 2 

data_2013_ligb$Liguilla <- "B"

data_2013_ligb$Year <- 2013 

fwrite(data_2013_ligb,"/Users/home/Downloads/data_2013_ligb.csv")

# 2014 Stage 1 Apertura


data_2014 <- read_excel("/Users/home/Desktop/T_2014.xlsx", sheet = 1)


data_2014_st1 <- data_2014 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2014_st1 <- na.omit(data_2014_st1)
results <- data.frame(str_split_fixed(data_2014_st1$count, "–", 2))

data_2014_st1 <- data.frame(data_2014_st1,results)
names(data_2014_st1) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2014_st1$Home <- toupper(data_2014_st1$Home)
data_2014_st1$Away <- toupper(data_2014_st1$Away)
data_2014_st1 <- data.table(data_2014_st1)

data_2014_st1[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2014_st1[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2014_st1$Results <- NULL

data_2014_st1$Stage <- 1

data_2014_st1$Torneo <- "Apertura"

data_2014_st1$Year <- 2014 

fwrite(data_2014_st1,"/Users/home/Downloads/data_2014_st1.csv")

# 2014 Stage 1 Clausura



data_20142 <- read_excel("/Users/home/Desktop/T_2014.xlsx", sheet = 2)


data_2014_st2 <- data_20142 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2014_st2 <- na.omit(data_2014_st2)
results <- data.frame(str_split_fixed(data_2014_st2$count, "–", 2))

data_2014_st2 <- data.frame(data_2014_st2,results)
names(data_2014_st2) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2014_st2$Home <- toupper(data_2014_st2$Home)
data_2014_st2$Away <- toupper(data_2014_st2$Away)
data_2014_st2 <- data.table(data_2014_st2)

data_2014_st2[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2014_st2[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2014_st2$Results <- NULL

data_2014_st2$Stage <- 1

data_2014_st2$Torneo <- "Clausura"

data_2014_st2$Year <- 2014 

fwrite(data_2014_st2,"/Users/home/Downloads/data_2014_st2.csv")

# 2015 Apertura


data_2015 <- read_excel("/Users/home/Desktop/T_2015.xlsx", sheet = 1)


data_2015_st1 <- data_2015 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2015_st1 <- na.omit(data_2015_st1)
results <- data.frame(str_split_fixed(data_2015_st1$count, "–", 2))

data_2015_st1 <- data.frame(data_2015_st1,results)
names(data_2015_st1) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2015_st1$Home <- toupper(data_2015_st1$Home)
data_2015_st1$Away <- toupper(data_2015_st1$Away)
data_2015_st1 <- data.table(data_2015_st1)

data_2015_st1[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2015_st1[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2015_st1$Results <- NULL

data_2015_st1$Stage <- 1

data_2015_st1$Torneo <- "Apertura"

data_2015_st1$Year <- 2015 

fwrite(data_2015_st1,"/Users/home/Downloads/data_2015_st1.csv")

# 2015 Clausura



data_20152 <- read_excel("/Users/home/Desktop/T_2015.xlsx", sheet = 2)


data_2015_st2 <- data_20152 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2015_st2 <- na.omit(data_2015_st2)
results <- data.frame(str_split_fixed(data_2015_st2$count, "–", 2))

data_2015_st2 <- data.frame(data_2015_st2,results)
names(data_2015_st2) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2015_st2$Home <- toupper(data_2015_st2$Home)
data_2015_st2$Away <- toupper(data_2015_st2$Away)
data_2015_st2 <- data.table(data_2015_st2)

data_2015_st2[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2015_st2[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2015_st2$Results <- NULL

data_2015_st2$Stage <- 1

data_2015_st2$Torneo <- "Clausura"

data_2015_st2$Year <- 2015 

fwrite(data_2015_st2,"/Users/home/Downloads/data_2015_st2.csv")

# 2016 Apertura



data_2016 <- read_excel("/Users/home/Desktop/T_2016.xlsx", sheet = 1)


data_2016_st1 <- data_2016 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2016_st1 <- na.omit(data_2016_st1)
results <- data.frame(str_split_fixed(data_2016_st1$count, "–", 2))

data_2016_st1 <- data.frame(data_2016_st1,results)
names(data_2016_st1) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2016_st1$Home <- toupper(data_2016_st1$Home)
data_2016_st1$Away <- toupper(data_2016_st1$Away)
data_2016_st1 <- data.table(data_2016_st1)

data_2016_st1[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2016_st1[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2016_st1$Results <- NULL

data_2016_st1$Stage <- 1

data_2016_st1$Torneo <- "Apertura"

data_2016_st1$Year <- 2016 

fwrite(data_2016_st1,"/Users/home/Downloads/data_2016_st1.csv")

# 2016 Clausura



data_20162 <- read_excel("/Users/home/Desktop/T_2016.xlsx", sheet = 2)


data_2016_st2 <- data_20162 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2016_st2 <- na.omit(data_2016_st2)
results <- data.frame(str_split_fixed(data_2016_st2$count, "–", 2))

data_2016_st2 <- data.frame(data_2016_st2,results)
names(data_2016_st2) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2016_st2$Home <- toupper(data_2016_st2$Home)
data_2016_st2$Away <- toupper(data_2016_st2$Away)
data_2016_st2 <- data.table(data_2016_st2)

data_2016_st2[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2016_st2[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2016_st2$Results <- NULL

data_2016_st2$Stage <- 1

data_2016_st2$Torneo <- "Clausura"

data_2016_st2$Year <- 2016 

fwrite(data_2016_st2,"/Users/home/Downloads/data_2016_st2.csv")

# 2017 Apertura


data_2017 <- read_excel("/Users/home/Desktop/T_2017.xlsx", sheet = 1)


data_2017_st1 <- data_2017 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2017_st1 <- na.omit(data_2017_st1)
results <- data.frame(str_split_fixed(data_2017_st1$count, "–", 2))

data_2017_st1 <- data.frame(data_2017_st1,results)
names(data_2017_st1) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2017_st1$Home <- toupper(data_2017_st1$Home)
data_2017_st1$Away <- toupper(data_2017_st1$Away)
data_2017_st1 <- data.table(data_2017_st1)

data_2017_st1[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2017_st1[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2017_st1$Results <- NULL

data_2017_st1$Stage <- 1

data_2017_st1$Torneo <- "Apertura"

data_2017_st1$Year <- 2017 

fwrite(data_2017_st1,"/Users/home/Downloads/data_2017_st1.csv")

# 2017 Clausura



data_20172 <- read_excel("/Users/home/Desktop/T_2017.xlsx", sheet = 2)


data_2017_st2 <- data_20172 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2017_st2 <- na.omit(data_2017_st2)
results <- data.frame(str_split_fixed(data_2017_st2$count, "–", 2))

data_2017_st2 <- data.frame(data_2017_st2,results)
names(data_2017_st2) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2017_st2$Home <- toupper(data_2017_st2$Home)
data_2017_st2$Away <- toupper(data_2017_st2$Away)
data_2017_st2 <- data.table(data_2017_st2)

data_2017_st2[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2017_st2[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2017_st2$Results <- NULL

data_2017_st2$Stage <- 1

data_2017_st2$Torneo <- "Clausura"

data_2017_st2$Year <- 2017 

fwrite(data_2017_st2,"/Users/home/Downloads/data_2017_st2.csv")

# 2017 Lig A


data_liga2017 <- read_excel("/Users/home/Desktop/T_2017.xlsx", sheet = 3)


data_2017_liga <- data_liga2017 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2017_liga <- na.omit(data_2017_liga)
results <- data.frame(str_split_fixed(data_2017_liga$count, "–", 2))

data_2017_liga <- data.frame(data_2017_liga,results)
names(data_2017_liga) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2017_liga$Home <- toupper(data_2017_liga$Home)
data_2017_liga$Away <- toupper(data_2017_liga$Away)
data_2017_liga <- data.table(data_2017_liga)

data_2017_liga[, Home := stri_trans_general(str = Home, 
                                            id = "Latin-ASCII")]
data_2017_liga[, Away := stri_trans_general(str = Away, 
                                            id = "Latin-ASCII")]
data_2017_liga$Results <- NULL

data_2017_liga$Stage <- 2 

data_2017_liga$Liguilla <- "A"

data_2017_liga$Year <- 2017 

fwrite(data_2017_liga,"/Users/home/Downloads/data_2017_liga.csv")

# 2017 Lig B


data_ligb_2017 <- read_excel("/Users/home/Desktop/T_2017.xlsx", sheet = 4)


data_2017_ligb <- data_ligb_2017 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2017_ligb <- na.omit(data_2017_ligb)
results <- data.frame(str_split_fixed(data_2017_ligb$count, "–", 2))

data_2017_ligb <- data.frame(data_2017_ligb,results)
names(data_2017_ligb) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2017_ligb$Home <- toupper(data_2017_ligb$Home)
data_2017_ligb$Away <- toupper(data_2017_ligb$Away)
data_2017_ligb <- data.table(data_2017_ligb)

data_2017_ligb[, Home := stri_trans_general(str = Home, 
                                            id = "Latin-ASCII")]
data_2017_ligb[, Away := stri_trans_general(str = Away, 
                                            id = "Latin-ASCII")]
data_2017_ligb$Results <- NULL

data_2017_ligb$Stage <- 2 

data_2017_ligb$Liguilla <- "B"

data_2017_ligb$Year <- 2017 

fwrite(data_2017_ligb,"/Users/home/Downloads/data_2017_ligb.csv")

# 2018 Apertura



data_2018 <- read_excel("/Users/home/Desktop/T_2018.xlsx", sheet = 1)


data_2018_st1 <- data_2018 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2018_st1 <- na.omit(data_2018_st1)
results <- data.frame(str_split_fixed(data_2018_st1$count, "–", 2))

data_2018_st1 <- data.frame(data_2018_st1,results)
names(data_2018_st1) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2018_st1$Home <- toupper(data_2018_st1$Home)
data_2018_st1$Away <- toupper(data_2018_st1$Away)
data_2018_st1 <- data.table(data_2018_st1)

data_2018_st1[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2018_st1[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2018_st1$Results <- NULL

data_2018_st1$Stage <- 1

data_2018_st1$Torneo <- "Apertura"

data_2018_st1$Year <- 2018 

fwrite(data_2018_st1,"/Users/home/Downloads/data_2018_st1.csv")

# 2018 Clausura



data_20182 <- read_excel("/Users/home/Desktop/T_2018.xlsx", sheet = 2)


data_2018_st2 <- data_20182 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2018_st2 <- na.omit(data_2018_st2)
results <- data.frame(str_split_fixed(data_2018_st2$count, "–", 2))

data_2018_st2 <- data.frame(data_2018_st2,results)
names(data_2018_st2) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2018_st2$Home <- toupper(data_2018_st2$Home)
data_2018_st2$Away <- toupper(data_2018_st2$Away)
data_2018_st2 <- data.table(data_2018_st2)

data_2018_st2[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2018_st2[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2018_st2$Results <- NULL

data_2018_st2$Stage <- 1

data_2018_st2$Torneo <- "Clausura"

data_2018_st2$Year <- 2018 

fwrite(data_2018_st2,"/Users/home/Downloads/data_2018_st2.csv")

# 2018 Lig A


data_liga2018 <- read_excel("/Users/home/Desktop/T_2018.xlsx", sheet = 3)


data_2018_liga <- data_liga2018 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2018_liga <- na.omit(data_2018_liga)
results <- data.frame(str_split_fixed(data_2018_liga$count, "–", 2))

data_2018_liga <- data.frame(data_2018_liga,results)
names(data_2018_liga) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2018_liga$Home <- toupper(data_2018_liga$Home)
data_2018_liga$Away <- toupper(data_2018_liga$Away)
data_2018_liga <- data.table(data_2018_liga)

data_2018_liga[, Home := stri_trans_general(str = Home, 
                                            id = "Latin-ASCII")]
data_2018_liga[, Away := stri_trans_general(str = Away, 
                                            id = "Latin-ASCII")]
data_2018_liga$Results <- NULL

data_2018_liga$Stage <- 2 

data_2018_liga$Liguilla <- "A"

data_2018_liga$Year <- 2018 

fwrite(data_2018_liga,"/Users/home/Downloads/data_2018_liga.csv")

# 2018 Lig B


data_ligb_2018 <- read_excel("/Users/home/Desktop/T_2018.xlsx", sheet = 4)


data_2018_ligb <- data_ligb_2018 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2018_ligb <- na.omit(data_2018_ligb)
results <- data.frame(str_split_fixed(data_2018_ligb$count, "–", 2))

data_2018_ligb <- data.frame(data_2018_ligb,results)
names(data_2018_ligb) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2018_ligb$Home <- toupper(data_2018_ligb$Home)
data_2018_ligb$Away <- toupper(data_2018_ligb$Away)
data_2018_ligb <- data.table(data_2018_ligb)

data_2018_ligb[, Home := stri_trans_general(str = Home, 
                                            id = "Latin-ASCII")]
data_2018_ligb[, Away := stri_trans_general(str = Away, 
                                            id = "Latin-ASCII")]
data_2018_ligb$Results <- NULL

data_2018_ligb$Stage <- 2 

data_2018_ligb$Liguilla <- "B"

data_2018_ligb$Year <- 2018 

fwrite(data_2018_ligb,"/Users/home/Downloads/data_2018_ligb.csv")

# 2019 Apertura


data_2019 <- read_excel("/Users/home/Desktop/T_2019.xlsx", sheet = 1)


data_2019_st1 <- data_2019 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2019_st1 <- na.omit(data_2019_st1)
results <- data.frame(str_split_fixed(data_2019_st1$count, "–", 2))

data_2019_st1 <- data.frame(data_2019_st1,results)
names(data_2019_st1) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2019_st1$Home <- toupper(data_2019_st1$Home)
data_2019_st1$Away <- toupper(data_2019_st1$Away)
data_2019_st1 <- data.table(data_2019_st1)

data_2019_st1[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2019_st1[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2019_st1$Results <- NULL

data_2019_st1$Stage <- 1

data_2019_st1$Torneo <- "Apertura"

data_2019_st1$Year <- 2019 

fwrite(data_2019_st1,"/Users/home/Downloads/data_2019_st1.csv")

# 2019 Clausura



data_20192 <- read_excel("/Users/home/Desktop/T_2019.xlsx", sheet = 2)


data_2019_st2 <- data_20192 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2019_st2 <- na.omit(data_2019_st2)
results <- data.frame(str_split_fixed(data_2019_st2$count, "–", 2))

data_2019_st2 <- data.frame(data_2019_st2,results)
names(data_2019_st2) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2019_st2$Home <- toupper(data_2019_st2$Home)
data_2019_st2$Away <- toupper(data_2019_st2$Away)
data_2019_st2 <- data.table(data_2019_st2)

data_2019_st2[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2019_st2[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2019_st2$Results <- NULL

data_2019_st2$Stage <- 1

data_2019_st2$Torneo <- "Clausura"

data_2019_st2$Year <- 2019 

fwrite(data_2019_st2,"/Users/home/Downloads/data_2019_st2.csv")

# 2020


data_2020 <- read_excel("/Users/home/Desktop/T_2020.xlsx", sheet = 1)


data_2020_st1 <- data_2020 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2020_st1 <- na.omit(data_2020_st1)
results <- data.frame(str_split_fixed(data_2020_st1$count, "–", 2))

data_2020_st1 <- data.frame(data_2020_st1,results)
names(data_2020_st1) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2020_st1$Home <- toupper(data_2020_st1$Home)
data_2020_st1$Away <- toupper(data_2020_st1$Away)
data_2020_st1 <- data.table(data_2020_st1)

data_2020_st1[, Home := stri_trans_general(str = Home, 
                                           id = "Latin-ASCII")]
data_2020_st1[, Away := stri_trans_general(str = Away, 
                                           id = "Latin-ASCII")]
data_2020_st1$Results <- NULL

data_2020_st1$Stage <- 1

data_2020_st1$Torneo <- "Apertura"

data_2020_st1$Year <- 2020 

fwrite(data_2020_st1,"/Users/home/Downloads/data_2020_st1.csv")

# 2020 Lig A


data_liga2020 <- read_excel("/Users/home/Desktop/T_2018.xlsx", sheet = 2)


data_2020_liga <- data_liga2020 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2020_liga <- na.omit(data_2020_liga)
results <- data.frame(str_split_fixed(data_2020_liga$count, "–", 2))

data_2020_liga <- data.frame(data_2020_liga,results)
names(data_2020_liga) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2020_liga$Home <- toupper(data_2020_liga$Home)
data_2020_liga$Away <- toupper(data_2020_liga$Away)
data_2020_liga <- data.table(data_2020_liga)

data_2020_liga[, Home := stri_trans_general(str = Home, 
                                            id = "Latin-ASCII")]
data_2020_liga[, Away := stri_trans_general(str = Away, 
                                            id = "Latin-ASCII")]
data_2020_liga$Results <- NULL

data_2020_liga$Stage <- 2 

data_2020_liga$Liguilla <- "A"

data_2020_liga$Year <- 2020 

fwrite(data_2020_liga,"/Users/home/Downloads/data_2020_liga.csv")

# 2020 Lig B


data_ligb_2020 <- read_excel("/Users/home/Desktop/T_2018.xlsx", sheet = 3)


data_2020_ligb <- data_ligb_2020 %>%
  pivot_longer(!`Home \\ Away`, names_to = "Away", values_to = "count")


data_2020_ligb <- na.omit(data_2020_ligb)
results <- data.frame(str_split_fixed(data_2020_ligb$count, "–", 2))

data_2020_ligb <- data.frame(data_2020_ligb,results)
names(data_2020_ligb) <- c("Home", "Away", "Results", "Home_score", "Away_score")
data_2020_ligb$Home <- toupper(data_2020_ligb$Home)
data_2020_ligb$Away <- toupper(data_2020_ligb$Away)
data_2020_ligb <- data.table(data_2020_ligb)

data_2020_ligb[, Home := stri_trans_general(str = Home, 
                                            id = "Latin-ASCII")]
data_2020_ligb[, Away := stri_trans_general(str = Away, 
                                            id = "Latin-ASCII")]
data_2020_ligb$Results <- NULL

data_2020_ligb$Stage <- 2 

data_2020_ligb$Liguilla <- "B"

data_2020_ligb$Year <- 2020 

fwrite(data_2020_ligb,"/Users/home/Downloads/data_2020_ligb.csv")
