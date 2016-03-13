### Allgemeines
#### data access
vek[vek<0]
mat[ ,1]
mat[1, ]
#### subset
subset(x = data vector, subset = logical expression, )
e.g. subset(potato, Sorte==1|Sorte==3)
#### rep
rep(x = data, times = numeric value)
#### seq
seq.int(from, to, by, ) // length.out
#### matrix
// sigle type for whole matrix
matrix(x = data, ncol, nrow, byrow=FALSE)
#### data.frame
data.frame(... = spalten, row.names=NULL)
    row.names: NULL | string = column to be used as row names | vector of names
#### read.table
   read.table("filename", header = FALSE, sep = '')
#### write.table
write.table(potato, "filename", sep = '\t', dec = ".")
#### levels, relevel
melon$variety=relevel(melon$variety, ref="B")
für Multiple Mittelwertskotze
#### ordered, reorder
BRASSICA$group <- ordered(BRASSICA$group, c("control", "ancy"))
#### naming col/row
colnames(x)
colnames(x) <- c(names)
#### convert to/from flatfiles
| Feld: | 1 | 2 | 3 | 4 |
| Sorte |   |   |   |   |
|     1 |   |   |   |   |
|     2 |   |   |   |   |
|     3 |   |   |   |   |
|     4 |   |   |   |   |
|     5 |   |   |   |   |
|       |   |   |   |   |
Ertrag = c(580, 560, 545, 525, 540, 535, 545, 525, 515, 505, 465, 460, 455, 455, 425, 465, 460, 455, 465, 415)
Feld = c(rep(1,5), rep(2,5), rep(3,5), rep(4,5))
Sorte = rep(1:5, 4)
potato = data.frame(Feld, Sorte, Ertrag)
potato 
#### cd/pwd
setwd(getwd())
### Deskriptive Statistik
#### Mittelwert
mean(datenfeld x)
#### Standardabweichung
sd(zahlenfeld x)
#### Varianz
var(x)
#### Min,Max,Median, Quantile
min(numeric objects)
max(numeric objects)
median(...)
quantile(x=numeric vector, p=propability vector) // p == probs == wahrscheinlichkeiten. 0.25 fürs erste und 0.75 fürs 4. quartil
example: quantile(1:10, p=c(0.25,0.75))
#### tapply
tapply(Vek X, INDEX = index zum gruppieren, FUN = NULL)
tapply(potato$Ertrag, INDEX=potato$Sorte, FUN=min)
#### summary
summary(object)

### Grafiken in R
#### formula
   values y ~ grouping factor
#### hist
   hist(x=value vector, breaks=c(bereiche der balken))
#### boxplot
boxplot(formula, data = NULL)
#### barplot
barplot(vec)
#### scatterplot
plot(x, y)
#### plot
plot(x = 2d data)
plot(x, y)
#### fancy graphics
arguments:
- main="titel"
- col = c(colorstrings)
- ylab = "Achsenbeschriftung"
- xlab = "Achsenbeschriftung"
#### export graphics
nach dem öffnen einer grafik:
dev.print(pdf, "filename.pdf")
siehe skript
### Zweistichprobentests
| Test         | VH | NV |
|--------------+----+----|
| t-test       | x  | x  |
| t-Welch-test |    | x  |
| Wilcoxon     | x  |    |

Der t-Test ist der Hypothesentest der t-Verteilung.
Er kann verwendet werden, um zu bestimmen, ob zwei Stichproben sich statistisch signifikant unterscheiden. Meistens wird der t-Test dort eingesetzt, wo die Testgröße normalverteilt wäre, wenn der Skalierungsparameter (der Parameter, der die Streuung definiert — bei einer normalverteilten Zufallsvariable die Standardabweichung) bekannt wäre.
Ist der Skalierungsparameter unbekannt, wird er durch eine Schätzung aus dem Datensatz ersetzt.

Hypothesen:
3 Möglichkeiten
greater
H0: x <= y
H1: x >  y
less
H0: x >= y
H1: x <  y
two.sided
H0: x == y
H1: x != y

