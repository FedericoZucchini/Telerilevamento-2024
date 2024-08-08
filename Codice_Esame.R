###Codice Esame Federico Zucchini (SGN).
#Codice per lo svolgimento di analisi dei danni che sono stati causati dalla Tempesta Vaia (ottobre/novembre 2018) che si è abbattuta nel Nord Est Italia, con focus sulla regione Veneto nella zona del Cadore (BL), nel periodo di 3 anni (2017, 2019, 2022).
#L'obiettivo principale del programma è quello di analizzare la perdita della copertura forestale a seguito dei danni da forte vento e pioggia con caratteristiche da uragano. 
#Il codice qui scritto è stato “scriptato” impiegando i seguenti pacchetti di funzioni, scaricati e installati in precedenza. 
#In caso di assenza di un pacchetto in R si procede con l'installazione mediante l'impego della funzione "install.packages ("")"
#NOTA sull'Installazione:
#Per l’installazione funzionante del pacchetto va inserito fra virgolette ("").
#Per richiamare le funzioni si usa la codifica "library ()".
#NOTA sulle funzioni:
#Quando si richiamano non è necessario scrivere il pacchetto con le "" perchè è già presente all’interno di R dopo l'installazione).

#Richiamo con la funzione “library ()” i vari pacchetti di cui necessito:
library(terra)       

#Pacchetto in R con specializzazione per analisi geospaziale e manipolazione di dati raster.
library(imageRy)     

#Pacchetto in R per gestione dati raster, visualizzazione, importazione e modificazione delle immagini.
#Facilita condivisione di immagini.

library(ggplot2)     
#Pacchetto in R per creazione di grafici statistici.

library(patchwork)   
#Pacchetto in R per organizzazione e personalizzazione della disposizione di più grafici insieme. 

library(viridis)     
#Pacchetto in R usato per assegnare alle immagini rappresentate delle palette di colore
#Utile per usare palette distinguibili anche dalle persone daltoniche. 

getwd()
#"getwd()" è un comando impiegato per vedere quale sia il percorso di lavoro e conseguentemente la directory di lavoro.
#"setwd()" è un comando impiegato per impostare la directory di lavoro. 
#In questo caso l’ho impostata nella cartella Documenti.
setwd("C:/Users/Federico/Documenti")

###IMPORTAZIONE IMMAGINI

#Le immagini scelte sono state prese dal sito "Copernicus Browser" nella zona intorno ad Alleghe, Caprile, Colle Santa Lucia e Rocca Pietore (le zone cadorine più colpite dalla tempesta Vaia in quella zona) in Provincia di Belluno (BL) in Veneto.
#Le immagini sono state prese per 3 anni, in particolare 2017-2019-2022 (a distanza di 2 anni l’una dall’altra ed in particolare una l’anno prima e una l’anno dopo di Vaia).
#Sono state selezionate quelle più pulite dalla copertura nuvolosa.
#Le immagini sono tutte del periodo estivo (giugno 2017, luglio 2019, giugno 2022), non sono tutte dello stesso mese per via della copertura nuvolosa che rendeva illeggibili e non confrontabili le immagini.
#Per ogni anno ho preso in esame vengono fornite 2 immagini satellite "sentinel 2”: una con i colori veri "true color" aventi le bande b4, b3 e b2 (red, green, blue: RGB). e una in falsi colori "false color" aventi le bande b8, b4 e b3 (nir, red, green: Vicino infrarosso e 2 delle precedenti bande).
#Lo scopo da portare a termine è quello di prelevare la banda b8, cioè quella del nir, dalle immagini in falsi colori per importarla in un unico oggetto assieme alle altre bande b4, b3 e b2. Voglio quindi costruire un’unica immagine con 4 bande: b2, b3, b4, b8 (blue, red, green, nir).
#Si importano le dalla cartella indicata nella directory tramite la funzione "rast()" del pacchetto "terra", che permette di importare delle immagini creando un oggetto Spatraster.
#Nomino gli oggetti caricati nello spazio di lavoro come “VCanno” (Vaia in Cadore + anno di raccolta dell’immagine).
#Commento generalmente solo il primo comando di ogni azione come esemplificazione di come si procede per rendere più snella la lettura del codice.

