
#read excel file(ss.xlxs)/set the working directory
x<-read_excel("ss.xlsx")
#histogram
hist(x$ss)
class(x$ss)
#chnage to numeric
x$ss <- as.numeric(x$ss)
#summary
summary(x)
#make a null hypothesis appropriate for one-side t-test by setting a criteria
#Null hyp mu is equal 0, so alternative hyp mu is greater than 0

t<-t.test(x$ss, mu=0, alternative="greater")

#Test your hypothesis using one-side t-test at α = 0.05
p<-pt(t$statistic, df = 103, lower.tail = F)
p

#test the hypothesis
ifelse (p<=0.05, "The null hypothesis is rejected", "There is not enough
evidence to reject the null hypothesis.")

#State the statistical conclusion.

#This is one tailed right test, default value of alpha is 0.05
#so the h0 is rejected 
 

#one sample test

x <- rnorm(10)
t.test(x)
y<-rnorm(20)
t.test(x,y, var.equal = T)

q<-read.csv("grass.csv")
t.test(q$rich ~ q$graze,  subset = q$graze %in% c('mow', 'unmow'))


x <- c(1, 2, 3, 4)

y <- c(1, 2, 3.2, 4)
plot(x, y)
cor.test(x, y, method = "pearson")


x <- c(1, 2, 3, 4, 5, 6, 7, 8)
y <- c(1, 2, 3.2, 4, 5, 6, 6.7, 8)
plot(x, y)
cor(x, y)
cor.test(x, y, method="pearson")

#multilinear regression

# 0. Data preparation

data<-read.csv("data1.csv")
logY<-log10(data$Y)
X1<-data$X1
X2<-data$X2
X3<-data$X3
X4<-data$X4

# 1. Check distributions

par(mfrow=c(3,5))
logY<-log10(data$Y)
hist(X1)
hist(X2)
hist(X3)
hist(X4)
hist(logY)
plot(X1,logY)
plot(X2,logY)
plot(X3,logY)
plot(X4,logY)

# 2. Analysis with multiple regression
# considered interactions between X1 & X2

res1<-lm(formula=logY~X1+X2+X3+X4)
summary(res1)

# 3. Analysis with multiple regression

slm1<-step(res1)
summary(slm1)
plot(slm1)



#SD value is 1, x:1:20, b value is 0
x <- 0
y <- 0
std.dev <- 1
for(i in 1:20){
 x <- append(x, i)
 y <- append(y, rnorm(1, mean=i, sd =std.dev))
}
x
y
plot(x,y)
abline(0, 1, add=T)
cor.test(x, y, method="pearson")

#anova test
library(gplots)

# one way
data1 <- read.csv("data1.csv")
summary(data1)
boxplot(data1$pressure ~ data1$drink)
plotmeans(data1$pressure ~ data1$drink)

oneway.test(data1$pressure ~ data$drink, var=T)
result1 <- aov(data1$pressure ~ data1$drink)
summary(result1)

# two-way
data2 <- read.csv("data2.csv")
summary(data2)
plotmeans(data2$pressure ~ data2$drink)

result2 <- aov(data2$pressure ~ data2$drink * data2$gender)
summary(result2)


#ANOVA calculation

group_a <- c(1,2,5)
group_b <- c(2,4,2)
group_c <- c(2,3,4)

combined <- data.frame(cbind(group_a, group_b, group_c))
summary(combined)

stacked <- stack(combined)
stacked

Anovaresult <- aov(values ~ ind, data = stacked)
Anovaresult


count <- 0
n.repeat <- 10000

# step 6. Repeat from Step 3 to Step 5 many times 
for(k in 1:n.repeat){
 
 data <- NULL
 group <- NULL
 p <- NULL
 
 # step 1. Specify F0.05(1),2,27
 F1 <- qf(0.95, 2, 27)
 
 # step 2. Assume a population following normal distribution.
 mean <- 0
 sd <- 1
 
 
 # step 3. From the population choose 10 samples randomly.
 data <- rnorm(10, mean, sd) # data-A
 #data
 
 # step 4. Repeat random sampling and generate Data-B and -C.
 data <- append(data, rnorm(10, mean, sd)) # data-B
 #data
 data <- append(data, rnorm(10, mean, sd)) # data-C
 #data
 
 # step 5. Perform one-way ANOVA.
 for(i in 1:3){
  for(j in 1:10) group <- append(group, i)
 }
 group
 result <- oneway.test(data ~ group, var=T)
 #result
 p <- result$p.value
 F2 <- qf(1-p, 2, 27)
 #F2
 if(F2>F1) count <- count + 1
 
}

n.repeat
count
sprintf("%6.4f", count/n.repeat)














