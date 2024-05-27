# Importazione dati da una fonte esterna

install.packages("RNetCDF") #Installiamo il pacchetto RNetCDF
library(RNetCDF) # needed to read Copernicus .nc data #Richiamo la libreria appena installata
library(terra) #Richiamo la libreria terra
library(imageRy) #Richiamo la libreria imageRy

setwd("/home/duccio/Downloads") #Impostiamo la directory di lavoro
# make use of slash instead of backslash
# Example: C://Documents/ instead of C:\\Documents\ 

# read the data
eclissi <- rast("eclissi.png") #Importiamo l'immagine relativa all'eclissi di Luna, si usa un'immagine png in questo caso
# like i.import in imageRy
# rast() is a function in the terra package

# plot the data
im.plotRGB(eclissi, 1, 2, 3) #Plottiamo l'immagine selezionata con le bande nell'ordine iniziale
im.plotRGB(eclissi, 3, 2, 1) #Plottiamo l'immagine selezionata con le bande nell'ordine variato (I)
im.plotRGB(eclissi, 2, 3, 1) #Plottiamo l'immagine selezionata con le bande nell'ordine variato (II)
im.plotRGB(eclissi, 2, 1, 3) #Plottiamo l'immagine selezionata con le bande nell'ordine variato (III)

# Differenti metodi di plottaggio delle immagini
par(mfrow=c(1,2)) #Faccio un par con 2 immagini
im.plotRGB(eclissi, 2, 1, 3)
plotRGB(eclissi, 3, 1, 3)

# Calcolo la differenza di banda
dif = eclissi[[1]] - eclissi[[2]]

# Importazione di un'altra immagine
# Exercise: import another image from the net!
cratere <- rast("cratere")
im.plotRGB(cratere, 1, 2, 3)
im.plotRGB(cratere, 2, 1, 3)

# importing Copernicus data #Importazione dati/immagine da Copernicus
ocean <- rast("oceanisgreening_2022_lrg.jpg")
im.plotRGB(ocean, 1, 2, 3)
im.plotRGB(ocean, 2, 1, 3)

#Facciamo la stessa cosa con un'altra immagine
soil <- rast("c_gls_SSM1km_202404160000_CEURO_S1CSAR_V1.2.1.nc")
plot(soil)
plot(soil[[1]])

# cropping data
ext <- c(25, 35, 58, 62)
soilcrop <- crop(soil, ext)