VC2017<-rast("2017-06-08-23_59_Sentinel-2_L2A_True_color.jpg")      
#Importazione dell'immagine jpg nell'oggetto chiamato "VC2017" per l'anno 2017.
#Le bande di colore di questo oggetto sono b4, b3 e b2 (red, green, blue; RGB).  
VC2017
#Vedo tutte le informazioni disponibili per il l’oggetto che ho appena caricato e creato
VCNIR2017<-rast("2017-06-08-23_59_Sentinel-2_L2A_False_color.jpg")
#Importazione dell'immagine jpg nell'oggetto chiamato "VCNIR2017" per l'anno 2017.
#Le bande di colore di questo oggetto sono b8, b4 e b3 (nir, red, green).
VCNIR2017
#Vedo tutte le informazioni disponibili per il l’oggetto che ho appena caricato e creato

VC2019 <-rast("2019-07-23-23_59_Sentinel-2_L2A_True_color.jpg")
VC2019
VCNIR2019<-rast("2019-07-23-23_59_Sentinel-2_L2A_False_color.jpg")
VCNIR2019
VC2022 <-rast("2022-06-12-23_59_Sentinel-2_L2A_True_color.jpg")
VC2022
VCNIR2022<-rast("2022-06-12-23_59_Sentinel-2_L2A_False_color.jpg")
VCNIR2022

#Warning unknown extend: Motivazione è l’assente georeferenziazione delle immagini impiegate. #Un avviso di "Warning" non implica un "Error, e quindi l’impossibilità di svolgimento di un comando o comunque uno STOP nell’esecuzione del codice ma ci avvisa di un potenziale problema.

par(mfrow=c(3,1))
#Funzione impiegata per la creazione di una finestra grafica in una griglia a righe e colonne andando a specificarne il numero impiegato.
#In questo caso sono 3 righe e 1 colonna, così da disporre più grafici in una sola finestra in colonna.
#Dopo il comando "par()" si vanno ad inserire tutti i grafici che si vogliono andare a visualizzare mediante il comando "plot()".

#Le immagini vengono visualizzate tramite la funzione "plot()".
#Faccio un par in colonna delle immagini in colori veri.
plot(VC2017)
plot(VC2019)
plot(VC2022)

par(mfrow=c(3,1))
#Faccio un par in colonna delle immagini in falsi colori.
plot(VCNIR2017)
plot(VCNIR2019)
plot(VCNIR2022)

#Procedo con l’estrazione degli oggetti di interesse per la prosecuzione del progetto.
b17r<-VC2017[[1]]
b17r
#Tramite le parentesi quadre si specifica l'oggetto da estrarre (in questo caso l'oggetto 1, ovvero la banda 4 del rosso, di "VC2017") per assegnarlo ad un nuovo oggetto chiamato "b17r".
b17g<-VC2017[[2]]
b17g
b17b<-VC2017[[3]]
b17b
b17nir<-VCNIR2017[[1]]
b17nir

#Opero lo stesso procedimento sopra descritto per tutti gli anni rimasti (2019, 2022).
#Opero sull’anno 2019
b19r<-VC2019[[1]]
b19r      
b19g<-VC2019[[2]]
b19g
b19b<-VC2019[[3]]
b19b
b19nir<-VCNIR2019[[1]]
b19nir
#Opero sull’anno 2022
b22r<-VC2022[[1]]
b22r
b22g<-VC2022[[2]]
b22g
b22b<-VC2022[[3]]
b22b
b22nir<-VCNIR2022[[1]]
b22nir

VaiaCadore17<-c(b17r,b17g,b17b,b17nir)
#Vado ad unire le componenti in un unico oggetto e lo nomino "VaiaCadore17", ove tutte le bande estratte in precedenza mi fanno ottenere un unico oggetto con tutte le 4 bande d'interesse insieme, ovvero rosso, verde, blu e nir (RGBNir); tramite la funzione d’assegnazione "c" (concatenate) poiché risultano essere elementi di un vettore.
VaiaCadore17
#Proseguo a fare lo stesso con gli altri anni successivi (2019, 2022).
VaiaCadore19<-c(b19r,b19g,b19b,b19nir)
VaiaCadore19
VaiaCadore22<-c(b22r,b22g,b22b,b22nir)
VaiaCadore22