#### t-test
Vorrausetzungen: VH, NV
!!! var.equal=TRUE für den normalen t-test
t.test(x, y=NULL, alternative = c("less", "greater", "two.sided"), paired=FALSE, var.equal=FALSE, conf.level=0.95)
wenn p-value > 0.05, dann Nullhypothese
#### t-welch-test
Vorrausetzungen: NV
wie t.test, nur mit var.equal=FALSE
t.test(x, y=NULL, alternative = c("less", "greater", "two.sided"), paired=FALSE, var.equal=FALSE, conf.level=0.95)
#### TODO wilcoxon-test
Vorrausetzungen: VH
wilcox.test(x, y = NULL, alternative = c("two.sided", "less", "greater"), paired = FALSE, exact = NULL, correct=FALSE, conf.level = 0.95)
wilcox.test(formula=content~type, data=hefe,alternative="less",conf.level=0.95,dist="exact")
TODO: exact, dist, correct
// what the hell ist dist="exact"
#### paired tests
Wenn zwei Messungen ‘verbunden’ (= ‘gepaart’) sind (z.B. ein Patient vor und nach einer Behandlung) nimmt man den gepaarten Test.
### chi-quadrat-test
nur auf quantitativen daten
#### Anpassungstest
überprüfen, ob daten einer bestimmten (gegebenen) verteilung folgen
H0 : F_Versuch (x) = F_Mendel (x)
H1 : F_Versuch (x) != F_Mendel (x)
chisq.test(c(60,16,20,4), c(9,3,3,1))
correct = TRUE, wenn Fallzahl <20
#### Homogenitätstest
Testen ob zwei Datensätze der selben Verteilung folgen

H0 : πtreated. (x) == πcontrol (x)
H1 : πtreated. (x) != πcontrol (x)
chisq.test(matrix(c(12,9,14,7), ncol=2), correct = FALSE)

