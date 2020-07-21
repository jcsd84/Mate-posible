wd <- "/Users/home/Downloads/"
setwd(wd)
rm(list = ls())
list.files()



library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

data <- readLines(file.choose())

mydata <- Corpus(VectorSource(data))

# convert to lower case
mydata <- tm_map(mydata, content_transformer(tolower))

# #remove ������ what would be emojis
# mydata<-tm_map(mydata, content_transformer(gsub), pattern="\\W",replace=" ")
# # remove URLs
# removeURL <- function(x) gsub("http[^[:space:]]*", "", x)
# mydata <- tm_map(mydata, content_transformer(removeURL)
# )

# remove anything other than English letters or space
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
mydata <- tm_map(mydata, content_transformer(removeNumPunct))

changepunct <- function(x) chartr("áéíóú", "aeiou", x)
mydata <- tm_map(mydata, content_transformer(changepunct))

# remove stopwords
mydata <- tm_map(mydata, removeWords, stopwords("spanish"))


#u can create custom stop words using the code below.
mydata <- tm_map(mydata, removeWords, c("mas", "siempre",
                                        "puede", "asi",
                                        "tener"))

# remove extra whitespace
mydata <- tm_map(mydata, stripWhitespace)

# Stemming in spanish

# mydata <- tm_map(mydata, PlainTextDocument)  # needs to come before stemming
 # mydata <- tm_map(mydata, stemDocument,
 #                  "spanish")



# Build a term-document matrix

dtm <- TermDocumentMatrix(mydata)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

# Generate the wordcloud

wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          scale = c(2,.2),
          max.words=400, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

# Plot word frequencies

barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Palabras mas frecuentes",
        ylab = "Frecuencia de las palabras")

# Explore frequent terms and associations

findFreqTerms(dtm, lowfreq = 6)

# You can analyze the association between frequent terms 
# (i.e., terms which correlate) using findAssocs() function.
# The R code below identifies which words are associated with “data”


findAssocs(dtm, terms = "data", 
           corlimit = 0.5)

