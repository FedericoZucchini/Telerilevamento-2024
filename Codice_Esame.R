#Codice Esame Federico Zucchini (SGN)
#Codice per
#Il codice qui scritto è stato scriptato impiegando i seguenti pacchetti di funzioni, scaricati ed installati in precedenza.
#In caso di assenza di un pacchetto in R si procede con l'installazione mediante l'impego della funzione "install.packages("")"
#NOTA sull'Installazione
#Per l’installazione funzionante del pacchetto va inserito fra virgolette ("")
#Per richhiamare le funzioni si usa la codifica "library()"
#NOTA sulle funzioni
#Quando si richiamano non è necessario scrivere il pacchetto con le "" perchè è già all’interno di R dopo l'installazione)

library(terra)       
#Pacchetto in R con specializzazione per analisi geospaziale e manipolazione di dati raster.

library(imageRy)     
#Pacchetto in R per gestione dati raster, visualizzazione, importazione e modificazione delle immagini.
#Facilita condivisione di immagini.

library(ggplot2)     
#Pacchetto in R per creazione di grafici statistici.

library(patchwork)   
#Pacchetto in R per organizzazione e personalizzazione dela disposizione di più grafici insieme. 

library(viridis)     
#Pacchetto in R usato per assegnare alle immagini rappresentate delle palette di colore
#Utile per usare palette distinguibili anche dalle persone daltoniche. 

#"setwd()" è un comando impiegato per impostare la directory di lavoro. 
#In questo caso l’ho impostata nella cartella "immagini esame" sul desktop del computer.

setwd("C:/Users/   /Desktop/Immagini esame")

#IMPORTAZIONE IMMAGINI

##Le immagini scelte sono state prese dal sito "Copernicus Browser" 

