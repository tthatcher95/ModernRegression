

# 1
A <- matrix(c(2,3,5,4,1,5,7,8), ncol=2, nrow=4)
B <- matrix(c(6,9,3,1), ncol=1, nrow=4)
C <- matrix(c(3,8,5,2,8,6,1,4), ncol=2, nrow=4)

a.1 <- A + C
b.1 <- A - C
c.1 <- t(B) %*% A
d.1 <- A %*% t(C)
e.1 <- t(C) %*% A

#2
X <- matrix(c(1,1,1,1,1,1,4,1,2,3,3,4), ncol=2, nrow=6)
Y <- matrix(c(16,5,10,15,13,22), ncol=1, nrow=6)

a.2 <- t(Y) %*% Y
b.2 <- t(X) %*% Y
c.2 <- t(X) %*% X
d.2 <- solve(c.2)
e.2 <- d.2 %*% t(X) %*% Y

# (f) A B & C are symmetric
isSymmetric(a.2)
isSymmetric(b.2)
isSymmetric(c.2)
isSymmetric(d.2)
isSymmetric(e.2)

# (g)
g.2 <- lm(Y ~ (X - 1))
summary(g.2)