#Usando la funzione "im.plotRGB()" del pacchetto "imageRy", vado a sostituire il nir (ovvero la banda b8 e 4° elemento dell'oggetto "VaiaCadore17/VaiaCadore19/VaiaCadore22") con le altre componenti (le bande rosso b4, verde b3 e blu b2) dell'immagine per vedere come variano i colori di queste ultime.

#Nir su red: questo comporta una visualizzazione che evidenzia le caratteristiche della vegetazione poichè la vegetazione riflette molto di più nel nir rispetto alle altre superfici, andando a facilitarne l'identificazione. Si può anche capirne le condizioni di salute poichè più queste sono in buona salute, più il nir viene riflesso, e più l'immagine sarà luminosa.
#Conseguentemente, la vegetazione prenderà il colore rosso. Si deve considerare anche che l'intensità della riflettanza varia in base al tipo di vegetazione: un prato rifletterà di più di una pineta, ad es. 
#Proseguo con un “par()” come quello di prima ma con le nuove componenti e poi con la funzione “im.plotRGB()”.
par(mfrow=c(3,1))
im.plotRGB(VaiaCadore17, 4,2,3)
#4,2,3 specificano rispettivamente nir, green, blu dell'oggetto " VaiaCadore17".
#Procedo a plottare gli anni successivi rimasti.
im.plotRGB(VaiaCadore19, 4,2,3)  
im.plotRGB(VaiaCadore22, 4,2,3) 

#Nir sul blu: la vegetazione sarà visivamente di colore blu. Inoltre, il suolo diventerà di colore giallo andando a fornire un ottimo contrasto tra vegetazione e suolo. 
par(mfrow=c(3,1))
im.plotRGB(VaiaCadore17, 1,2,4)
#1,2,4 specificano rispettivamente red, green, nir dell'oggetto "VaiaCadore17".
#Procedo a plottare gli anni successivi rimasti.
im.plotRGB(VaiaCadore19, 1,2,4) 
im.plotRGB(VaiaCadore22, 1,2,4) 

#Nir sul green: la vegetazione sarà visivamente di colore verde, dando un aspetto più naturale all’immagine. 
par(mfrow=c(3,1))
im.plotRGB(VaiaCadore17, 1,4,3)
#1,4,3 specificano rispettivamente red, nir, blu dell'oggetto " VaiaCadore17".
#Procedo a plottare gli anni successivi rimasti.
im.plotRGB(VaiaCadore19, 1,4,3) 
im.plotRGB(VaiaCadore22, 1,4,3) 

###CORRELAZIONE TRA IMMAGINI

#Mediante la funzione "pairs()" si crea una matrice di grafici a dispersione mostrando le relazioni bivariate tra ogni coppia di banda presente nell'oggetto.
#Ogni cella interna alla matrice contiene un grafico a dispersione andando a visualizzare la correlazione di Pearson tra le bande. 
pairs(VaiaCadore17)    
pairs(VaiaCadore19)
pairs(VaiaCadore22)

###CLASSIFICAZIONE DELLE IMMAGINI E RELATIVO CALCOLO DELLA FREQUENZA

#Si classificano le immagini impiegando la funzione "im.classify()" e successivamente si svolge il calcolo della relativa frequenza, proporzione e percentuale del numero dei pixel.
#La funzione impiegata fa parte del pacchetto "imageRy".
#Si procede con la classificazione delle immagini attraverso un algoritmo che permette di creare dei gruppi/cluster basandosi sulla riflettanza del pixel (che, a sua volta, è in funzione di che oggetto si trova su quel pixel, cioè se una pianta o una porzione di suolo, per es.).
#La funzione prende i pixel dell'immagine in maniera randomica e pertanto i colori dei cluster delle classificazioni risultano diversi. 

VaiaCadore17c<-im.classify(VaiaCadore17,3)
VaiaCadore17c
#"im.classify()" è la funzione che mi permette di svolgere la classificazione.
#Tra le parentesi va specificato l'oggetto da cui si vuole fare la classificazione (VaiaCadore17), seguito dal numero di cluster/classi che si vuole avere (3).      
#Procedo a classificare gli anni successivi rimasti.
VaiaCadore19c<-im.classify(VaiaCadore19,3) 
VaiaCadore19c
VaiaCadore22c<-im.classify(VaiaCadore22,3) 
VaiaCadore22c

