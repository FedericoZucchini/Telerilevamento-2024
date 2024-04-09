# Quantificazione della copertura del suolo (land cover variability)

# Installazione pacchetto ggplot2
install.packages("ggplot2")
library(ggplot2)
library(terra)
library(imageRy)

# Listing images
im.list()

# Importing data
m1992<-im.import("matogrosso_l5_1992219_lrg.jpg")
# Procediamo con la classificazione dell'immagine
MA PRIMA... giochiamo un po'
sun<-.im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
# im.classify()
sunc<-im.classify(sun, num_clusters=3)

# Richiamo le 2 immagini su cui voglio elaborare
m1992<-im.import("matogrosso_l5_1992219_lrg.jpg")
m2006<-im.import("matogrosso_ast_2006209_lrg.jpg") 
# Classificazione immagini
m1992 <- im.classify(m1992,num_clusters=2)
m2006c <- im.classify(m2006, num_clusters=2)
# Classe 1 = Human, suolo nudo
# Classe 2 = Foresta

# Vogliamo calcolare la frequenza di una certa classe, ad es. la foresa, e lo facciamo poi per la seconda classe.
