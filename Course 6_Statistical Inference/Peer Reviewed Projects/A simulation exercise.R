# Simulation Exercise

## 1) Show the sample mean and compare it to the theoretical mean of the distribution.

set.seed(2020)
n <-  40
Sim <- 1000
Lambda <- 0.2


SampleMean <- NULL

for(i in 1:Sim){
  SampleMean <- c(SampleMean, mean(rexp(n, Lambda)))
}

### Sample mean
mean(SampleMean)


### Theoretical mean

theoretical_mean <- 1/Lamdba
theoretical_mean

## 2) Show how variable the sample is (via variance) and compare it to the theoretical variance of the distribution

### Sample variance

SampleVar <- var(SampleMean)
SampleVar


### Theoretical Variance

theoretical_var <- ((1/Lambda)*(1/sqrt(n)))^2
theoretical_var


## 3) Show that the distribution is approximately normal.

hist(SampleMean, col = "Yellow",
     xlab = "Means", probability = T, breaks = n,main = "Normal Distribution Comparsion")
x <- seq(min(SampleMean), max(SampleMean), length = 200)
lines(x, dnorm(x, mean = 1/Lambda, sd = (1/Lambda/sqrt(n))), pch = 25, col = "red")

qqnorm(SampleMean)
qqline(SampleMean, col = "orange")

