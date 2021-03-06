#Blatt 4

#1.1 Runterladen

#1.2
hefe = read.table(file="yeast.txt", sep="\t", dec=".", header=TRUE)

#1.3
boxplot(hefe$content ~ hefe$type, data = hefe, main = "hefe" )
#Keine Normalverteilung, da es in jedem Typ einen Ausreisser gibt
#Varianzhomogenitaet, da die Unterschiede zwischen den beiden Boxen noch im Rahmen sind
#Wilcoxon-Test: braucht keine Normalverteilung, nur Varianzhomogenitaet und unabhaengige Daten (hier wurden verschiedene Kulturen untersucht, dadurch gegeben)

#1.4
#H1: mutant > control
#H0: mutant <= control

#1.5
wilcox.test(formula=content~type, data=hefe,alternative="less",conf.level=0.95,dist="exact")
#p-value = 0.0004667
#Da der p-Wert kleiner als 5% ist, kann die Alternativhypothese angenommen werden, also dass die mutierten Hefen tatsaechlich mehr von der Fettsaeure produzieren.
