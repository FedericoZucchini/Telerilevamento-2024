# Secondo metodo per quantificare praticamente le variazioni di copertura del terreno nel tempo
#Primo metodo basato su classificazione

library(imageRy) #Richiamiamo la libreria imageRy
library(terra) #Richiamiamo la libreria terra

im.list() #Usiamo la funzione im.list() per vedere quali oggetti abbiamo a disposizione

# Importiamo i dati
EN01 <- im.import("EN_01.png") # Nomino l'oggetto che voglio caricare e gli associo l'immagine desiderata (immagine 1)
EN13 <- im.import("EN_13.png") # Nomino l'oggetto che voglio caricare e gli associo l'immagine desiderata (immagine 2)

par(mfrow=c(2,1))
im.plotRGB.auto(EN01) #Immagine relativa al monitoraggio dell'inquinamento da biossido di azoto a livello della troposfera nel 2001
im.plotRGB.auto(EN13) #Immagine relativa al monitoraggio dell'inquinamento da biossido di azoto a livello della troposfera nel 2013

difEN = EN01[[1]] - EN13[[1]] #Calcolo la differenza dei valori fra le 2 immagini che ho selezionato per l'importazione
cl <- colorRampPalette(c("blue","white","red")) (100) #costruisco la palette di colore da impiegare per la rappresentazione della differenza di valori
plot(difEN, col=cl) #Plotto la differenza di indici impiegando la palette di colori che ho ideato 


## Scioglimento dei ghiacciai in Groenlandia

g2000 <- im.import("greenland.2000.tif") #Chiamo e definisco l'immagine che scelgo di plottare, in questo caso l'immagine relativa alla copertura glaciale nell'anno 2000
clg <- colorRampPalette(c("black","blue","white","red")) (100) #Scelgo la palette di colore che voglio impiegare
plot(g2000, col=clg) #Plotto l'immagine selezionata con la palette ideata

g2005 <- im.import("greenland.2005.tif") #Plotto l'immagine relativa all'anno 2005
g2010 <- im.import("greenland.2010.tif") #Plotto l'immagine relativa all'anno 2010
g2015 <- im.import("greenland.2015.tif") #Plotto l'immagine relativa all'anno 2015

par(mfrow=c(1,2)) #Faccio un par con le immagini selezionate, in questo caso prendo quelle del 2000 e del 2015
plot(g2000, col=clg) #plotto l'immagine del 2000 con la palette di colore selezionata in precedenza
plot(g2015, col=clg) #plotto l'immagine del 2015 con la palette di colore selezionata in precedenza

par(mfrow=c(2,2)) #Faccio un altro par con 4 immagini, questa volta
plot(g2000, col=clg) #plotto l'immagine del 2000 con la palette di colore selezionata in precedenza
plot(g2005, col=clg) #plotto l'immagine del 2005 con la palette di colore selezionata in precedenza
plot(g2010, col=clg) #plotto l'immagine del 2010 con la palette di colore selezionata in precedenza
plot(g2015, col=clg) #plotto l'immagine del 2015 con la palette di colore selezionata in precedenza

# stack #faccio uno stack
greenland <- c(g2000, g2005, g2010, g2015) #costruisco lo stack con le 4 immagini a disposizione
plot(greenland, col=clg) #plotto lo stack con la relativa palette di colori scelta in precedenza

difg = greenland[[1]] - greenland[[4]] #faccio il calcolo della differenza fra le immagini con la banda 1 e 4
clgreen <- colorRampPalette(c("red","white","blue")) (100) #costruisco una nuova palette di colore da usare
plot(difg, col=clgreen) #plotto la differenza con la nuova palette di colori selezionata

im.plotRGB(greenland, r=1, g=2, b=4) # g2000 on red, g2005 on green, g2015 on blue #plotto l'immagine della groenlandia con una differente distribuzione di colori
