#Blatt 7

#1.1
#Anzahl Prediktorstufen: plot: 4
#Zahl Wiederholungen: plot: jeweils 3
sulphur = read.table(file="[036]sulphur.txt",  dec=".", sep="\t", header = TRUE)
plot(sulphur$concentration, sulphur$scab)

#Varianzhomogenitaet mit LeveneTest
model = lm(formula=scab~concentration, data=sulphur)
abline(reg=model)
fitted.values=fitted(object=model)
resid.values=resid(object=model)
plot(x=fitted.values, y=resid.values)
abline(h=0)
#Hier sind keine Muster erkennbar, also kann man von Varianzhomogenitaet ausgehen

#H0: homogen
#H1: nicht homogen
leveneTest(y=resid.values, group=sulphur$concentration)
#0.6967 ist groesser als 0.05, also ist der Wert nicht signifikant. Dadurch muss die Nullhypothese angenommen werden

#Normalverteilung
boxplot(resid.values)
#Zeigt keine Ausreisser, also normalverteilt

#=> Regressionsanalyse moeglich


#1.2
summary(model)
# Steigung: -0.01314
# y-Achsenabschnitt: 20.90000
# f(x) = -0.01314x + 20.9
# Bei Konfidenzniveau von 95% signifikant? p-Wert betraegt 0.002369 < 0.05, also ist der p-Wert siginifikant.
#Normalverteilung s. 1.1

#1.3
pp = predict.lm(object=model, interval = "prediction", data=sulphur$concentration, level = 0.95)
pc = predict.lm(object=model, interval = "confidence", data=sulphur$scab, level = 0.95)
plot(x = sulphur$concentration, y = sulphur$scab, main = "sulphur")
matlines(x=sulphur$concentration, y = pp, col = "red")
matlines(x= sulphur$concentration, y = pc, col = "green")

Vorgehen:
1. Anzahl Prediktorstufen, Wiederholungen
2. Lineares Modell erstellen
3. fitted und resid values
4. VH der Residuen (leveneTest, scatterplot)
5. NV (Boxplot)
6. lineares Modell signifikant ansehen
7. konfident & Vorhersagebaender zeichnen

#7.3
temperatures = read.table(file="US_temperatures.txt", sep = "\t", dec = ".", header = TRUE)
plot(temperatures)
# initiale Beobachtung (rein optisch): Latitude und JanTemp scheinen stark zu korrelieren

# Regressionsmodell: y = a*x1 + b*x2 +c
# wobei JanTemp = Latitude*x1 + Longitude*x2 +c
temperaturesmodel <- lm(JanTemp ~ Lat + Long, data = temperatures)
summary (temperaturesmodel)
# Beide Faktoren sind signifikant (bei beiden ist p < 0.05)
# —> JanTemp = 0.133*Long + -2.163*Lat + 98.645

# Prüfen der Multi-Kollinearität
# Dass Lat und Long korrelieren, wäre nicht sinnvoll (da es nur etwas über die Aussage der Städtewahl etwas sagen würde). Kann man auch so zeigen:
cor.test(formula= ~Lat + Long, data = temperatures, method = "spearman", alternative= "two.sided”)
# —> keine Mulitkollinearität gegeben
