#This code predicts for from 132 to 144 for Airpassengers data using nnetar function.
#It save the image as image_predict_nnetar.png

#read the file
t1<-read.table('till200.txt')


#convert it to time series
a1<-ts(t1,start=c(1987, 26),frequency = 52)


#fit it using nnetar
# The nnetar() function fits a NNAR model(p,P,k)m model. If the values of p and P are not specified, they are automatically selected.
fit <- nnetar(a1,lambda=0)


#plot the forecast for h=10
plot(forecast(fit,h=10))