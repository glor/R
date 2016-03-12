#6.1
# Unabhängigkeit der Observation gegeben
#Prüfen der Normalerverteilung mit Boxplot:
boxplot(cattle$Widerrist, cattle$Rumpf)
# —> Widerrist ist nicht normalerveteilt —> Spearman
cor(cattle, use = "all.obs", method = "spearman”)

#6.2
#Da hier bereits gerichtete Hypothesen sinnvoll sind:
# H0: Die Korrelation ist nicht signifikant größer als 0.
# H1: Die Korrelation ist signifikant größer als 0.
cor.test(formula = ~Rumpf+Widerrist, data = cattle, method = "spearman", alternative = "greater”)

#6.3
#Da p-Wert kleiner als 0.1, ist Korrelation signifikant.
#Korrelationswert von 0.58 bedeutet mäßig starke Korrelation zwischen Rumpfhöhe und Widerrist.

#6.4
plot (x= cattle$Rumpf, cattle$Widerrist, xlab = "Rumpf", ylab = "Widerrist")
