#This code compares the prediction for Airpassengers for several year spans like 
#1953-1959
#1955-1959
#1956-1959
#the result is saved as image_comp_arima.png

#reading files
 a<-read.table('original.txt')
 b<-read.table('from84to144.txt')
 c1<-read.table('fm108to144.txt')
 d<-read.table('fm120to144.txt')
 
#Converting to time series 
 myts <- ts(a, start=c(1947,1), frequency=12)
 myts1 <- ts(b, start=c(1947,1), frequency=12)
 myts2 <- ts(c1, start=c(1947,1), frequency=12)
 myts3 <- ts(d, start=c(1947,1), frequency=12)
 
#fitting using ARIMA models.
 fit1 <- arima(myts1, order=c(1,0,0), list(order=c(2,1,0), period=12),method="ML")
 fit2 <- arima(myts2, order=c(1,0,0), list(order=c(2,1,0), period=12),method="ML")
 fit3 <- arima(myts3, order=c(1,0,0), list(order=c(2,1,0), period=12),method="ML")
 
#predicting using n.ahead for predicting intervals
 fore1 <- predict(fit1, n.ahead=60)
 fore2 <- predict(fit2, n.ahead=36)
 fore3 <- predict(fit3, n.ahead=24)
 
#plotting
 ts.plot(myts,fore1$pred,fore2$pred,fore3$pred,gpars=list(xlab="time", ylab="People",col=c("black","blue","red","green")))
 legend("topleft",cex=1, pch=18,col=c("black","blue","red","green"),legend=c("Original","1953-1959","1955-1959","1956-1959"))
 
#Conclusion : This model predicts reasonably for the immediate next year, but is not applicable for long-term forecasts.