par(mfrow=c(3,1))
#Faccio un par in colonna delle immagini classificate.
VaiaCadore17c<-im.classify(VaiaCadore17,3)
VaiaCadore19c<-im.classify(VaiaCadore19,3) 
VaiaCadore22c<-im.classify(VaiaCadore22,3)

f2017<-freq(VaiaCadore17c)
f2017
#Per calcolare il numero dei pixel presenti tra le diverse classificazioni scelte, si calcola la frequenza delle classi attraverso l’uso della funzione "freq()".
#Procedo a calcolare la stessa cosa per gli anni successivi rimasti.
f2019<-freq(VaiaCadore19c)
f2019
f2022<-freq(VaiaCadore22c)
f2022

tot2017<-ncell(VaiaCadore17c)
tot2017
#Calcolo del numero totale di celle nell'immagine impiegando la funzione "ncell()". 
#Procedo a calcolare la stessa cosa per gli anni successivi rimasti.
tot2019<-ncell(VaiaCadore19c)
tot2019
tot2022<-ncell(VaiaCadore22c)
tot2022

#Eseguo il calcolo della proporzione per ogni anno a disposizione dato dalle immagini.
prop2017=f2017/tot2017
prop2017
#Calcolo della proporzione rispetto al totale.
#Usiamo = perchè è una funzione matematica. 
#Richiamo l’oggetto appena creato per vedere i risultati numerici
#Procedo coi restanti calcoli per gli anni successivi rimasti. 
prop2019=f2019/tot2019
prop2019
prop2022=f2022/tot2022
prop2022

perc2017=prop2017*100
perc2017
#Calcolo della percentuale dei cluster/classi rispetto al totale delle celle.
#Procedo coi restanti calcoli per gli anni successivi rimasti. 
perc2019=prop2019*100    
perc2019
perc2022=prop2022*100   
perc2022

#Riscrivo il nome degli oggetti aventi le percentuali per visualizzare il dato.
perc2017
#I risultati ottenuti sono: [1] 19.42777, [2] 42.16958, [3] 38.40266.
#I numeri tra le parentesi quadre indicano la percentuale appartenente alla relativa classe/cluster.
perc2019
#I risultati ottenuti sono: [1] 14.66296, [2] 44.62937 , [3] 40.70767.
perc2022
#I risultati ottenuti sono: [1] 40.47332, [2] 48.07092, [3] 11.45576.

###GGPLOT E DATAFRAME 

class<-c("soil", "forest", "grass")
#Creo il vettore "class" mediante "c()" (concatenate, funzione già vista in precedenza) a cui si attribuiscono 3 nomi: "soil", "forest", "grass" (suolo, foresta, prato).
#I nomi vanno messi tra virgolette in quanto tali.
#Questi nomi rappresenteranno i cluster ottenuti durante la classificazione. 
y2017<-c( 19.42777, 42.16958, 38.40266)
#Vettore a cui sono attribuite le relative percentuali calcolate in precedenza (vengono quindi inserite le percentuali ottenute in "perc2018" che corrispondono al numero di pixel corrispondenti a ogni classe per le due immagini; quindi si avranno 3 percentuali per via delle 3 classi ottenute).
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti. 
y2019<-c( 14.66296, 44.62937, 40.70767)
y2022<-c( 40.47332, 48.07092, 11.45576)

#Richiamo gli oggetti appena creati per verificare che tutto stia funzionando a dovere.
y2017
y2019
y2022

#Creo e costruisco un dataframe con al suo interno le classi e gli oggetti "y2017", "y2019", "y2022", con al loro interno le percentuali della classificazione calcolate in precedenza (ovvero i risultati ottenuti in "perc2017", per es.).
#I dati sono poi impiegati per creare tre grafici a barre per confrontare le distribuzioni delle classi nelle immagini a disposizione.  

DATAFRAME<-data.frame(class,y2017,y2019,y2022)
#All’interno del Dataframe viene inserito l'oggetto "class" (ovvero "soil", "forest", "grass"), e gli oggetti "y2017", "y2019", "y2022" con le percentuali delle classificazioni. 
DATAFRAME
#Richamo il dataframe per vedere i risultati riassunti nell’output.

