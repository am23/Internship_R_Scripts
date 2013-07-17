
  #This code works for forecasting the values of sales using the already present values. Image is saved as image_predict_autoarima.png 

  #reads the table
a <- read.table('Sales-time-series.txt',h=T)


  #making a time series object of data frame 'a' with frequency=12, starting from year 2002
sts <- ts(a$Sales,start=2002,frequency=12)


  #loading the library forecast
library('forecast')


  #applying the auto.arima which returns best ARIMA model according to either AIC, AICc or BIC value.
b <- auto.arima(sts)


  #forecasting the arima model
f.arima <- forecast(b)


  #plotting the values of the forecasted model
plot(f.arima)
