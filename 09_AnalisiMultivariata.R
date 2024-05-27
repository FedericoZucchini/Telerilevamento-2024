# Analisi multivariata

# Funzione im.pca() fa tutto quello che serve fare per compattare un set in una sola dimensione

# Installare pacchetto "viridis".
install.packages("viridis")

# Richiamare le librerie necessarie per lavorare in questo caso

library(imageRy)
library(terra)
library(viridis)

# Lista dei dati
im.list()

# Importazione dati, immagini relative al blocco delle Tofane in provincia di Belluno
b2 <- im.import("sentinel.dolomites.b2.tif") # blu
b3 <- im.import("sentinel.dolomites.b3.tif") # verde
b4 <- im.import("sentinel.dolomites.b4.tif") # rosso 
b8 <- im.import("sentinel.dolomites.b8.tif") # nir

# Facciamo una concatenazione con il comando "c()"
sentdo <- c(b2, b3, b4, b8)

# Richiamo "sentdo" creato poco fa per vedere le proprietà
sentdo

# Visualizzazione dell'immagine

im.plotRGB(sentdo, r=4, g=3, b=2)

# Prove variazioni
im.plotRGB(sentdo, r=3, g=4, b=2)

# Vediamo correlazione fra le immagini
pairs(sentdo)

# pca
picmage<-im.pca(sentdo)

tot <- sum()
N*100/tot #Da la variabilità spiegata dal primo asse

# pca
pcimage <- im.pca(sentdo)

tot <- sum(1314.33400, 551.50879, 39.48238, 27.35780)
1314.33400 * 100 / tot

plot(pcimage, col=viridis(100))
plot(pcimage, col=plasma(100))

#Plot della pca usando viridis

vir <- colorRampPaeltte(viridis(7)) (100)
plot(pcimage, col= vir)
plot (pcimage, col= viridis(100))
plot (pcimage, col=plasma(100)) # Esempio con un'altra legenda di colori

















