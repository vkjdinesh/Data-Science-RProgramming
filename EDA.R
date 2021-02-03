#EDA : Exploratory Data Analysis

#Analyzing the data and relationships among variables using numerical and graphical methods
#EDA is the first step of statistical analysis
#Developing the data understanding
#Ask questions about the dataset
#Find the answers for each questions by visualizing, transforming and modelling your data
#Based on prediction, redefine or generate the new questions
#EDA will help you in choosing the graphs, models and transformations

                          Exploratory Data Analysis[EDA]:
1. Do manual analyzation of your data set
2. Simplify the variable(Use short term)
3. Reference: help(“mpg’) to know more about the process
4. Import your dataset
5. Clean your dataset
6. Use str function to know about the list of variable and data type of each variables
7. If all your variables are character, please find a way to change datatype of each variable as you want (As actual)
8. Perform the numeric and graphical analyzation
8.1. Mean, Median, Mode (Central tendency)
8.2. Find variance and SD
8.3. Range and Quantile
8.4. Use Summary function to verify your answers
8.5. Filter the random samples using pipe operator
8.6. Try to understand the seed function
8.7. If your dataset’s variables are quantitative, try to plot Histogram and Box plot, Dot plot, 
Density plot (Using ggplot)
8.8. If your dataset’s variables are qualitative, try to plot Bar chart, Pie chart (Using ggplot)


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

#range vs Quantile
range(diamonds$carat)
quantile(diamonds$carat)

#boxplot
boxplot(diamonds$carat)

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

#change to factor
q <- q %>% 
 mutate(test = as.factor(cut))
(or)
q$price <- as.factor(q$price)
str(q$price)
label(q$price)
