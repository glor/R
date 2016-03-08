tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=min) # minimum
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=max) # maximum
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=median) # median
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=mean) # mean
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=sd) # standardabweichung
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=var) # varianz
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=quantile, probs = c(0.75)) # oberes quartil
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=quantile, probs = c(0.25)) # unteres quartil
6.22 5.75 6.40 4.60 3.25 4.50 4.80 5.88 5.80 6.10 5.58 6.01 5.62 6.72 8.55
4.28 7.70 6.40 7.77 7.37 4.20 7.05 6.45 8.93 5.90 5.94 6.39
7.13 8.78 6.06 7.93 9.10 8.00 7.55 8.32 8.80 12.63 8.19 6.50 6.84 7.02 9.39 7.38 7.39 6.99 8.27 6.70
#1.2
summary(myFrame) #gibt fuer jede Ueberschrift der FlatFile das Minimum, den Median,
# den Mittelwert, das Maximum und das 1. und 3. Quartil 
