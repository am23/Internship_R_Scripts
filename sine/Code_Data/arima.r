#this code plots the prediction values for sine using arima model

#read the the values
r1<- read.table('sinvalues_dataset.txt');

#convert to time series
t1<- ts(r1,start = -3.14,frequency=1)

#fit arima model
arima1 <- arima(t1, order=c(2,2,1))

#predict for next 200 values
fore <- predict(arima1, n.ahead=200)
#fore <- predict(arima1, n.ahead=600)

#plot 
ts.plot(t1,fore$pred)