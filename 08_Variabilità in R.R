# Misurare la variabilità delle immagini satellitari

#Richiamo le librerie necessarie di terra e imageRy
library(imageRy)
library(terra)

#Installo il pacchetto di funzioni viridis necessario per svolgere le funzioni che vogliamo portare a termine
install.packages("viridis")
library(viridis) #Richiamo la libreria del pacchetto appena installato

im.list() #Richiamo la funzione im.list() per vedere i contenuti 

sent <- im.import("sentinel.png") #Costruisco l'oggetto sent

im.plotRGB(sent, 1, 2, 3) #Plotto il sent che le bande relative

#Ricapitoliamo le bande e i numeri a cosa corrispondono
# NIR = band 1
# red = band 2
# green = band 3

im.plotRGB(sent, r=2, g=1, b=3) #faccio un altro plot con le bande in ordine differente

nir <- sent[[1]]
cl <- colorRampPalette(c("red","orange","yellow"))(100) #Costruisco personalmente una palette di colori da usare per svolgere questa rappresentazione
plot(nir, col=cl) #Plotto  la banda nir con la palette di colori impostata precedentemente

sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)

viridisc <- colorRampPalette(viridis(7))(256) #Definisco un oggetto con la rappresentazione che voglio dargli
plot(sd3, col=viridisc) #Plotto una nuova immagine con la palette di colore selezionata adeguata ed imposto 256 sfumature invece delle solite 100

# Standard deviation 7x7 
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd) #Costruisco una matrice
plot(sd7, col=viridisc)

# stack
stacksd <- c(sd3, sd7) #Costruisco un file stack
plot(stacksd, col=viridisc) #Plotto il file stack che ho costruito

# Standard deviation 13x13
sd13 <- focal(nir, matrix(1/169, 13, 13), fun=sd) #Costruisco un'altra matrice cambiando il numero

stacksd <- c(sd3, sd7, sd13)
plot(stacksd, col=viridisc)
