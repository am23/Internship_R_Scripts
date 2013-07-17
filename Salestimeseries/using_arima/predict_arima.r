 
 #This code works for predicting the values of sales using the already present values. Image is saved as image_predict_arima.png

 
 #reads the table into a
a <- read.table('Sales-time-series.txt',h=T)


  #making a time series object of data frame 'a' with frequency=12, starting from year 2002
sts <- ts(a$Sales,start=2002,frequency=12)

  #fits the ARIMA model
fit1 <- arima(sts, order=c(1,0,4), list(order=c(2,1,1), period=12),method="ML")
 
 
  #predicting for next 2 years
fore1 <- predict(fit1, n.ahead=24)


  #plotting 
ts.plot(sts,fore1$pred,gpars=list(xlab="time", ylab="People",col=c("black","blue")))
legend("topleft",cex=1, pch=18,col=c("black","blue"),legend=c("Original","Predicted"))