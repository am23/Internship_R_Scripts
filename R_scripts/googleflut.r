#googleflutrends.r
   
  #The following code works for a single country i.e. Argentina and then later it makes a comparison between Argentina and Brazil with respect to the trends.
  #b1.csv contains the information of the no. of people suffering from flu in Argentina (2002-2013)
  #b2.csv contains the information of the no. of people suffering from flu in Brazil (2002-2013)
  #The result files will be saved in pdf format in the documents folder.
  #The code plots graphs for predicting the trend for coming year.


  #reading the excel file into R
file1 <- read.csv("Supporting_datasets/b1.csv")


  #ts is used to create time-series objects.Start the time of the first observation.End the time of the last observation, specified in the same way as start.
  #frequency the number of observations per unit of time.
myts <- ts(file1, start=c(2002,12), end=c(2013,5), frequency=12)


  #plotting the graph and saving it as result1

jpeg(file="results/result_googleflut/result1.jpg")
plot(myts, main= "Argentina flu trends", ylab="No. of people")
dev.off()


  #plotting the graph for stl ie decompose a time series into seasonal, trend and irregular components
fit <- stl(myts, s.window="period")
jpeg(file="results/result_googleflut/result2.jpg")
plot(fit)
dev.off()


  #plotting the graph to decompose a time series into seasonal, trend and irregular components using moving averages. Deals with additive or multiplicative seasonal component.
f <- decompose(myts)
jpeg(file="results/result_googleflut/result3.jpg")
plot(f)
dev.off()


  #plots the graph for f$figure which is the estimated seasonal figure only.
jpeg(file="results/result_googleflut/result4.jpg")
plot(f$figure, type="b", xaxt="n", xlab="",main="seasonal variation")
monthNames <- months(ISOdate(2013,1:12,1))
axis(1, at=1:12, labels=monthNames, las=2)
dev.off()


  #ARIMA=Auto regressive Moving Average. Fit an ARIMA model to a univariate time series for predicting the values.
arima1 <- arima(myts, order=c(2,1,1), list(order=c(2,1,0), period=24)) 


  #predict : Predicted values based on linear model object 
fore <- predict(arima1, n.ahead=24)


  #fore$pred is for prediction and fore$se is for standard error
U <- fore$pred + 2*fore$se


  #plotting the predicted values which depends on myts,fore$pred and U
jpeg(file="results/result_googleflut/result5.jpg")
ts.plot(myts, fore$pred, U,col=c(1,2,4,4), lty = c(1,1,0,0),main="prediction for argentina")
legend("topleft", c("Actual", "Forecast"), col=c(1,2), lty=c(1,1))
dev.off()


  #reading b2.csv
file2 <- read.csv("Supporting_datasets/b2.csv")
myts1 <- ts(file2,start=c(2002,12),end=c(2013,5),frequency=12)


  #plotting the graph to decompose a time series into seasonal, trend and irregular components using moving averages.
f2<-decompose(myts1)


  #plot the trends of both the countires .
jpeg(file="results/result_googleflut/result6.jpg")
plot(f2$trend,col="red",main="FLu wrt Trend")
par(new = TRUE)
plot(f$trend, axes = FALSE, xlab = "", ylab = "",col="blue")
legend("topright",c("Argentina","Brazil"),col=c(1,2), lty=c(1,1))
dev.off()

#END
  