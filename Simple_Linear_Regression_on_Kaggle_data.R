training_data= read.csv("train.csv")
testing_data = read.csv("test.csv")
regressor= lm(formula = y ~ x,
              data= training_data)
y_prediction = predict(regressor, newdata = testing_data)

ggplot()+
  geom_point(aes(x=training_data$x, y=training_data$y),
             colour= 'black')+
  geom_line(aes(x=training_data$x, y=predict(regressor, newdata = training_data),
            colour='red'))+
  ggtitle('x vs y (Training data)')+
  xlab('x')+
  ylab('y')

ggplot()+
  geom_point(aes(x=testing_data$x, y=testing_data$y),
             colour= 'black')+
  geom_line(aes(x=testing_data$x, y=predict(regressor, newdata = testing_data),
            colour='red'))+
  ggtitle('x vs y(testing data)')+
  xlab('x')+
  ylab('y')