anno2017<-ggplot(DATAFRAME,aes(x=class, y=y2017, fill=class))+ geom_bar(stat="identity", color="black") + ylim(c(0, 50)) + scale_fill_manual(values = c("forest" = "#77dd77", "grass" = "#59b7d8", "soil" = "#ffb347"))
anno2017
#Si crea un grafico a barre utilizzando “ggplot” (dal pacchetto di funzioni "ggplot2") per rappresentare la distribuzione delle percentuali nelle 3 classi ("forest", "grass", "soil").
#"aes()" si usa per specificare l'estetica del grafico, così si specifica che nell'asse x viene inserito l'oggetto "class" e in y l'oggetto "y2017".
#"fill=" specifica che il riempimento delle barre è dato dall'oggetto "class".
#"geom_bar()" specifica che tipo di grafico si usa, ovvero quello a barre.
#"color=black" indica che il bordo delle barre sono colorate con il nero.
#"ylim(c(0,50))" indica che la scala sull'asse y è impostata da 0 a 50. 
#"scale_fill_manual" mi permette di specificare a mano i colori di riempimento delle barre mediante "values=c", ovvero un vettore che associa ai valori contenuti in "class" i colori.
#I codici dei colori sono stati presi dal sito "tacolor.com".
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti. 
anno2019<-ggplot(DATAFRAME,aes(x=class, y=y2019, fill=class))+ geom_bar(stat="identity", color="black") + ylim(c(0, 50)) + scale_fill_manual(values = c("forest" = "#77dd77", "grass" = "#59b7d8", "soil" = "#ffb347")) 
anno2019
anno2022<-ggplot(DATAFRAME,aes(x=class, y=y2022, fill=class))+ geom_bar(stat="identity", color="black") + ylim(c(0, 50)) + scale_fill_manual(values = c("forest" = "#77dd77", "grass" = "#59b7d8", "soil" = "#ffb347"))
anno2022      
anno2017+anno2019+anno2022
#Comando che unisce i due grafici a barre creati in precedenza in una sola finestra e ci permette di avere una visione complessiva migliore.

###TIMES SERIES 

#Si va a visualizzare la differenza pixel per pixel fra le 2 immagini usando una palette di colori per evidenziare le variazioni tra le 2.
#Si osservano le differenze esistenti tra le immagini in termini di intensità dei pixel.
#Si ottengono visivamente i cambiamenti della zona d’interesse. 
#Calcolo la differenza tra le immagini della banda del Nir. 
diffnir1719<-VaiaCadore17[[4]] - VaiaCadore19[[4]]
diffnir1719
#Permette di calcolare la differenza pixel per pixel tra le due immagini andando a considerare solo il quarto elemento selezionato tramite "[[4]]" che in questo caso specifico rappresenta il nir. 
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti. 
diffnir1922<-VaiaCadore19[[4]] - VaiaCadore22[[4]]
diffnir1922
diffnir1722<-VaiaCadore17[[4]] - VaiaCadore22[[4]]
diffnir1722
clblu<-colorRampPalette(c("blue","white", "red")) (100)
#Creo una palette di colori che va dal blu al bianco al rosso con 100 gradazioni.
#Scelgo di usare 100 gradazioni per avere più fluidità nei passaggi da un colore all’altro.
#I pixel blu indicano una minore intensità nella prima immagine rispetto alla seconda, cioè una probabile diminuzione dell'intensità del nir e quindi una probabile riduzione della vegetazione.
#I pixel bianchi indicano invece una assenza di intensità.
#I pixel rossi indicano poi una maggiore intensità nella prima immagine rispetto alla seconda, ovvero un aumento dell'intensità del nir e quindi una crescita della vegetazione. I valori variano da +255 a -255 perchè la risoluzione radiometrica è di 8bit, quindi 255 possibilità. 
par(mfrow=c(3,1))
plot(diffnir1719, col=clblu)
#Visualizzo l'oggetto "diff1719" con la rampalette di colori "clblu" creata in precedenza.
#Vado quindi ad osservare la differenza tra le immagini del 2017 e del 2019.
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti. 
plot(diffnir1922, col=clblu) 
plot(diffnir1722, col=clblu) 
#Vado poi a creare una palette di colori visibili anche da persone affette da daltonismo, malattia che altera i colori.
cividis<-colorRampPalette(viridis::cividis(100))(100)
#Ho creato una palette di colori nominata "cividis" andando a generare 100 colori diversi dalla palette "cividis" che è una palette prefatta dal pacchetto "viridis".
#colorRampPalette è una funzione che premette la formazione di un gradiente di colore che in questo caso è di 100 sfumature.
par(mfrow=c(3,1))
#Faccio ancora una volta un par, sempre 1 colonna e 3 righe.
plot(diffnir1719, col=cividis)   
plot(diffnir1922, col=cividis)
plot(diffnir1722, col=cividis)

