#Blatt 8

#2
step = read.table(file="[013]stepping.txt", dec=".", sep="t", header = TRUE )

#Varianzhomogenitaet
model = lm(formula=HR ~ RestHR + Block + Height + Frequency + (Height:Frequecy), data = step)
fitted.value=fitted(model)
resid.value=resid(model)
plot(fitted.value, resid.value)
abline(h=0)
# keine Regelmaessigkeiten erkennbar => varianzhomogen

boxplot(resid.value)
#Ausreisser: dennoch weiter machen, auch wenn nicht normalverteilt

#Hypothesen aufstellen:
#A Schritthoehe
#B: Schrittfrequenz
#C: RuheHR
#H0A: (height=1) = (height=0)
#H1A:(height=1) != (height=0)
#H0B.1: (Frequency = 0) = (Frequency = 1)
#H0B.2: (Frequency = 2) = (Frequency = 1)
#H0B.3: (Frequency = 0) = (Frequency = 2)
#H1B.1: (Frequency = 0) = (Frequency = 1)
#H1B.2: (Frequency = 0) = (Frequency = 2)
#H1B.3: (Frequency = 2) = (Frequency = 1)
#H0C: RestHR aehnlich (Unterschied <= +/- 5)
#H1C: RestHR sehr unterschiedlich (Unterschied > +/- 5)
#H0W: keine Wechselwirkungen
#H1W: Wechselwirkungen

anova(model)
#Signifikante p-Werte (und hohe F-Werte): RestHR: 3.311e-05
# Height: 0.0007625
# Frequency: 1.297e-05
#Also korrelieren diese Werte mit dem HR. Die restlichen nicht. 



cm = lm(formula=response~treatment.A+treatment.B+ treatment.A:treatment.B, data + cherry)
fitted.value=fitted(cm)
resid.value=resid(cm)
plot(fitted.value, resid.value)
abline(h=0)
boxplot(resid.value)
#lev = data.frame(res=resid.value, group=rep(c("low.light.c", "low.light.s","mod.light.c","mod.light.s") #falls daten 
nicht richtig in tabelle
leveneTest(lev$res, lev$group) #p nicht signifikant => Varianzhomogen

#Thesen aufstellen
#A: Stress
#B: Licht
H0A: Stress = control
H0B: licht = dunkel
H0C: keine Wechselwirkung
H1A: stress !+ control
H1B: licht !+ dunkel
H1C: Wechselwirkung

anova(model)
# F-Wert: Einfluss des Faktors
# P-Wert:
