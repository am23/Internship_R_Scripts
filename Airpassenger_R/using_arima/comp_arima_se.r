#This code compares the prediction for Airpassengers for several year spans like 
#mid 1950-1959
#1954-1959
#1956-1959
#1957-1959

#The name of the file comp_arima_se means the comparison is done using arima models using standard error. The plot here plots the value of the prediction along with standard error.
#The result is saved as image_comp_arima_se.png


#reading files
 a<-read.table('original.txt')
 e<-read.table('till48.txt');
 b<-read.table('from84to144.txt')
 c1<-read.table('fm108to144.txt')
 d<-read.table('fm120to144.txt')
 
 
#Converting to time series 
 myts <- ts(a, start=c(1947,1), end=c(1958,12), frequency=12)
 myts1 <- ts(b, start=c(1947,1), end=c(1953,12), frequency=12)
 myts2 <- ts(c1, start=c(1947,1), end=c(1955,12), frequency=12)
 myts3 <- ts(d, start=c(1947,1), end=c(1956,12), frequency=12)
 myts4 <- ts(e, start=c(1947,1), end=c(1950,5), frequency=12)
 
 
#fitting using ARIMA models
 fit1 <- arima(myts1, order=c(1,0,0), list(order=c(2,1,0), period=12),method="ML")
 fit2 <- arima(myts2, order=c(1,0,0), list(order=c(2,1,0), period=12),method="ML")
 fit3 <- arima(myts3, order=c(1,0,0), list(order=c(2,1,0), period=12),method="ML")
 fit4 <- arima(myts4, order=c(1,0,0), list(order=c(2,1,0), period=12),method="ML")
 
 
#predicting using n.ahead
 fore1 <- predict(fit1, n.ahead=60)
 fore2 <- predict(fit2, n.ahead=36)
 fore3 <- predict(fit3, n.ahead=24)
 fore4 <- predict(fit4, n.ahead=104)
 
 
 #calculating the predictions with standard error.
 U1 <- fore1$pred + 2*fore1$se
 U2 <- fore2$pred + 2*fore2$se
 U3 <- fore3$pred + 2*fore3$se
 U4<- fore4$pred + 2*fore4$se
 
 
#plotting the predictions with standard error.
 ts.plot(myts,U4,U1,U2,U3,gpars=list(xlab="time", ylab="People",col=c("black","brown","blue","red","green")))
 legend("topleft",cex=1, pch=18,col=c("black","brown","blue","red","green"),legend=c("Original","mid 1950","1954","1956","1957"))
 
#Conclusion : This model is not a good immediate prediction model but this model shows the trend very clearly over a period of time.
 