###CALCOLO dell’INDICE DI VARIABILITA': DVI E NDVI.

#Calcolo DVI: Indice di differenza di vegetazione. 
#Questo indice va a sfruttare l'alta capacità di riflettanza dell'infrarosso (nir) e l'alta capacità di assorbimento del rosso (red) per determinare, attraverso una differenza nir-red, la biomassa/densità di vegetazione presente.
#Si può anche determinare lo stato di salute della pianta in base all'accrescimento del rosso o infrarosso (NOTA: se aumenta da rosso a nir la pianta è sana).
#Si può usare anche la banda del blu per il calcolo in alternativa. 
#Il valore DVI varia da +255 a -255 perchè la risoluzione radiometrica è di 8bit, quindi 255 possibilità. 
dvi2017 = VaiaCadore17[[4]] - VaiaCadore17[[1]]
dvi2017

#Differenza tra le bande del vicino infrarosso nir [[4]] e del rosso red [[1]].
#I risultati del 2017 sono: min -207, max 221.
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti.
dvi2019=VaiaCadore19[[4]] - VaiaCadore19[[1]]
dvi2019
#I risultati del DVI del 2019 sono: min -206, max 228.
dvi2022=VaiaCadore22[[4]] - VaiaCadore22[[1]]
dvi2022
#I risultati del DVI del 2022 sono: min -209, max 237. 
clyellow<-colorRampPalette(c("darkblue", "yellow", "red", "black"))(100)   
#Crea una rampalette di colori che va dal blu scuro, al giallo, al rosso e al nero con 100 gradazioni.

par(mfrow=c(3,1))
#Faccio nuovamente un par in colonna             
plot(dvi2017, col=clyellow)
#Le immagini vengono visualizzate attraverso la funzione "plot()" e rappresentano l'indice di differenza di vegetazione per l'immagine del 2017, in questo caso.
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti.
plot(dvi2019, col=clyellow)  
plot(dvi2022, col=clyellow)    

#Visualizzazione dei grafici costruiti in precedenza con la palette di colori "cividis" creata poco fa per i soggetti daltonici.
par(mfrow=c(3,1))
#Faccio nuovamente un par in colonna             
plot(dvi2017, col=cividis)
#Visualizzazione attraverso la funzione "plot()" dell'oggetto "dvi2017" con la palette di colori "cividis".
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti.
plot(dvi2019, col=cividis)
plot(dvi2022, col=cividis)

#Calcolo NDVI: indice di differenza normalizzata delle vegetazioni impiegando i valori delle bande rosse e infrarosse delle immagini.
#Viene calcolata con la formula NDVI=(nir-red/nir+red) che mi permette di andare a confrontare i valori tra immagini che hanno una risoluzione radiometrica diversa (ad esempio una immagine a 8 bit con una a 16 bit).
#Il valore NDVI va da +1 a -1 perchè se il nir è massimo e red minimo, andando ad inserire nella formula otteniamo: 255-0/255+0=1 (valore massimo). Si ottiene -1 quando il nir è minimo. 
#Interpretazione dati relativi a NDVI: valori alti, vicini a +1= vegetazione densa e sana; valori vicini 0= vegetazione scarsa, neve/ghiaccio o suolo nudo; valori bassi vicini a -1= superfici non coperte da vegetazione o urbanizzate come costruzioni o strade. 

ndvi2017<-dvi2017/(VaiaCadore17[[4]]+VaiaCadore17[[1]])
ndvi2017
#"dvi2017" è il numeratore nir-red calcolato in precedenza; " VaiaCadore17[[4]]+VaiaCadore17[[1]]" rappresenta il denominatore, ovvero nir+red; ove le bande sono nir=4 e red=1.
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti.
ndvi2019<-dvi2019/(VaiaCadore19[[4]]+VaiaCadore19[[1]])
ndvi2019
ndvi2022<-dvi2022/(VaiaCadore22[[4]]+VaiaCadore22[[1]])   
ndvi2022

