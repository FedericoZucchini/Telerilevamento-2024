# Visualizzare dati satellitari in R da imageRy
# Riportiamo il link di riferimento da cui prendiamo le informazioni che ci servono
# https://sentinels.copernicus.eu/web/sentinel/user-guides/sentinel-2-msi/resolutions/spatial

# Richiamo col comando library i pacchetti terra e imageRy

library(terra)
library(imageRy)

# Richiedo di vedere la lista dei dati disponibili in imageRy impiegando il comando "im.list()"

im.list()

# Come si importano i dati
# Do all'oggetto, es., sentinel.dolomites.b2.tif, il nome di b2 associato alla banda di colore relativa

b2 <- im.import("sentinel.dolomites.b2.tif")

# Come si plottano i dati in questo caso
# Definisco una banda di colori da impiegare per la rappresentazione del film tif che ho scelto di visualizzare
# In questo caso ho scelto un file tif relativo alla catena montuosa dolomitica delle Tofane in Veneto in zona Cortina d'Ampezzo
# Scelgo di definire una banda di colore dandogli un nome esemplificativo, in questo caso scelgo "clg" per brevità
# Utilizzo il comando colorRamPalette insieme a c(), indico anche fuori da questa funzione di associazione, fra altre due parentesi tonde il numero di sfumature che voglio impiegare
# Più è alto il numero di sfumature maggiore sarà l'omogeneità della visualizzazione

clg <- colorRampPalette(c("black", "grey", "light grey"))(3) #questa palette di colore che ho scelto di creare è fondamentalmente una palette di colore in bianco e nero

# Con il seguente comando scelgo di plottare i dati/il file caricato con l'associazione di palette di colore proprio quella appena creata

plot(b2, col=clg)

# Per dimostrare quanto scritto sopra a proposito delle sfumature della palette... richiamo il comando aumentando il numero di fumature da 3 a 100, mantenendo il resto delle caratteristiche uguali

clg <- colorRampPalette(c("black", "grey", "light grey"))(100)
plot(b2, col=clg)

# Creo un'altra possibile palette di colori da impiegare, ancora una volta provando a mantenere la distinzione fra 3 e 100 sfumature, il resto dei comandi rimane uguale

clcyan <- colorRampPalette(c("magenta", "cyan4", "cyan"))(3)
plot(b2, col=clcyan)
clcyan <- colorRampPalette(c("magenta", "cyan4", "cyan"))(100)
plot(b2, col=clcyan)

# Creo una nuova Palette di colori, stavolta usando direttamente le 100 sfumature, e d'ora in poi userò sempre questo valore di partenza, poi la plotto
clch <- colorRampPalette(c("magenta", "cyan4", "cyan", "chartreuse"))(100)
plot(b2, col=clch)

# Come si importano altre bande di colore
# Importo la banda b3, le associo l'ultima palette di colore che ho ideato, la plotto

b3 <- im.import("sentinel.dolomites.b3.tif")
plot(b3, col=clch)

# Importo la banda b4, le associo l'ultima palette di colore che ho ideato, la plotto

b4 <- im.import("sentinel.dolomites.b4.tif")
plot(b4, col=clch)

# Importo la banda b8, le associo l'ultima palette di colore che ho ideato, la plotto

b8 <- im.import("sentinel.dolomites.b8.tif")
plot(b8, col=clch)

# Come costruire un multiframe per avere una nuova visualizzazione
# Scrivo una nuova funzione, la funzione "par" per creare una rappresentazione unica di più grafici
# Voglio costruire una rappresentazione con più immagini insieme utilizzando il multiframe
# Il comando di questa funzione si scrive indicando la funzione che voglio usare "par" seguita da una parentesi tonda con all'interno l'indicazione del multiframe che voglio usare seguito dalla funzione c()
contenente all'interno l'indicazione della rappresentazione che voglio fare. I 2 numeri indicano righe e colonne, quindi una rappresentazione "2,2" è una matrice a 4 caselle
# Scrivo il comando nel seguente modo, seguito dalla ripetizione del comando plot per le bande che voglio rappresentare

