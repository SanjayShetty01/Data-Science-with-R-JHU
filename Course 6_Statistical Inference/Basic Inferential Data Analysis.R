# Basic inferential data analysis.

#Load the libraries
library(ggplot2)
library(datasets)

# 1)Load the ToothGrowth data and perform some basic exploratory data analyses

data("ToothGrowth")

str(ToothGrowth)
head(ToothGrowth)
tail(ToothGrowth)

# 2) Provide a basic summary of the data.

summary(ToothGrowth)

ggplot(ToothGrowth, aes(x=supp, y=len))+ 
        geom_boxplot(aes(fill=supp))+
        labs(x = 'Type of Supplement', y = "Length of the Tooth", title = "Relationship between Tooth length and Supplement")+
        guides(fill=guide_legend(title="Supplement"))


ggplot(aes(x = factor(dose), y = len), data = ToothGrowth) + 
    geom_boxplot(aes(fill = factor(dose)))+
    labs(x = "Type of Dose", y = "Length of the Tooth" ,title="Relationship between Tooth Length and Dose")+
    guides(fill=guide_legend(title="Dose"))

# 3) Use confidence intervals and/or hypothesis tests to compare tooth growth by supp and dose.

t.test(len~supp, data = ToothGrowth, paired = F)

t.test(len~supp, data = subset(ToothGrowth, dose ==0.5 ), paired = F)

t.test(len~supp, data = subset(ToothGrowth, dose ==1 ), paired = F)

t.test(len~supp, data = subset(ToothGrowth, dose ==2 ), paired = F)



  