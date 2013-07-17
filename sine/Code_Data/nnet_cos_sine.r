#Code for sin value prediction using neural networks. First train it using 'caret' package abd then predict.

#Load Packages
require(quantmod) #for Lag()
require(nnet)
require(caret)

#Make dataset
y <- sin(seq(0,40, 0.1))
y1<- cos(seq(0,40,0.1))

te <- data.frame(y, x1=Lag(y), x2=Lag(y,2))

tee<- data.frame(y1,x3=Lag(y1),x4=Lag(y1,2))

names(te) <- c("y", "x1", "x2")
names(tee)<-c ("y1","x1","x2")

#Fit model
model <- train(y ~ x1 + x2, te, method='nnet', linout=TRUE, trace = FALSE,
                #Grid of tuning parameters to try:
                tuneGrid=expand.grid(.size=c(1,5,10),.decay=c(0,0.001,0.1))) 
				

#predict for tee
ps <- predict(model, tee)


#Examine results
model
plot(y)
lines(ps, col=2)