par(mfrow=c(2,2))
plot(b2)
plot(b3)
plot(b4)
plot(b8)

# Rifaccio la stessa cosa cambiando la Palette di colori impiegata

par(mfrow=c(2,2))
plot(b2, col=clch)
plot(b3, col=clch)
plot(b4, col=clch)
plot(b8, col=clch)

# Esercizio
# Plottare le 4 bande una dopo l'altra in riga (matrice a 1 riga con 4 colonne)

par(mfrow=c(1,4))
plot(b2, col=clch)
plot(b3, col=clch)
plot(b4, col=clch)
plot(b8, col=clch)

# Lavoriamo come le immagini satellitari
# Impieghiamo la funzione di associazione definendo il nuovo oggetto con un nuovo nome, es. stacksent, usando sempre la funzione c()
# Plotto la nuova rappresentazione associata ad una Palette di colori a scelta

stacksent <- c(b2, b3, b4, b8)
plot(stacksent) #, col=clch)

!: Per fare PULIZIA dopo tante rappresentazioni sull'interfaccia grafica impiego il comando/funzione "dev.off()" che mi pulisce l'interfaccia grafica cancellando l'ultima rappresentazione

dev.off()

# Proseguo con una nuova rappresentazione, in questo caso scelgo di rappresentare la quarta immagine, quella corrispondente alla banda NIR, vcino infrarosso.

plot(stacksent[[4]])
plot(stacksent[[4]], col=clch)

# Faccio una nuova rappresentazione impiegando in dettaglio la banda RGB (Rosso, Verde, Blue)
# Scrivo i comandi per la rappresentazione dell'oggetto stacksent con relative corrispondenze alle bande di colore impiegate
# stacksent[[1]] = b2 = blue
# stacksent[[2]] = b3 = green
# stacksent[[3]] = b4 = red
# stacksent[[4]] = b8 = nir

# Plotto in grafico la rappresentazione con queste nuove bande di colore per vedere gli effetti della rappresentazione in particolare con il nir.
# im.plotRGB(stacksent, r=3, g=2, b=1)
# Plotto per provare queste 2 versioni

im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 2, 1)


# Esercizio: Fare un plot con i colori naturali e le immagini in falsi colori una dopo l'altra, quindi in modalità una riga e 2 colonne

par(mfrow=c(1,2))
im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 2, 1)

# Ancora una volta faccio pulizia con il comando "dev.off()"

dev.off()

# Faccio un'altra seguente rappresentazione

im.plotRGB(stacksent, 4, 3, 2)

# Proseguo con una rappresentazione in questo a 3 immagini, non più a 2.

par(mfrow=c(1,3))
im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 2, 1)
im.plotRGB(stacksent, 4, 3, 2)

# Faccio ancora pulizia con lo stesso comando

dev.off()

#Questa volta faccio qualcosa di diverso, utilizziamo le bande di verde e vicino infrarosso (G e nir)

im.plotRGB(stacksent, 3, 4, 2)

# Questa volta faccio qualcosa di diverso, utilizziamo le bande di blu e vicino infrarosso (B e nir)

im.plotRGB(stacksent, 3, 2, 4)

# Esercizio finale: Costruire in fine un multiframe con le 4 immagini tutte unite insieme in uno schema 2x2, matrice 2 righe e 2 colonne

par(mfrow=c(2,2))
im.plotRGB(stacksent, 3, 2, 1) # natural colors
im.plotRGB(stacksent, 4, 2, 1) # nir on red
im.plotRGB(stacksent, 3, 4, 2) # nir on green
im.plotRGB(stacksent, 3, 2, 4) # nir on blue

# Posso ricercare la correlazione delle informazioni per quanto appena fatto
# Faccio questo mediante il comando "pairs(stacksent)"

pairs(stacksent)

# Grafici mostrano correlazione pixel bandaxbanda. Blu e verde molto correlati ad es.
# Abbiamo indice correlazione di Pearson. Va da -1 a +1.
# I valori si abbassano quando si va verso il vicino infrarosso.
# Se digito il nome di un oggetto, es. b2, mi escono tutte le sue informazioni relative
