 #Blatt 3
  2 
  3 #1.1 Datei lokal speichern
  4 
  5 #1.2
  6 maeuse = read.table(file="mice.txt", sep="\t", dec=".", header=TRUE)
  7 
  8 #1.3
  9 boxplot(maeuse$speed ~ maeuse$health, date = maeuse, main = "kranke Maeuse"    )
 10 # Beide Gruppen sind ungefaehr normalverteilt, es gibt keine Aussreisser. *    diese wuerden als Punkte ausserhalb der Boxen dargestellt)
 11 # Man kann allerding sehen, dass das untere Quartil der gesunden Gruppe kle    iner ist als das obere, also liegen die Daten dort dichter.
12 # Der Median liegt bei beiden nicht ganz, aber relativ mittig.
 13 # Die Varianz der kranken Maeusegruppe ist deutlich hoeher als die der gesu    nden, was man an der Gesamthoehe (also im Prinzip der Streuung der Daten) s    ehen kann.
 14 
 15 #1.4
 16 #Geeignetes Hypothesenpaar:
 17 #Nullhypothese: Die Varianz und der Median der Ergebnisse der gesunden Grup    pe sind kleiner oder gleich der die kranken.
 18 #Alternativhypothese: Die Varianz und der Median der Ergebnisse der kranken     Gruppe sind groesse als die der gesunden.

