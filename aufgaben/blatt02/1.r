#1.1
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=min) # minimum
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=max) # maximum
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=median) # median
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=mean) # mean
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=sd) # standardabweichung
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=var) # varianz
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=quantile, probs = c(0.75)) # oberes quartil
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=quantile, probs = c(0.25)) # unteres quartil

#1.2
summary(potato) #gives min, max, mean, median, 1st and 3rd quantil for every column
