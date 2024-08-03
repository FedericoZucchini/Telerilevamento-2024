#Codice Esame Federico Zucchini (SGN)
#Codice per lo svolgimento di analisi dei danni che sono stati causati dalla Tempesta Vaia che si è abbattuta nel Nord Est Italia, in particolare in Veneto nella regione del Cadore (BL), nel periodo di 3 anni (2018, 2019, 2022). L'obiettivo principale del programma è quello di analizzare la perdita della copertura forestale a seguito dei danni da forte vento e pioggia. 
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

getwd()
#"getwd()" è un comando impiegato per vedere quale sia il percorso di lavoro e conseguentemente la directory di lavoro.

#"setwd()" è un comando impiegato per impostare la directory di lavoro. 
#In questo caso l’ho impostata nella cartella Documents.

setwd("C:/Users/Federico/Documents")

#IMPORTAZIONE IMMAGINI

##Le immagini scelte sono state prese dal sito "Copernicus Browser" nella zona intorno a Alleghe, Caprile, Colle Santa Lucia e Rocca Pietore (le zone cadorine più colpite dalla tempesta Vaia in quella zona) in Provincia di Belluno (BL) in Veneto.
##Le immagini sono state prese per 3 anni, in particolare 2018-2019-2022. Sono state selezionate quelle più pulite dalla copertura nuvolosa.
##Le immagini sono tutte del periodo estivo (giugno 2018, luglio 2019, luglio 2022), non sono tutte dello stesso mese per via della copertura nuvolosa che rendeva illeggibili e non confrontabili le immagini.
##Per ogni anno ho preso in esame vengono fornite 2 immagini: una con i colori veri e una in falsi colori

