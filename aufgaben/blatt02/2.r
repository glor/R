#2.1
sorte = c(rep(1,15), rep(2,12), rep(3, 20))
gewicht = c(6.22,5.75,6.4,4.6,3.25,4.5,4.8,5.88,5.8,6.1,5.58,6.01,5.62,6.72,8.55,4.28,7.7,6.4,7.77,7.37,4.2,7.05,6.45,8.93,5.9,5.94,6.39, 7.13,8.78,6.06,7.93,9.1,8,7.55,8.32,8.8,12.63,8.19,6.5,6.84,7.02,9.39,7.38,7.39,6.99,8.27,6.7)
tabelle = data.frame(Sorte = sorte, Gewicht = gewicht)

#2.2
sorte1 = subset(tabelle, tabelle$Sorte==1)
hist(sorte1$Gewicht)
dev.print(pdf, "./sorte1.pdf")
sorte2 = subset(tabelle, tabelle$Sorte==2)
hist(sorte2$Gewicht)
dev.print(pdf, "./sorte2.pdf")
sorte3 = subset(tabelle, tabelle$Sorte==3)
hist(sorte3$Gewicht)
dev.print(pdf, "./sorte3.pdf")
hist(sorte3$Gewicht, breaks=c(6, 10, 13)) #breaks legt die Bereiche der Balken fest

#2.3
boxplot(Gewicht ~ Sorte, data = tabelle, main = "Futtersorten", ylab = "Gewicht", xlab = "Sorte")
dev.print(pdf, "./futtersorten.pdf")


#2.4
boxplot(Gewicht ~ Sorte, data = tabelle, main = "Futtersorten", col=c("blue", "yellow","red"), ylab = "Gewicht", xlab = "Sorte")

#2.5
# Histogramme geben nur die Häufigkeiten in Bereichen wieder, ein Boxplot liefert aus der Verteilung extrahierte Daten, also min, max, ggf. Ausreißer, 25% und 75% quantil (box), median (strich in der mitte)
# eine Normalverteilung liefert immer eine relativ symmetrische Verteilung, also liegt die Vermutung nahe, wenn man eine symmetrische Box hat.


