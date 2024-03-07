#First R script
a <- 6*7
b <- 5*8
a+b
# R as a calculator
#arrays
flowers <-c(3,6,8,10,15,18)
flowers

insects <-c(10,16,25,42,61,73)
insects
plot(flowers, insects)
#changin plot parameters
#symbols
plot(flowers, insects, pch=19)

#symbols dimensions

plot(flowers, insects, pch=19, cex=2)

#color

plot(flowers, insects, pch=19, cex=2, col="chocolate1")
