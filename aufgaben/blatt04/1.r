#4.2
t.test(formula = hair$length_difference ~ hair$type, var.eqaul = TRUE, alternative = "two.sided", conf.level = 0.95, paired = TRUE)
