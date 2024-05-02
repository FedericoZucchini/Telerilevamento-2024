# Analisi multivariata

# Funzione im.pca () fa tutto quello che serve fare per compattare un set in una sola dimensione

# Installare viridis.
install.packages("viridis")

# Richiamare le librerie necessarie per lavorare in questo caso

library(imageRy)
library(terra)
library(viridis)

# Lista dei dati
im.list()

# Importazione dati
b2 <- im.import("sentinel.dolomites.b2.tif") # blu
b3 <- im.import("sentinel.dolomites.b3.tif") # verde
b4 <- im.import("sentinel.dolomites.b4.tif") # rosso 
b8 <- im.import("sentinel.dolomites.b8.tif") # nir

# Facciamo una concatenazione con il comanco "c()"
sentdo <- c(b2, b3, b4, b8)

# Richiamo sentdo creato poco fa per vedere le proprietà
sentdo

# Visualizzazione dell'immagine

im.plotRGB(sentdo, r=4, g=3, b=2)

# Prove variazioni
im.plotRGB(sentdo, r=3, g=4, b=2)

# Vediamo correlazione fra le immagini
pairs(sentdo)















