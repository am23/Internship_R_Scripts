 #cluster_grade.r
 #The following code creates clusters using k-means clustering.
 #grades.csv contains the information of the grades of the student.
 #The result files will be saved in pdf format in the documents folder. 

 
  #reading the excel file into R 
a <- read.csv("Supporting_datasets/grades.csv")

  #applying kmeans clustering and cluster size=2
 b<-kmeans(a, 2)
 
 
 #load the package cluster.
 library(cluster)
 
 
 #aggregate splits the data into subsets, computes summary statistics for each, and returns the result in a convenient form.
 aggregate(a,by=list(b$cluster),FUN=mean)
 
 
  #clusplot creates a bivariate plot visualizing a partition (clustering) of the data. 
  #All observation are represented by points in the plot, using principal components or multidimensional scaling. Around each cluster an ellipse is drawn.
jpeg(file="results/result_cluster_grades/cluster_grades.jpg")
clusplot(a, b$cluster, color=TRUE, shade=TRUE,labels=2, lines=0)
dev.off()

#END