// X-squared = 0.4038, df = 1, p-value = 0.5251
// Je nachdem, von welchem alpha-Fehler man ausgeht, ist p signifikant oder nicht. Nimmt man alpha = 5% = 0,05 an, so ist p nicht signifikant und somit wird die Nullhypothese angenommen.
### Korrelationsanalyse
prüft, ob zwischen datensätzen eine korelation vorliegt.
H0: rho =  0 // rho sieht aus wie ein p und ist der korelationskoeff
H1: rho != 0
#### Korelationskoeffizient
Der Korelationskoeffizient gibt an, wie stark daten miteinander korelieren, also z.B. wie stark die steuung des linearen zusammenhangs ist.
cor(x, y=NULL, method = "spearman"|"pearson")
#### analyse
cor.test(formula = ~Rumpf+Widerrist, data = cattle, method = "spearman", alternative = "greater”)
//Da p-Wert kleiner als 0.1, ist Korrelation signifikant.
//Korrelationswert von 0.58 bedeutet mäßig starke Korrelation zwischen Rumpfhöhe und Widerrist.
#### Pearson
   wenn alle Datensätze NV ist
#### Spearman
   wenn einer der Datensätze nicht NV ist
### Residuen
Rediduen sind die Abweichungen vom Modell (also etwa einer linearen Regression)
Lassen sie ein Muster erkennen, so ist vermutlich das Modell nicht geeignet. Wir müssen dann VarianzINhomogenität annehmen.
http://www.statistics4u.info/fundstat_germ/img/hl_residuals.png
### Regressionsanalyse
Vorraussetzungen:
1. Prediktorstufen >= 2
2. Wiederholungen pro Stufe >= 3
3. Normalverteilung der Residuen
4. Varianzhomogenität der Residuen

x   .. datenspalte
grp .. grouping factor
data = data.frame(x,grp)

Vorgehen:
1. Anzahl Prediktorstufen, Wiederholungen
   - plot(x,grp)
2. Lineares Modell erstellen
   - model = lm(formula=x~grp) // data=X
   - abline(reg=model)
3. fitted und resid values
   - fitted.values=fitted(object=model)
   - resid.values=resid(object=model)
4. VH der Residuen (leveneTest, scatterplot)
   1. Scatterplot:
      - plot(x=fitted.values, y=resid.values)
      - abline(h=0)
	Muster erkennbar => NICHT VH
   2. Levene-Test
      - leveneTest(y=resid.values, group=grp)
5. NV der Residuen (Boxplot)
   - boxplot(resid.values)
6. lineares Modell signifikant
   - summary(model)
   // Steigung: -0.01314
   // y-Achsenabschnitt: 20.90000
   // f(x) = -0.01314x + 20.9
   // Bei Konfidenzniveau von 95% signifikant? p-Werte < 0.05 ? Also ist die Regression signifikant : nicht
7. konfident & Vorhersagebaender zeichnen
   pp = predict.lm(object=model, interval="prediction", data=x, level=0.95)
   pc = predict.lm(object=model, interval="confidence", data=x, level=0.95)
   plot(x~grp) // data
   matlines(x = x, y=pp, col="red") //rot = vorhersageband
   matlines(x = x, y=pc, col="green") //grün = konfidenzband

### Anova Varianzanalyse
Vorraussetzungen:
1. VH der resid
2. NV (nicht besonders empfindlich) der resid
3. unabhängige daten
hypothesen siehe skript.
Ablauf:
1. Model erstellen
   model = lm(formula=HR ~ RestHR + Block + Height + Frequency + (Height:Frequecy), data = step)
   fitted.value=fitted(model)
   resid.value=resid(model)
2. VH testen
   plot(fitted.value, resid.value)
   abline(h=0)
3. ggf. LeveneTest
4. NV prüfen
5. Hypothesen
6. anova(model)
// F-Werte: Einflüsse der Faktoren
### Multiple Mittelwerttests
Vorraussetzung:
- NV
- VH
- Unabhängigkeit
Ablauf:
1. Hypothesen:
   H0: µa = µb = µc
   H1: µa != µb || µa != µc ||µb != µc
2. NV und VH zeigen
3. model = lm(formula=HR ~ RestHR + Block + Height + Frequency + (Height:Frequecy), data = step)
4. a
   library(mvtnorm)
   library(multcomp)
   mcmp = ghlt(model, linfct=mcp(datenspalte="Tukey|Dunnet"), alternative)
   summary(mcmp, test=adjusted(type="bonferroni"))
   // estimate=mittelwertsunterschiede
   // p-values<5% und sternchen fur besonders signifikant
5. Konfidenzintervalle anzeigen
   melon.int=confint(mcmp)
   plot(melon.int)
   gucken, ob ein Unterschied zu einer bestimmte gruppe vorliegt - ggf. mit Dunnet wiederholen:

levels(melon$variety)
melon$variety=relevel(melon$variety, ref="B")
melon.model=lm(yield~variety, data=melon)
mcmp=glht(melon.model, linfct=mcp(variety="Dunnet"), alternative="less")	//less heisst hier groesser
summary(mcmp, test=adjusted(type="bonferroni"))
plot(confint(mcmp))

#### Tukey
alle gegen alle - immer two.sided
#### Dunnet
alle gegen einen
#### p-value-Korrektur
##### Bonferroni
ergebnis der summe aller werte
##### Bonferroni-Holm
summe vom ergebnis aller werte
### Varianzhomogenität
#### boxplot
   wenn die kästen gleich groß sind, dann liegt Varianzhomogenität vor
#### levene-test
muss durchfallen!
//H0: homogen
//H1: nicht homogen
library(car)
leveneTest(y=resid.values, group=grp)
p-value < 5% => SIGNIFIKANT => Alternativhypothese, NICHT Varianzhomogen
### Normalverteilung
#### testen
   boxplot symmetrisch => NV
   keine Ausreißer
### Freiheitsgrade
in R (ihm) oft mit df angegeben.

f = n - u
n .. Anzahl der Daten
u .. Schätzbare Parameter

Also wenn man etwa nur den Mittelwert (u=1) und n=10 Werte hat, dann ist der Freiheitsgrad f = 9, weil man mithilfe von 9 Werten und dem Mittelwert den 10. Berechnen kann.
Die Freiheitsgrade werden bei der Schätzung von Varianzen benötigt. (und spielen bei manchem Hypothesentests eine Rolle)

