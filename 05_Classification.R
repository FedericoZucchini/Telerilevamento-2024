# Quantificazione della copertura del suolo (land cover variability)

# Installazione pacchetto ggplot2
install.packages("ggplot2")
library(ggplot2)
library(terra)
library(imageRy)

# Listing images
im.list()

# Importing data
m1992<-im.import("matogrosso_l5_1992219_lrg.jpg")
# Procediamo con la classificazione dell'immagine
MA PRIMA... giochiamo un po'
sun<-.im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
# im.classify()
sunc<-im.classify(sun, num_clusters=3)

# Richiamo le 2 immagini su cui voglio elaborare
m1992<-im.import("matogrosso_l5_1992219_lrg.jpg")
m2006<-im.import("matogrosso_ast_2006209_lrg.jpg") 
# Classificazione immagini
m1992c <- im.classify(m1992,num_clusters=2)
m2006c <- im.classify(m2006, num_clusters=2)
# Classe 1 = Human, suolo nudo
# Classe 2 = Foresta

# Vogliamo calcolare la frequenza di una certa classe, ad es. la foresa, e lo facciamo poi per la seconda classe.
# Calcolo delle frequenze
Una frequenza è ad es. quanti studenti maschi ci sono in quest'aula?, X e Y. Si misura facendo i calcoli dei numeri di maschi e femmine, poi proporzioni e percentuali. Idem per questo lavoro.
freq(m1992c)
f1992<-freq(m1992c)
tot1992<-ncell(m1992c)
prop1992= f1992/tot1992
perc1992= prop1992 *100
# Percentuali: forest = 83%, Human = 17%

# Facciamo i calcoli per il 2006, prima li abbiamo fatti per il 1992

freq(m2006c)
f2006<-freq(m2006c)
tot2006<-ncell(m2006c)
prop2006= f2006/tot2006
perc2006= prop2006 *100
# Percentuali: forest = 45%, Human = 55%

# Introduciamo funzione data.frame, fondamentalmente creiamo una tabella
data.frame

# Costruiamo un dataframe
class <- c("forest", "human")
y1992 <- c(83,17)
y2006 <- c(45,55)
tabout <- data.frame(class, y1992, y2006)
tabout # Per vederla in tabella effettiva posso usare anche View(tabout)

# Usiamo ggplot2 graphs

ggplot (tabout, aes(x=class, y=y1992, colour=class)) + geom_bar(stat="identify", fill="white")
ggplot (tabout, aes(x=class, y=y2006, colour=class)) + geom_bar(stat="identify", fill="white")

install.packages("patchwork")
library(patchwork)

p1 <- ggplot (tabout, aes(x=class, y=y1992, colour=class)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot (tabout, aes(x=class, y=y2006, colour=class)) + geom_bar(stat="identity", fill="white")

p1+p2

# Non va bene avre un grafico con una scala e uno con l'altra, devono avere LA STESSA scala.

p1 <- ggplot (tabout, aes(x=class, y=y1992, colour=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot (tabout, aes(x=class, y=y2006, colour=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))

p1+p2

# Così si vedono chiaramente le differenze sulla scala generale.


