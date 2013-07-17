#This code for predicting the Airpassengers for next 2 years.

#reading files
 a<-read.table('original.txt')

 
#Converting to time series 
 myts <- ts(a, start=c(1949,1), frequency=12)

#fitting using ARIMA model.
 fit1 <- arima(myts, order=c(1,0,0), list(order=c(2,1,0), period=12),method="ML")

 
#predicting using n.ahead for predicting interval.
 fore1 <- predict(fit1, n.ahead=24)
 
 
#plotting
 ts.plot(myts,fore1$pred,gpars=list(xlab="time", ylab="People",col=c("black","blue")))
 legend("topleft",cex=1, pch=18,col=c("black","blue"),legend=c("Original","Predicted"))
 
#Conclusion : The prediction seems very reasonable and a little growth can be seen over the time.