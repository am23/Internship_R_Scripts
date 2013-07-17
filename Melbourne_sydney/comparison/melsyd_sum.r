  #'melsyd' is the name of the dataset in the package 'fpp'
  #load the package fpp
   #image is saves as image_melsyd_sum.png
  
  #install.packages('fpp','forecast','fma','tseries','expsmooth','lmtest','zoo')

library('fpp')


  #read the 'sum' file
a<-read.table('sum.txt')


  #convert to time series
a1<-ts(a,start=c(1987, 26),end=c(1992, 48),frequency = 52)


  # plotting three features of the dataset 'melsyd' ie "First.Class", "Business.Class" and "Economy.Class" and "Sum of all classes"
ts.plot(melsyd[,"First.Class"],melsyd[,"Business.Class"],melsyd[,"Economy.Class"],a1,gpars=list(xlab="year", ylab="People", col=c("Black","Blue","Red","Green")))
 

  # legend for corresponding plot
legend("topleft",cex=1, pch=18,col=c("Black","Blue","Red","Green"),legend=c("First Class","Business Class","Economy Class","Sum"))


