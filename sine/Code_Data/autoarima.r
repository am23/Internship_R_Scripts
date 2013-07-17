#this code plots the prediction values for sine using auto.arima model and forecast function

#read the the values
r1<- read.table('sinvalues_dataset.txt');

#convert to time series
t1<- ts(r1,start = -3.14,frequency=1)

#load the library
library('forecast')

#fit the model
b1 <- auto.arima(t1)

#forecast for another 200 values
#f.arima <- forecast(b1,h=200)
f.arima <- forecast(b1,h=600)

#plot
plot(f.arima)

