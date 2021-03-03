#Import Dataset
x<-read.csv("oneanaova.csv")
str(x)
#Int to factor
x$Batch<-as.factor(x$Batch)
#One way anova
aov(Happiness.level ~ Batch, x)
summary(aov(Happiness.level ~ Batch, x))
TukeyHSD(aov(Happiness.level ~ Batch, x))
bartlett.test(Happiness.level ~ Batch, x)
boxplot(x$Happiness.level ~x$Batch)

#two way anova
y<-read.csv("twoway.csv")
y$Batch <-as.factor(y$Batch)
y$Gender<-as.factor(y$Gender)
# var1(Num) ~ var2(cat)*var(3) (or) var(2) + var(3)
aov(Happiness.level ~ Batch + Gender , y )
summary(aov(Happiness.level ~ Batch + Gender , y ))
aov(Happiness.level ~ Batch * Gender , y )
summary(aov(Happiness.level ~ Batch * Gender , y ))

boxplot(y$Happiness.level ~y$Batch * y$Gender)
