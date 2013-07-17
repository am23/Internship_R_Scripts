  #This code works for forecasting the values of Airpassengers using the already present values using auto.arima function.
  #The image is saves as image_auto_arima.png

  #reads the table
a <- read.table('original.txt')


  #making a time series object of data frame 'a' with frequency=12
sts <- ts(a,start=c(1947,1),frequency=12)

  #loading the library forecast
library('forecast')


  #applying the auto.arima which returns best ARIMA model according to either AIC, AICc or BIC value.
b <- auto.arima(sts)


  #forecasting the arima model
f.arima <- forecast(b)


  #plotting the values of the forecasted model
plot(f.arima)


#Conclusion: the plot seems fairly reasonable and the grey lines are high and low probability areas in which the forecast values can vary.