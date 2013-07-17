library('fpp')
t1<-read.table('till200.txt')
a1<-ts(t1,start=c(1987, 26),frequency = 52)
b1 <- auto.arima(a1)

#forecast for another 200 values
f.arima <- forecast(b1,h=20)

#plot
plot(f.arima)

#ts.plot(melsyd[,"First.Class"],melsyd[,"Business.Class"],melsyd[,"Economy.Class"],gpars=list(xlab="year", ylab="People", col=c("Black","Blue","Red")))
 

  # legend for corresponding plot
#legend("topleft",cex=1, pch=18,col=c("Black","Blue","Red"),legend=c("First Class","Business Class","Economy Class"))