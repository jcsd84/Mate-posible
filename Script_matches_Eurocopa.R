# Analisis previa eurocopa

library(readxl)
library(dplyr)
library(ggplot2)
library(ggrepel)

data_eurocopa <- read_xlsx("/Users/home/Documents/MP blog 2021/Data/Eurocopa/Valor_nomina_euro_2021.xlsx")
head(data_eurocopa)

summary(data_eurocopa$Valor_nomina)
sd(data_eurocopa$Valor_nomina)

cor.test(data_eurocopa$Ranking, data_eurocopa$Valor_nomina)


figure1_euro <- ggplot(data_eurocopa, aes(x=Ranking, y=Valor_nomina, label=Equipo))+
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
  scale_x_continuous(limits = c(1, 70), breaks = seq(1,70, by = 5))+
  scale_y_continuous(limits = c(1,1100), breaks = seq(1,1100, by = 100))+
  labs(x = "Ranking", y = "Valor nomina en millones")

ggsave("WC_qualifiers_2018_pas_goals.png", plot =figure1,
       width = 10, height = 10, 
       limitsize = F)