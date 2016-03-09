#2.1
#Homogenitaetstest, da untersucht wird, ob sich die normalen und die entarteten Zellkulturen bzgl der Exprimierung von p53 unterscheiden.

#2.2
#H0: Die Zellkulturen unterscheiden sich nicht.
#H1: Die Zellkulturen unterscheiden sich.

#2.3
chisq.test(matrix(c(12,9,14,7), ncol=2), correct = FALSE)

#2.4
#X-squared = 0.4038, df = 1, p-value = 0.5251
# Je nachdem, von welchem alpha-Fehler man ausgeht, ist p signifikant oder nich
t. Nimmt man alpha = 5% = 0,05 an, so ist p nicht signifikant und somit wird di
e Nullhypothese angenommen.

