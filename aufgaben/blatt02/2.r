#Blatt 2

#2.1
sorte = c(rep(1,15), rep(2,12), rep(3, 20))
gewicht = c(6.22,5.75,6.4,4.6,3.25,4.5,4.8,5.88,5.8,6.1,5.58,6.01,5.62,6.72,8.55,4.28,7.7,6.4,7.77,7.37,4.2,7.05,6.45,8.93,5.9,5.94,6.39, 7.13,8.78,6.06,7.93,9.1,8,7.55,8.32,8.8,12.63,8.19,6.5,6.84,7.02,9.39,7.38,7.39,6.99,8.27,6.7)
tabelle = data.frame(Sorte = sorte, Gewicht = gewicht)

#2.2
sorte1 = subset(tabelle, tabelle$Sorte==1)
sorte2 = subset(tabelle, tabelle$Sorte==2)
sorte3 = subset(tabelle, tabelle$Sorte==3)
hist(sorte1$Gewicht) #Fenster geoeffnet lassen
dev.print(pdf, "./sorte1.pdf")
hist(sorte2$Gewicht)
dev.print(pdf, "./sorte2.pdf")
hist(sorte3$Gewicht)
dev.print(pdf, "./sorte3.pdf")
#breaks in hist() kann man zB modifizieren, wenn man die Anzahl der Saeulen modifizieren moechte

#2.3
boxplot(Gewicht ~ Sorte, data = tabelle, main = "Futtersorten", ylab = "Gewicht", xlab = "Sorte")
dev.print(pdf, "./futtersorten.pdf")


#2.4
boxplot(Gewicht ~ Sorte, data = tabelle, main = "Futtersorten", col=c("red", "yellow","green"), ylab = "Gewicht", xlab = "Sorte")

#2.5
#Boxplot stellt insbesondere die Verteilung der 0, 25, 50, 75 und 100% Quantile dar und nicht wie Histogramme
# die Verteilung der gesamten Haeufigkeiten. Ausserdem wird der Median durch den Strich durch die Box dargestellt.
# Bei Normalverteilung hat man relativ symmetrische Boxen.
