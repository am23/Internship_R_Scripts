  #'melsyd' is the name of the dataset in the package 'fpp'
  #load the package fpp
  #image is saves as image_melsyd.png
  
  #install.packages('fpp','forecast','fma','tseries','expsmooth','lmtest','zoo')

library('fpp')


  # plotting three features of the dataset 'melsyd' ie "First.Class", "Business.Class" and "Economy.Class" 
ts.plot(melsyd[,"First.Class"],melsyd[,"Business.Class"],melsyd[,"Economy.Class"],gpars=list(xlab="year", ylab="People", col=c("Black","Blue","Red")))
 

  # legend for corresponding plot
legend("topleft",cex=1, pch=18,col=c("Black","Blue","Red"),legend=c("First Class","Business Class","Economy Class"))