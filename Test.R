#choose the dataset
help("diamonds")
q<-ggplot2::diamonds

#numerical analysis
str(diamonds)
nrow(diamonds)
ncol(diamonds)
head(diamonds)
tail(diamonds)
summary(diamonds)

#central tendancy

mean(diamonds$carat)
median(diamonds$carat)

max(diamonds$carat)
min(diamonds$carat)
sd(diamonds$carat)
var(diamonds$carat)
quantile(diamonds$carat)

#table

diamondsw.small <- q %>%  sample_n(100)
diamondsw.large <-q %>% sample_n(1000)

#dot plot

q %>% ggplot(aes(x=carat)) +
 geom_dotplot(binwidth = 0.05, stackdir = 'up', color = 'red', dotsize = 3) +
 scale_x_continuous(breaks = seq(0,5,0.5)) +
 scale_y_continuous(breaks = seq(0,3,0.5))


#histogram
q %>% ggplot(aes(x=price))+
 geom_histogram(binwidth = 1000, color = 'red', fill = 'blue')


#density
q %>% ggplot(aes(x=price))+
 geom_density(adjust =1/3, linetype = "dashed", color = "red" , fill = "blue")


#bar plot
q %>% ggplot(aes(x=clarity))+
 geom_bar(stat = 'count')


q <- q %>% 
 mutate(test = as.factor(cut))

str(q)
