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
