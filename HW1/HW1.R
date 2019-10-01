# 2
z = seq(-3, 3, by = 1)
plot(z, dnorm(z), type = "l", xlab="Z", ylab="Density", main="PDF of Z")

# 3
z_cdf = 2
pnorm(z_cdf)

#4
help(qnorm)
qnorm(0.975)

#5
n = 4
plot(0:n, binprobs<- dbinom(0:n, size=n, p=0.1),
     ylab="f(y)", xlab="y",
     pch=20, main="binom(n=4,p=0.1)")

segments(0:n,rep(0,n),0:n, binprobs)

#6
pbinom(0, size = n, prob = 0.1, lower.tail = FALSE)

#7
pbinom(0.5, size = n, prob = 0.1, lower.tail = FALSE)

#8
#(a)
# E(1 + 2Y1 + 3Y2) = 1 + 2u1 + 3u2

#(b)
# cov(y1, y2) = E(y1 * y2) - (u1 * u2)

#(c)
# var(1 + 2y1 + 3y2) = 2^2 * sigma1 + 3^2 sigma2
#(d)
