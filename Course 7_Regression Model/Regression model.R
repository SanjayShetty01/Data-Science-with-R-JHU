# Load Library and Data

library(ggplot2)
data("mtcars")

head(mtcars)

# Exploratory Data analysis

mtcars$am<-as.factor(mtcars$am)
levels(mtcars$am)<-c("AT", "MT")

aggregate(mpg~am, data=mtcars, mean)

ggplot(mtcars, aes(y = mpg, x = am, fill = am))+
      geom_boxplot()+
      labs( x = "Transmission Type", y = "Miles per Gallon", title = "")


# Statistical Inference

auto_Data<-mtcars[mtcars$am == "AT",]
mannual_Data<-mtcars[mtcars$am == "MT",]
t.test(auto_Data$mpg, mannual_Data$mpg, paired = F, conf.level = 0.95)

# Regression Modelling

# Model fitting

Reg_1 <- lm(mpg~am, mtcars)
summary(Reg_1)

Reg_2 <- lm(mpg~am + wt, mtcars)
summary(Reg_2)

Reg_3 <- lm(mpg~am+ wt+ factor(cyl), mtcars)
summary(Reg_3)

Reg_All <- lm(mpg~., mtcars)

summary(Reg_All)


par(mfrow = c(2,2))
plot(Reg_All)




