#This code helps to train and test Airpassengers data using neural networks. It uses the 'carat' package which has a 'train' function. It predicts values from 132 to 144.
# It generates  the image image_nnet_2.png

#Reading files
a<-read.table('original.txt')
b<-read.table('from132to144.txt')


#loading required packages
require(quantmod) #for Lag()
require(nnet)
require(caret)


#converting to time series
x <- ts(a, start=c(1),frequency=1)   #data for predicting
y <- ts(b, start=c(1),frequency=1)   #used for training


#converting to data frames
d1 <- data.frame(y, x1=(y+1), x2=(y+2))  # goes for training  
d2 <- data.frame(x, x3=(x+1), x4=(x+2))


#Assigning names 
names(d1) <- c("y", "x1", "x2")
names(d2) <- c("x", "x1", "x2")


#training the data, when method = 'nnet' , the hyperparameters of size and decay are used. Also tune.grid returns a data frame with possible tuning values preceded by a period (like decay & size)
#exapnd.grid creates a data frame from all combinations of the supplied vectors or factors.
model <- train(y ~ x1 + x2, d1, method='nnet', linout=TRUE, trace = FALSE,tuneGrid=expand.grid(.size=c(1,5,10),.decay=c(0,0.001,0.1))) 


#prediction
ps <- predict(model, d2)


#Examine results
model
ts.plot(x,ps,gpars=list(col=c('red','blue')))
legend("topleft",cex=1, pch=18,col=c("red","blue"),legend=c("Original","Predicted from 132"))