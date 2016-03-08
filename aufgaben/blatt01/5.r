rep(c(1:5), 2)[3] #or
vec[3]

matrix(12:1, ncol=4, byrow=FALSE)[2,]
matrix(12:1, ncol=4, byrow=FALSE)[,1]

subset(potato, Sorte==1|Sorte==3)

BRASSICA$group
BRASSICA$height

subset(BRASSICA, group=='control')

BRASSICA$group <- ordered(BRASSICA$group, c("control", "ancy"))
