APPUNTI 1a lezione (originari) con commento breve
# First R script
# Usiamo R come una semplice calcolatrice

a <- 6*7 # assegniamo all'oggetto a il valore del prodotto dei numeri 6 e 7
b <- 5*8 # assegnamo all'oggetto b il valore del prodotto dei numeri 5 e 8
a+b # chiamiamo R a risolvere l'operazione di somma fra a e b scrivendo semplicemente la quantità a+b

# R as a calculator

# arrays, costruiamo gli arrays a cui diamo i nomi di "fiori"
flowers <-c(3,6,8,10,15,18) # Utilizziamo la funzione "concatenate" e richiamiamo l'oggetto che abbiamo appena creato
flowers

#Facciamo la stessa cosa MA usiamo gli insetti
insects <-c(10,16,25,42,61,73)
insects

plot(flowers, insects) #Vogliamo mettere insieme nello stesso grafico le variabili fiori e insetti come x e y

#changing plot parameters, possiamo cambiare i parametri del grafico, il plot
#symbols, possiamo cambiare i simboli del grafico, cambiandone la resa grafica e il "punto" sul grafico
#In particolare con pch cambiamo la rappresentazione

plot(flowers, insects, pch=19)

#symbols dimensions
#In particolare con cex cambiamo la dimensione

plot(flowers, insects, pch=19, cex=2)

#color
#In particolare con col cambiamo il colore 
plot(flowers, insects, pch=19, cex=2, col="chocolate1")


APPUNTI 1a lezione (ordinati e arricchiti)
# Primo script di R
# Utilizziamo R come una calcolatrice 
# Associamo agli oggetti a,b le operazioni di prodotto fra 2 numeri (es.)
# Si usa il simbolo di associazione "<-" per associare un numero o comunque un attributo ad un oggetto, in questo caso lo associamo alle lettere a,b

a <- 6 * 7
b <- 5 * 8

# Chiediamo a R di fare l'operazione di somma degli oggetti a,b

a + b

# R ci restituisce il risultato di somma fra a e b

# Utiliziamo R per produrre degli Arrays
# Creiamo l'oggetto "flowers" a cui attribuiamo, mediante la funzione di comando "concatenate" ["c()"] una serie di valori separati da una virgola
flowers <- c(3, 6, 8, 10, 15, 18)
# Richiamiamo l'oggetto "flowers" che R ci mostrerà nell'output
flowers
# Creiamo un altro oggetto, "insects" a cui attribuiamo allo stesso modo una serie di valori numerici
insects <- c(10, 16, 25, 42, 61, 73)
# Richiamiamo l'oggetto "insects" che R ci mostrerà nell'output
insects

# Chiediamo a R di farci il grafico di questi 2 oggetti, per questo usiamo la funzione "plot"

plot(flowers, insects)

# Cambiamo i parametri di plot 

# Andiamo a cambiare la modalità di visualizzazione dei simboli impiegati nel plot 
# Cambiamo come ci appaiono i pallini con cui vengono rappresentati i dati nel grafico
# A seconda del numero che inseriamo in "pch" cambia la modalità di visualizzazione del punto sul grafico
# Se non metto un numero il pallino compare tondo bianco vuoto, Al numero 19 di pch corrisponde, es., il pallino nero pieno, al 25 corrisponde un triangolino con la base verso l'alto, al 69 una E ecc.
plot(flowers, insects)
plot(flowers, insects, pch=19)
plot(flowers, insects, pch=25)
plot(flowers, insects, pch=69)

# Cambiamo le dimensioni dei simboli con cui vengono visualizzati i dati
# Per far prima consideriamo direttamente la funzione plot con i nseriti i dati che vogliamo visualizzare e aggingiamo la funzione "cex" che cambia la dimensione
# Se a pch associo il numero 2 le dimensioni dei pallini raddoppiano, se metto ad es. .5 dimezzano (posso impiegare il "." per indicare "0,")
plot(flowers, insects, pch=19, cex=2)
plot(flowers, insects, pch=19, cex=.5)

# Cambiamo il colore con cui vengono visualizzati i dati nell'output 
# Posso ad es. andare ad inserire la funzione "col" che ci cambia e dichiara il colore dei dati che sto rappresentando
# Per es. posso inserire "chocolate1" per andare a rappresentare pallini di colore marrone.
# Per vedere i colori a disposizione posso andare in una libreria (verificare il nome della libreria dei colori da usare e seguire)
plot(flowers, insects, pch=19, cex=.5, col="chocolate1") 
