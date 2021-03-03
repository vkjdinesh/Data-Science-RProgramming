#example 1: T-test
#A random sample of 18 observations taken
#from this population produced a sample mean
#of 40 and a sample standard deviation of 5.
#Using α = 0.025, would you reject the null
#hypothesis?

y<-rnorm(18)
n =18
x_bar=40
s = 5
alpha = 0.025
mu = 35
t <- (x_bar - mu)/ (s - sqrt(n))
t

p_value <- pt(t, df = (n-1), lower.tail = FALSE) 
ifelse (p_value<=alpha, "Reject", "fail to reject")
#t.test(y, mu=35, alternative = "greater" )

#Another random sample of 18 observations
#produced a sample mean of 36.8 and a sample
#standard deviation of 6.9. Using α = 0.025,
#would you reject the null hypothesis?
mu = 35
n = 18
x_bar = 36.5
s = 6.9
alpha = 0.025
t <- (x_bar - mu)/ (s - sqrt(n))
p_value <- pt(t, df = (n-1), lower.tail = FALSE) 
ifelse (p_value<=alpha, "Reject", "fail to reject")

#student t test
x<-read_excel("ss.xlsx")
class(x$ss)
x$ss<-as.integer(x$ss, na.rm = T)
hist(x$ss)
table(x$ss)
t<-t.test(x$ss, mu=0, alternative="greater")
p<-pt(t$statistic, df = 103, lower.tail = F)
p
ifelse (p<=0.05, "The null hypothesis is rejected", "There is not enough
evidence to reject the null hypothesis.")


# 

x <- 0
y <- 0
std.dev <- 1
for(i in 1:20){
 x <- append(x, i)
 y <- append(y, rnorm(1, mean=i))
}
x
y
plot(x,y)
abline(0, 1, add=T)
cor.test(x, y, method="pearson")


m<-read.csv("Dams.csv")
