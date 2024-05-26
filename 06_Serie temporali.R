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

difEN = EN01[[1]] - EN13[[1]] # Calcolo la differenza dei valori fra le 2 immagini che ho selezionato per l'importazione
cl <- colorRampPalette(c("blue","white","red")) (100) # costruisco la palette di colore da impiegare per la rappresentazione della differenza di valori
plot(difEN, col=cl) # Plotto la differenza di indici impiegando la palette di colori che ho ideato 

## Ice melt in Greenland
g2000 <- im.import("greenland.2000.tif")
clg <- colorRampPalette(c("black","blue","white","red")) (100)
plot(g2000, col=clg)

g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")

par(mfrow=c(1,2))
plot(g2000, col=clg)
plot(g2015, col=clg)

par(mfrow=c(2,2))
plot(g2000, col=clg)
plot(g2005, col=clg)
plot(g2010, col=clg)
plot(g2015, col=clg)

# stack
greenland <- c(g2000, g2005, g2010, g2015)
plot(greenland, col=clg)

difg = greenland[[1]] - greenland[[4]]
clgreen <- colorRampPalette(c("red","white","blue")) (100)
plot(difg, col=clgreen)

im.plotRGB(greenland, r=1, g=2, b=4) # g2000 on red, g2005 on green, g2015 on blue
