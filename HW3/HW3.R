data(cheddar, package="faraway")
#1
#A
pairs(cheddar)
#B
taste_model <- lm(cheddar$taste ~ cheddar$Acetic + cheddar$H2S + cheddar$Lactic)
sum_taste <- summary(taste_model)
sum_taste
#C
cor_taste_model <- cor(fitted(taste_model), cheddar$taste)
cor_taste_model
#D
taste_model_2 <- lm(cheddar$taste ~ cheddar$Acetic + cheddar$H2S + cheddar$Lactic - 1)
sum_taste <- summary(taste_model_2)
sum_taste

r_squared <- cor(fitted(taste_model), cheddar$taste)^2
# You would square the r of the of the model.
r_squared


#2
#A
x <- model.matrix( ~ Acetic + H2S + Lactic, cheddar)
y <- cheddar$taste
#B
xtxi <- solve(t(x) %*% x)
as.vector(betahat<- xtxi %*% t(x) %*% y)
#C
H_mat <- x %*% (solve(t(x) %*% x)) %*% t(x)

# We have 4 parameters
sum_diag <- sum(diag(H_mat))
sum_diag
#D
y_hat <- H_mat %*% y
y1 <- y_hat[1]
y2 <- y_hat[2]
yn <- tail(y_hat, n=1)
#E
residuals <- y - y_hat
residuals
even <- function(x) x%%2 == 0
even_ind <- even(1:length(residuals))
residuals[even_ind]
#F
n<- length(na.omit(y))
p<- dim(x)[2]
sigmahat<- sum(residuals^2)/(n-p)
sigmahat
#G
verified_r_2 <- cor(y_hat, cheddar$taste)^2
verified_r_2
r_squared
#H
varbetahat<- sigmahat * xtxi
varbetahat
varbetahat<- vcov(taste_model)
varbetahat
#I
estimated_se <- sqrt(diag(varbetahat))
estimated_se
#J
# These errors are that R estimated from the model with the intercepts
#K
#i
tstat <- (betahat - 0) / estimated_se[2]
#ii
t_test <- 2*pt(q=abs(tstat), df=n-p, lower=FALSE)
t_test[2]
summary(taste_model)
#iii
# The results from the hypothesis test, lead us to believe that we should
# exclude acetic from the model
#iv
tcrit<- qt(0.975, n-p)
tcrit
#v
lower <- betahat[2] - tcrit * estimated_se[2]
upper <- betahat[2] + tcrit * estimated_se[2]
ci <- c(lower, upper)
ci
confint(taste_model)

#3
# The interval is gonna be roughly the same, becausethe fact that estimating
# B is a linear function, meaning it is similar to Least Squares

















