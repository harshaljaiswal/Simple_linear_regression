data=read.csv("Salary_Data.csv")
#install.packages('caTools')
library(caTools)
split = sample.split(data$Salary, SplitRatio = 2/3)
training = subset(data, split == TRUE)
test = subset(data, split== FALSE)

regressor = lm(formula = Salary ~ YearsExperience,
               data= training)
y_prediction = predict(regressor, newdata = test)

#install.packages('ggplot2')
library(ggplot2)

ggplot()+
  geom_point(aes(x=training$YearsExperience, y=training$Salary),
             colour='red') +
  geom_line(aes(x=training$YearsExperience, y=predict(regressor, newdata = training)),
            colour='blue') +
  ggtitle('Salary vs experience (Training data)') +
  xlab('years of experience') +
  ylab('salary')

ggplot()+
  geom_point(aes(x=test$YearsExperience, y=test$Salary),
             colour='red')+
  geom_line(aes(x=training$YearsExperience, y=predict(regressor, newdata = training)),
            colour= 'blue')+
  ggtitle('salary vs experience (Testing data)')+
  xlab('Years of experience')+
  ylab('Salary')