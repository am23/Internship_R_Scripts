require(clusterGeneration)
require(nnet)
 
set.seed(2)
num.vars<-8
num.obs<-1000
 
#arbitrary correlation matrix and random variables
cov.mat<-genPositiveDefMat(num.vars,covMethod=c("unifcorrmat"))$Sigma
rand.vars<-mvrnorm(num.obs,rep(0,num.vars),Sigma=cov.mat)
parms<-runif(num.vars,-10,10)
 
#response variable as linear combination of random variables and random error term
y<-rand.vars %*% matrix(parms) + rnorm(num.obs,sd=20)
 
#prepare data for use with nnet and plot.nnet
rand.vars<-data.frame(rand.vars)
y<-data.frame((y-min(y))/(max(y)-min(y)))
names(y)<-'y'

#get vector of T/F that is used to subset data for training
set.seed(3)
train.dat<-rep(F,num.obs)
train.dat[sample(num.obs,600)]<-T
 
num.it<-100 #number of training iterations
 
err.dat<-matrix(ncol=2,nrow=num.it) #object for appending errors
 
for(i in 1:num.it){
     
    #to monitor progress
    cat(i,'\n')
    flush.console()
     
    #to ensure same set of random starting weights are used each time
    set.seed(5)
     
    #temporary nnet model
    mod.tmp<-nnet(rand.vars[train.dat,],y[train.dat,],size=10,linout=T,maxit=i,trace=F)
     
    #training and test errors
    train.err<-sqrt(mod.tmp$value/sum(train.dat))
    test.pred<-predict(mod.tmp,newdata=rand.vars[!train.dat,])
    test.err<-sqrt(sum((test.pred-y[!train.dat,])^2)/sum(!train.dat))
     
    #append error after each iteration
    err.dat[i,]<-c(train.err,test.err)
         
    }
	#make animation
require(animation)
 
num.it<-100
 
#this vector is needed for proper scaling of weights in the plot
max.wt<-0
for(i in 1:num.it){
  set.seed(5)
  mod.tmp<-nnet(rand.vars[train.dat,],y[train.dat,,drop=F],size=10,linout=T,maxit=i-1,trace=F)
  if(max(abs(mod.tmp$wts))>max.wt) max.wt<-max(abs(mod.tmp$wts))
  }
 
ani.options(outdir = 'C:/Users/aanchal.maheshwari/Desktop/') #your local path
saveHTML(
  {
  for(i in 1:num.it){
   
    #plot.nnet
    par(mfrow=c(1,2),mar=c(0,0,1,0),family='serif')
    set.seed(5)
    mod.tmp<-nnet(rand.vars[train.dat,],y[train.dat,,drop=F],size=10,linout=T,maxit=i-1,trace=F)
    rel.rsc.tmp<-1+6*max(abs(mod.tmp$wts))/max(max.wt)    #this vector sets scale for line thickness
    plot.nnet(mod.tmp,nid=T,rel.rsc=rel.rsc.tmp,alpha.val=0.8,
        pos.col='darkgreen',neg.col='darkblue',circle.col='brown',xlim=c(0,100))
 
    #plot error
    plot(seq(0,num.it)[c(1:i)],err.dat[,2][c(1:i)],type='l',col='darkgrey',bty='n',ylim=c(-0.1,0.5),
        xlim=c(-15,num.it+15),axes=F,ylab='RMSE',xlab='Iteration',lwd=2,cex.lab=1.3)
    axis(side=1,at=seq(0,num.it,length=5),line=-4)
    mtext(side=1,'Iteration',line=-2)
    axis(side=2,at=c(seq(0,0.4,length=5)),line=-3)
    mtext(side=2,'RMSE',line=-1)
    lines(seq(0,num.it)[c(1:i)],err.dat[c(1:i),1],type='l',col='red',lwd=2)
    lines(seq(0,num.it)[c(1:i)],err.dat[c(1:i),2],type='l',col='green',lwd=2)
   
    title(paste('Iteration',i,'of',num.it),outer=T,line=-2)
    }
  },
   
  interval = 0.15, ani.width = 700, ani.height = 350, ani.opts='controls'
   
  )