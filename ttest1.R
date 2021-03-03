x<- read.csv("ttest.csv")
class(x)
class(x$weight1)
class(x$weight2)
cor.test(x$weight2,x$weight1)
t.test(x$weight1 ~ x$weight2  )
mean(x$weight1)
mean( x$weight2)

y<-c(-11,-10,-8,-7,-6)
mean(y)
sd(y)
t.test(x$weight1 ~ x$weight2, var.equal = T)
sd(x$weight1)
var(x$weight1)
var(x$weight2)

y<-read.csv("chi.csv")
class(y)

#test
z-test, t-test, pearson correlation test, chi-square test, ANOVA test
 
#samples
>30 sample : z-test
<30 sample : t test (choose 30 random samples)

 
#based on variables

# two numeric variable : 
data<-ggplot2::mpg

x<-read.csv("ttest.csv")
cor.test(x$weight1,x$weight2)

#paired t test

t.test(x$weight2, x$weight1,paired = T )
m<-c(-11, -10, -8, -7, -6)
sd(m)




