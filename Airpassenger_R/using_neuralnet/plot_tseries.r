#this code is used to understand to compare the predicted and actual values for predict_nnar.r code. It reads the text from files 'predicted_nnetar' and 'actual_nnetar' 
#which contains the values for predicted and actual from 1960 to 1961.
#the image is called image_plot_tseries.png

#read the value from tables
c <- read.table('predicted_nnetar.txt')
d <- read.table('actual_nnetar.txt')

#convert to time series object
myts1 <- ts(c,start=c(1960,1),frequency=12)
myts2 <- ts(d,start=c(1960,1),frequency=12)


#plot 

ts.plot(myts2,myts1,gpars=list(col=c('red','blue')))