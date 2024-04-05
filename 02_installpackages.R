APPUNTI 2a lezione (...)
#Istallazione pacchetti R

install.packages("terra")

library(terra)


APPUNTI 2a lezione (...)

# Come installare nuovi pacchetti di R
# Cominciamo installiando il pacchetto "terra" con il seguente comando

install.packages("terra")

# Proseguiamo installando il pacchetto "devtools" con il seguente comando

install.packages("devtools")

# Andiamo a richiamare nella libreria il pacchetto "terra" appena installato con il comando "library ()"

library(terra)

# Posso in alternativa usare anche il comando "require()"
# Richiamo in libreria anche devtools

library(devtools)

# Come installare il pacchetto imageRy da GitHub

# Uso una funzione di devtools:
# Mi occorre usare il comando indicato come segue: install_github("ducciorocchini/imageRy")

install_github("ducciorocchini/imageRy") # Così facendo installo tale pacchetto dal GitHub del prof. Duccio Rocchini 

# Con il comando già visto, "library()" indicando di voler richiamare il pacchetto imageRy, richiamo tale pacchetto

library(imageRy)