par(mfrow=c(3,1))
#Faccio nuovamente un par in colonna                             
plot(ndvi2017, col=clyellow)
#L'oggetto ndvi2018 viene visualizzato tramite la funzione "plot()" con la relativa palette di colori "clyellow".
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti.
plot(ndvi2019, col=clyellow)
plot(ndvi2022, col=clyellow)
#Visualizzazione dei grafici svolti in precedenza con la palette di colori "cividis" creata in precedenza per i soggetti daltonici.

par(mfrow=c(3,1))
#Faccio nuovamente un par in colonna                             
plot(ndvi2017, col=cividis)
#Visualizzazione attraverso la funzione "plot()" dell'oggetto "ndvi2017" con la palette di colori "cividis".
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti.
plot(ndvi2019, col=cividis)
plot(ndvi2022, col=cividis)

#Proseguo col calcolo delle differenze tra i vari anni presi in considerazione del NDVI per andare a determinare eventuali cambiamenti.
#Valori positivi stanno ad indicare una maggiore presenza di vegetazione nel primo anno inserito, valori negativi indicano quantitativi maggiori di vegetazione nel secondo anno inserito nella differenza. 
diffNDVI1719=ndvi2017 - ndvi2019
diffNDVI1719

diffNDVI1922=ndvi2019 - ndvi2022
diffNDVI1922

diffNDVI1722=ndvi2017 - ndvi2022
diffNDVI1722

par(mfrow=c(3,1))
#Faccio nuovamente un par in colonna                                               
plot(diffNDVI1719, col=clyellow)
#Le immagini si visualizzano tramite la funzione "plot()" con la relativa palette di colori "clyellow" precedentemente creata.        
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti.
plot(diffNDVI1922, col=clyellow)
plot(diffNDVI1722, col=clyellow)

#Vado a visualizzare i grafici fatti in precedenza con la palette di colori "cividis" creata in precedenza per i soggetti con daltonismo.
par(mfrow=c(3,1))
#Faccio nuovamente un par in colonna                                               
plot(diffNDVI1719, col=cividis)   
#Visualizzazione tramite la funzione "plot()" dell'oggetto "diffNDVI1719" con la palette di colori "cividis"
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti.
plot(diffNDVI1922, col=cividis)
plot(diffNDVI1722, col=cividis)

#ANALISI MULTIVARIATA 
#Analisi delle componenti principali (PCA) delle immagini.
#Non vado a scegliere la banda: viene svolta la PCA sull'intera immagine senza specificare una banda in particolare.
#E' una analisi delle componenti principali dell'immagine che ci consente di portare un sistema a più bande in una sola.
#Ci permette così di trasformare i dati presenti in un oggetto in un nuovo set di variabili chiamate “componenti principali” che spiegheranno la variabilità dei dati originali.  

pcimage17<-im.pca(VaiaCadore17)
pcimage17
#La funzione im.pca() ci fornisce i valori delle componenti principali, ovvero: 63.113702, 35.494496, 7.152123, 3.962982.
#I valori delle componenti principali sono:  63.113702, 35.494496, 7.152123, 3.962982.
pcimage19<-im.pca(VaiaCadore19)
pcimage19
#I valori delle componenti principali sono:  63.881631, 39.625920, 6.937409, 3.645387.
pcimage22<-im.pca(VaiaCadore22)
pcimage22
#I valori delle componenti principali sono: 65.461322, 38.640064, 6.430111, 3.706848.

tot17<-sum(63.113702, 35.494496, 7.152123, 3.962982)
tot17
#Sommatoria delle componenti principali per l'anno 2017; ovvero la sommatoria delle varianze spiegate dalle prime 4 componenti principali ottenute dalla PCA. 
var17x<-63.113702*100/tot17
#Calcolo della varianza spiegata dalle 3 componenti principali, in percentuale. 
var17y<-35.494496*100/tot17
var17z<-7.152123*100/tot17
var17k<-3.962982*100/tot17

