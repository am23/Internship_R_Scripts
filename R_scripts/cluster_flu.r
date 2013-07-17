 #cluster_flu.r
 #The following code creates clusters using k-means clustering.
 #b3.csv contains the information of the no. of people suffering from flu in Argentina,Austria,Belgium,Bolivia,Brazil,Canada,Chile,France,Germany,Japan,Mexico,Netherlands
 #The result files will be saved in pdf format in the documents folder. 

 
  #reading the excel file into R 
a <- read.csv("Supporting_datasets/b3.csv")

  #applying kmeans clustering and cluster size=5
 b<-kmeans(a, 5)
 
 
 #load the package cluster.
 library(cluster)
 
 
 #aggregate splits the data into subsets, computes summary statistics for each, and returns the result in a convenient form.
 aggregate(a,by=list(b$cluster),FUN=mean)
 
 
  #clusplot creates a bivariate plot visualizing a partition (clustering) of the data. 
  #All observation are represented by points in the plot, using principal components or multidimensional scaling. Around each cluster an ellipse is drawn.
jpeg(file = "results/result_cluster_flu/myplot.jpg")
clusplot(a, b$cluster, color=TRUE, shade=TRUE,labels=2, lines=0)
dev.off()

#END