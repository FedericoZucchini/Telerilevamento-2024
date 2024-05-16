# Come chiamare R Markdown. Es.: Vignette
# Usiamo HTML perchè è meglio

# My first Markdown file!

This file contains functions for R scripting in Geo-Ecological Remote Sensing.

We are going to make use of the following packages:

```{r}
library(terra)
library(imageRy)
library(viridis)
```

In order to visualize the list of data use:

```{r}
im.list()
```

In order to import data we can use the following function:

```{r, eval = T}
Mato <- im.import("matogrosso_15_1992219_lrg.jpg")
```
This plot is related to the following bands:
+ band 1 = NIR
+ band 2 = Red
+ band 3 = Green

We are using a set from Mato Grosso, and we anplot it in a RGB space, as:

```{r, eval = T}
im.plotRGB(Mato, 1, 2, 3)
```

In order to look at different band combination altogether we can use;
```{r, eval = T}
par(mfrow = c(1,3))
im.plotRGB(mato, 1,2,3)
im.plotRGB(mato, 2,1,3)
im.plotRGB(mato, 3,2,1)

## Calculating spectral indicies
```{r, eval = T}
dvi <- mato[[1]]-mato[[2]]
plot(dvi, col = viridis(100))
```

Calculating spatial variability:
```{r, eval = T}
sd5 <- focal(mato[[1]]), matrix(1/25,5,5), fun=sd)
plot(sd5, col=magma(100))
```






```