var17x   #Variabilità spiegata dal primo asse: 57.52078. 
var17y   #Variabilità spiegata dal secondo asse: 32.3491.
var17z   #Variabilità spiegata dal terzo asse: 6.518326.
var17k   #Variabilità spiegata dal quarto asse: 3.611796.

tot19<-sum( 63.881631, 39.625920, 6.937409, 3.645387)
tot19
var19x<-63.881631*100/tot19
var19y<-39.625920*100/tot19
var19z<-6.937409*100/tot19
var19k<-3.645387*100/tot19

var19x   #Variabilità spiegata dal primo asse:  55.99214.
var19y   #Variabilità spiegata dal secondo asse: 34.73205.
var19z   #Variabilità spiegata dal terzo asse: 6.080627.
var19k   #Variabilità spiegata dal quarto asse: 3.195176.

tot22<-sum( 65.461322, 38.640064, 6.430111, 3.706848) 
tot22
var22x<-65.461322*100/tot22
var22y<-38.640064*100/tot22
var22z<-6.430111*100/tot22
var22k<-3.706848*100/tot22

var22x   #Variabilità spiegata dal primo asse: 57.30241.
var22y   #Variabilità spiegata dal secondo asse: 33.8241.
var22z   #Variabilità spiegata dal terzo asse: 5.62868.
var22k   #Variabilità spiegata dal quarto asse: 3.24484.

#Vado a visualizzare i grafici con la palette di colori "viridis".
viridis<-colorRampPalette(viridis(100))(100)
plot(pcimage17, col=viridis)
#Notiamo come PC3 indichi una bassa relazione.
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti.
plot(pcimage19, col=viridis)            
plot(pcimage22, col=viridis)

#Vado a visualizzare i grafici precedenti con la palette di colori "cividis" creata in precedenza per i soggetti affetti da daltonismo.
plot(pcimage17, col=cividis)
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti.
plot(pcimage19, col=cividis)            
plot(pcimage22, col=cividis)

#Si sceglie di procedere con l'analisi sulla prima componente (pc1) ottenuta in precedenza dalla funzione "im.pca()" poichè è la più rappresentativa, attraverso la funzione "focal()" che crea una finestra di calcolo che mi darà la mappa della variabilità dell'immagine. 
pca1_2017<-pcimage17[[1]]
pca1_2017
#Seleziono la prima componente (quella con la maggiore variabilità spiegata) ottenuta dalla funzione "im.pca()" dell'oggetto pcimage17, attraverso le parentesi quadre.
pca1_2019<-pcimage19[[1]]
pca1_2019
pca1_2022<-pcimage22[[1]]
pca1_2022

par(mfrow=c(3,1))
#Faccio nuovamente un par in colonna                                               
#Visualizzazione della prima componente ottenuta dalla PCA nei tre anni con la palette di colori "cividis". 
plot(pca1_2017, col=cividis)      
plot(pca1_2019, col=cividis)
plot(pca1_2022, col=cividis)

am17<-focal(pca1_2017,matrix(1/9,3,3),fun=sd)
am17
#Calcolo della deviazione standard attraverso la funzione "focal()" che consente di creare una finestra di calcolo la cui dimensione/composizione è definita da "matrix()"; nello specifico 1/9 indica che la finestra è grande 9 quadretti disposi 3x3. "fun()" indica la funzione e "sd" indica la deviazione standard. 
am19<-focal(pca1_2019,matrix(1/9,3,3),fun=sd)
am19
am22<-focal(pca1_2022,matrix(1/9,3,3),fun=sd)
am22

par(mfrow=c(3,1))
#Faccio nuovamente un par in colonna                                                     
plot(am17, col=clyellow)
#Visualizzazione delle deviazioni standard, e quindi della variabilità, delle immagini con la palette di colori "clyellow".
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti.
plot(am19, col=clyellow)
#Valori vicino allo 0 indicano bassa variabilità; valori prossimi a 25 indicano alta variabilità. 
plot(am22, col=clyellow)

par(mfrow=c(3,1))
#Faccio nuovamente un par in colonna                                                     
plot(am17, col=cividis)
#Visualizzazione delle deviazioni standard delle immagini con la palette di colori "cividis".                                   
#Procedo con la stessa operazione appena fatta per gli anni successivi rimasti.
plot(am19, col=cividis)
plot(am22, col=cividis)

#FINE
