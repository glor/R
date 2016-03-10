#Blatt 8

cm = lm(formula = response ~ treatment, data = cherry)
fitted.value=fitted(cm)
resid.value=resid(cm)
plot(fitted.value, resid.value)
abline(h=0)
#Daten sind geordnet, als waeren sie entlang der h-Line sortiert => nicht varianzhomogen

#Levene:
leveneTest(cherry$response, cherry$treatment)
# p-Wert: 0.0002376 < 0.05, also signifikant => nicht varianzhomogen
# => keine weitere Untersuchung noetig/moeglich 
