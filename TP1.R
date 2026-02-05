iris 
class(iris)

View(iris)

nbr_ligne = nrow(iris)

nbr_col = ncol(iris)

nom_colonne = colnames(iris)

res = summary(iris)

iris[c("Sepal.Length","Species")] #à droite afficher la ligne et à gauche afficher la colonne

iris[c(100,103,105),] #C est une fonction qui crée un vecteur

iris[c(50:100),]

mean(iris$Sepal.Length)

median(iris$Sepal.Width)

sd(iris$Petal.Length)

quantile(iris$Petal.Width, 
         probs = seq(from = 0.1, to = 0.9, by =0.1))

#Exercice 2

dfManga <- read.csv(file ="D:/BUT 1/Programmation R/TP/TP1/manga.csv", header = TRUE, sep = ",", dec = ".")
dfAnime <- read.csv(file = "D:/BUT 1/Programmation R/TP/TP1/anime.csv", header = TRUE, sep = ",", dec = ".")
class(dfManga)
class(dfAnime)

View(dfManga)
View(dfAnimme)

dim(dfAnime)
dim(dfManga)

mean(dfManga$Score)
mean(dfAnime$Score)
print("La moyenne la plus élevée est celle de dfAnime")

sum(dfManga$Vote)
sum(dfAnime$Vote)
print("Il y'a le plus de vote dans dfAnime")

sd(dfManga$Score)
sd(dfAnime$Score)
#dfAnime est le plus homogène

quantile(dfManga$Score, probs = seq(from = 0.1, to = 0.9, by = 0.1))
quantile(dfAnime$Score, probs = seq(from = 0.1, to = 0.9, by = 0.1))

#Filtrer sur les mangas
note_manga = subset(dfManga, Score > 9)
nrow(note_manga)

vote_manga = subset(dfManga, Vote >= 200000 )
nrow(vote_manga)

note_vote_manga = subset(dfManga, Vote >= 20000 & Score >= 8)
nrow(note_vote_manga)

note_comprise = subset(dfManga, Score > 7 & Score > 8)
nrow(note_comprise)

#Filtrer sur les animes
Effectifrating = table(dfAnime$Rating)
print(Effectifrating)
length(Effectifrating)#Affiche la taille de la variable
prop.table(Effectifrating)#Calcule les pourcentages des effectifs

anime1 = subset(dfAnime,Rating == "R - 17+ (violence & profanity)")
nrow(anime1)#nrow affiche le nombres de ligne et de colonne

anime2 = subset(dfAnime,Rating == "R - 17+ (violence & profanity)" & Score > 8)
nrow(anime2)

anime3 = subset(dfAnime,Rating != "R - 17+ (violence & profanity)")
nrow(anime3)

anime4 = subset(dfAnime,Rating %in% c("PG - Children" ,"G - All Ages" ))
nrow(anime4)

anime5 = subset(dfAnime,!Rating %in% c("PG - Children" ,"G - All Ages" ))
nrow(anime5)

anime6 = subset(dfAnime,Score > 9| Vote >400000)
nrow(anime6)

dfAnime = dfAnime[,c("Title","Score","Vote","Ranked")]#Accède au colonne du dataframe
dfManga = dfManga[,c("Title","Score","Vote","Ranked")]

dfAnime$Type = "Anime" #Crée une nouvelle colonne avec pour valeur Anime oui Manga
dfManga$Type = "Manga"

dfConcat = rbind(dfAnime,dfManga) #rbind sert à concaténer des colonnes
View (dfConcat)

write.table(dfConcat,file = "D:/BUT 1/Programmation R/TP/TP1/ExportTp1.csv", sep = ",", row.names = FALSE)