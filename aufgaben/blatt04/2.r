#Blatt 4

#2.1
#H1: after_treatment != before_treatment
#H0: after_treatment = before_treatment

#2.2 Runterladen

#2.3
haare = read.table(file="[024]hair.txt", sep="t", dec=".", header=TRUE)

#2.4
boxplot(haare$length_difference ~ haare$type, data = haare, main = "haaaare" )

#2.5
#Die Normalverteilung ist gegeben, ebenso wie die Varianzhomogenitaet.
#Durch die Abhaengigkeit der Daten kann man zB einen t-Test durchfuehren, bei dem man die Daten als abhaengig angibt
t.test(formula=length_difference~type, data=haare, var.equal=TRUE, alternative="two.sided", conf.level=0.95, paired = TRUE)
#p-value = 0.6234
#Da der Wert des p-Value groesser als 5% ist, muss man die Nullhypothese annehmen, also dass es vor und nach der Behandlung keinen Unterschied gibt. 
