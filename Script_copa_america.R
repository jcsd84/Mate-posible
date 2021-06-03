# Analisis Copa America


library(readxl)
library(dplyr)
library(ggplot2)
library(ggrepel)

data_copa_america <- read_excel("/Users/home/Documents/MP blog 2021/Data/Copa America/Valor_nomina_ca_2021.xlsx")
head(data_copa_america)


cor.test(data_copa_america$Ranking, data_copa_america$Valor_nomina)

summary(data_copa_america$Valor_nomina)
sd(data_copa_america$Valor_nomina)


figure1_ca <- ggplot(data_copa_america, aes(x=Ranking, y=Valor_nomina, label=Equipo))+
  geom_point(color="red")+
  geom_smooth(method = "loess", se = F, formula= y~x)+
  geom_text_repel(
    nudge_y      = 0.05,
    direction    = "x",
    angle        = 45,
    vjust        = 0,
    segment.size = 0.2,
    size = 2)+
  theme(panel.background = element_blank())+
  scale_x_continuous(limits = c(1, 90), breaks = seq(1,90, by = 5))+
  scale_y_continuous(limits = c(1,1100), breaks = seq(1,1100, by = 100))+
  labs(x = "Ranking", y = "Valor nomina en millones")

ggsave("Ranking_value_ca.png", plot =figure1_ca,
       width = 10, height = 10, 
       limitsize = F)