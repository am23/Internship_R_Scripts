#This code predicts for from 132 to 144 for Airpassengers data using nnetar function.
#It save the image as image_predict_nnetar.png

#read the file
a <- read.table('from132to144.txt')


#convert it to time series
t1 <- ts(a,start = c(1),frequency=1)


#fit it using nnetar
# The nnetar() function fits a NNAR model(p,P,k)m model. If the values of p and P are not specified, they are automatically selected.
fit <- nnetar(t1,lambda=0)


#plot the forecast for h=10
plot(forecast(fit,h=10))