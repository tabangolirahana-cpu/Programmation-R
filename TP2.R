#Exercice1

df = read.csv("D:/BUT 1/Programmation R/TP/TP2/fao.csv",header = TRUE,dec = ",",sep = ";")

nrow(df)

summary(df)

#Exercice 2 

mean(df$Dispo_alim,na.rm = TRUE)

sum(df$Population,na.rm = TRUE)

sd(df$Export_viande,na.rm = TRUE) 
sd(df$Import_viande,na.rm = TRUE)

median(df$Prod_viande,na.rm = TRUE)

quantile(df$Dispo_alim)

quantile(df$Import_viande,seq(from = 0.1,to = 0.9,by = 0.1))

#Exercice3

pays_mp = order(df$Population)#order classe du plus petit au plus grand
resultat = head(df[ pays_mp, ], n = 5)
View(resultat)

pays_pp = order(df$Population, decreasing = TRUE)
resultat = head(df[ pays_pp , ], n = 5)
View(resultat)

pays_pv = order(df$Prod_viande, decreasing = TRUE)
resultat = head(df[ pays_pv , ], n = 5)
View(resultat) 

pays_iv = order(df$Import_viande, decreasing = TRUE)
resultat = head(df[ pays_iv , ], n = 5)
View(resultat) 

#subset sert à filtrer ses données
dispo_aliment = subset(df, Dispo_alim>=2300)
View(resultat)

Dispo_import = subset(df, Dispo_alim > 3500  & Import_viande >= 1000)
View(Dispo_import)

bf = subset(df, Nom %in% c("France","Belgique"))
View(bf)

#Exercice4

df$Part_export= df$Export_viande/df$Prod_viande

df$Dispo_alim_pays = df$Dispo_alim*df$Population

write.table(df,file = "ExportTp2.csv")

Dispo_alim_monde = sum(df$Dispo_alim_pays,na.rm = TRUE)
print(Dispo_alim_monde)

kcal = Dispo_alim_monde/2300
print(kcal)

#Exercice5

#use = complete.obs sert à na.rm donc prendre les lignes et colonnes complètes
plot(x = df$Prod_viande,y = df$Export_viande,
     xlab = "Export_viande",ylab = "Prod_viande", main = "Lien entre entre Prod_viande et Export_viande")

cor(x = df$Prod_viande,y = df$Export_viande,use = "complete.obs")

matrice = cor(df[ , - 1] , use = "complete.obs")
matrice = round(matrice , 2)
View(matrice)

install.packages("corrplot")

library(corrplot)
corrplot(matrice,method = "square")
