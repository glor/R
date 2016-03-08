#Blatt 3

#1.1 Datei lokal speichern

#1.2
maeuse = read.table(file="mice.txt", sep="t", dec=".", header=TRUE)

#1.3
boxplot(maeuse$speed ~ maeuse$health, date = maeuse, main = "kranke Maeuse" )
# Beide Gruppen sind normalverteilt, es gibt keine Aussreisser. (diese wuerden als Punkte ausserhalb der Boxen dargestellt)
# Normalverteilung heisst, dass die Quantile oben und unten vom Median ungefaehr die gleiche Laenge haben, dies ist also der Fall.
# Die Varianz der kranken Maeusegruppe ist hoeher als die der gesunden, was man an der Hoehe der Boxen sehen kann. Allerdings haelt sich dies im Rahmen, sodass man sagen kann, dass Varianzhomogenitaet vorliegt.

#1.4
#Geeignetes Hypothesenpaar:

# H1: Die gesunden Mauese waren schneller.
# H0: Die gesunden Mauese waren gleich schnell oder langsamer.

(#Nullhypothese: Die gesunde Gruppe ist schneller oder gleich schnell wie die kranke. H0: healthy >= sick
#Alternativhypothese: Die gesunde Gruppe ist langsamer als die gesunde. H1: healthy < sick)


#1.5
#Vorraussetzungen t-Test: Varianzhomogenitaet, Normalverteilung, Unabhaengigkeit
# keine Var.homogen. --> t-Welch
# Varianzunabh. und Normalverteilung s.o.
# Unabhaengigkeit der Daten ist ausserdem auch gegeben.
#t-Welch wird bei Invarianz durchgefuehrt, der klassische t-Test bei Varianzhomogenitaet

#1.6
t.test(formula=speed~health, data=maeuse, var.equal=TRUE, alternative="less", conf.level=0.95)
#p-Wert:# p-Wert von 2.376e-05 kleiner als 0.05, d.h. es gibt einen signifikanten Unterschied —> Nullhypothese kann abgelehnt werden, die kranken Mäuse brauchen länger
#Konfidenzintervalle # 95% Intervall —> in 95% der so ermittelten Fälle ist Unterschied zwischen den Populationen erkennbar
