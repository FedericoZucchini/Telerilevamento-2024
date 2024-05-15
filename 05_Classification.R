# Quantificazione della copertura del suolo (land cover variability)

# Installazione pacchetto ggplot2

install.packages("ggplot2")

# Installazione pacchetto patchwork

intsall.packages("patchwork")

# Richiamiamo le diverse librerie a disposizione con cui lavorare

library(ggplot2)
library(terra)
library(imageRy)
library(patchwork)

# Listing images
im.list()

# Link a disposizione per le immagini da impiegare nei lavori
# https://www.esa.int/ESA_Multimedia/Images/2020/07/Solar_Orbiter_s_first_views_of_the_Sun6
# additional images: https://webbtelescope.org/contents/media/videos/1102-Video?Tag=Nebulas&page=1

MA PRIMA... giochiamo un po'

#importiamo un'immagine

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# Usiamo la funzione di classificazione im.classify()

sunc<-im.classify(sun, num_clusters=3)

# Importing data, in questo caso scegliamo di importare le immagini del Mato Grosso relative alla copertura vegetale

m1992<-im.import("matogrosso_l5_1992219_lrg.jpg")
m2006<-im.import("matogrosso_ast_2006209_lrg.jpg")

# Procediamo con la classificazione dell'immagine
# Classificazione immagini

m1992c <- im.classify(m1992,num_clusters=2)
# 1992
# class 1 = human
# class 2 = forest

m2006c <- im.classify(m2006, num_clusters=2)
# 2006
# class 1 = human
# class 2 = forest

# Classe 1 = Human, suolo nudo
# Classe 2 = Foresta

# Vogliamo calcolare la frequenza di una certa classe, ad es. la foresta, e lo facciamo poi per la seconda classe.
# Calcolo delle frequenze
# Una frequenza è ad es. quanti studenti maschi ci sono in quest'aula?, X e Y. Si misura facendo i calcoli dei numeri di maschi e femmine, poi proporzioni e percentuali. Idem per questo lavoro.

f1992 <- freq(m1992c) # Frequenza nel 1992
tot1992<-ncell(m1992c) # Totale della frequenza nel 1992
prop1992= f1992/tot1992 # proporzione di frequenza nel 1992
perc1992= prop1992 *100 # percentuale della frequenza nel 1992
# Percentuali: forest = 83%, Human = 17%

# Facciamo i calcoli per il 2006, prima li abbiamo fatti per il 1992

freq(m2006c)
f2006<-freq(m2006c)
tot2006<-ncell(m2006c)
prop2006= f2006/tot2006
perc2006= prop2006 *100
# Percentuali: forest = 45%, Human = 55%

# Riassumendo abbiamo:
1992: 17% human, 83% forest
2006: 55% human, 45% forest

# Introduciamo funzione data.frame, fondamentalmente creiamo una tabella
# Costruiamo un dataframe

class <- c("forest", "human")
y1992 <- c(83,17) # Indichiamo l'immagine del 1992 come y1992 con le relative percentuali di copertura
y2006 <- c(45,55) # Indichiamo l'immagine del 1992 come y2006 con le relative percentuali di copertura
tabout <- data.frame(class, y1992, y2006) # Creaiamo l'uoutput grafico di questo dataframe
tabout # Per vederla in tabella effettiva posso usare anche View(tabout)

# Usiamo ggplot2 graphs

ggplot (tabout, aes(x=class, y=y1992, colour=class)) + geom_bar(stat="identify", fill="white") #plot1
ggplot (tabout, aes(x=class, y=y2006, colour=class)) + geom_bar(stat="identify", fill="white") #plot2

# Installare se mancante, o richiamare in alternativa o in sequenza, il pacchetto patchwork
install.packages("patchwork")
library(patchwork)

p1 <- ggplot (tabout, aes(x=class, y=y1992, colour=class)) + geom_bar(stat="identity", fill="white") #plot1
p2 <- ggplot (tabout, aes(x=class, y=y2006, colour=class)) + geom_bar(stat="identity", fill="white") #plot2

p1+p2

# Non va bene avre un grafico con una scala e uno con l'altra, devono avere LA STESSA scala.
# cambio la scala degli assi x e y usando le linee

p1 <- ggplot (tabout, aes(x=class, y=y1992, colour=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot (tabout, aes(x=class, y=y2006, colour=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))

p1+p2

# Così si vedono chiaramente le differenze sulla scala generale.


