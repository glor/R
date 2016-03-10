#9.1.1 Nein, es ist keine Korrektur erforderlich.
#9.1.2 Bei einer initialen Vermutung (die neue Polymerase ist besser/schlechter), bräuchte ich nur zwei Vergleiche durchführen (mit geplanten Kontrasten). (Alt-Polymerase gegen Neu-Polymerasen in Gruppe, dann die Neu-Polymerasen gegeneinander). Bei keiner Vermutung muss ich alle mit allen vergleichen, das heißt, ich brauche 3 Vergleiche. Da bei mehr als einem Vergleich p-Werte korrigiert werden sollten (da es sonst zu einer Alpha-Fehler-Kumulation kommt), sollten die p-Werte korrigiert werden.
#9.1.3 Man braucht die Summe von 1+2+ … + n-1, in diesem Fall also 10 Vergleiche, das heißt, p-Werte sollte korrigiert werden!
#9.1.4 Die Wahrscheinlichkeit, dass kein Test signifikant wird: (0.95)^10 = 0.6 (unabhängig von den Daten, also auch, wenn es keine Unterschiede gäbe). Der Erwartungswert ist (0.95*0+0.05*1)*10 = 0.5 Test sollten signifikant werden.

#9.2
#HYPOTHESEN
# H0: Die Mittelwerte sind bei allen Gruppen gleich.
# H1: Es gibt mindestens einen Unterschied in den Mittelwerten zwischen den Behandlungen.

#VORAUSSETZUNG
#Daten sind für MCP geeignet: Normalverteilung (s.u., Boxplot), Unabhängigkeit der Daten (Bodenproben sind unterschiedliche Bedingungen, keine Bindung), Varianzhomogenität (s.u.)

boxplot(formula= moisture~treatment, data= soil, main = "Soil")
# Daten sind normalverteilt (ungefähr, Gruppe D etwas verschoben).

soilmodel <-lm(formula = moisture ~ treatment, data = soil)

resid.values <- resid(object = soilmodel)

library(car)

leveneTest(y=resid.values, group = soil$treatment)

# da Levene-Test nicht signifikant, kann die Varianzhomogenität der Gruppen nicht abgelehnt werden

# TEST
#Anwendung von Tukey (Dunnet wäre für Vergleich ggü. einer Kontrollgruppe geeignet).

library(mvtnorm)
library(multcomp)
soil.model <- aov(moisture ~ treatment, data = soil)
mcmp <- glht(soil.model, linfct = mcp(treatment = "Tukey"), alternative = "two.sided")
summary(mcmp)


#Konfidenzintervalle
soil.int <- confint(mcmp)
soil.int

#INTERPRETATION
# Die Gruppen A und B sowie B und D sind signifikant unterschiedlich voneinander (p<0.01).
