#Anpassungstest, da untersucht wird, ob die tatsaechliche Anzahl mit der vermuteten, theoretischen Anzahl der Erbsen uebereinstimmt.

#1.2
#H0: Die Anzahl der Erbsen stimmt mit dem von Mendel aufgestellten Zahlenverhaeltnissen ueberein.
#H1: Die Anzahl stimmt nicht ueberein.

#1.3
chisq.test(c(60,16,20,4), c(9,3,3,1))

#1.4
# data:  c(60, 16, 20, 4) and c(9, 3, 3, 1)
# X-squared = 8, df = 6, p-value = 0.2381
# Als alpha-Wert war 0.1 angegeben. Da p = 0.2381, was groesser ist als der Alpha-Fehler, ist p nicht signifikant, also wird die Nullhypothese angenommen.
# Also sind die Zahlenverhaeltnisse passend zu Mendels Annahme
