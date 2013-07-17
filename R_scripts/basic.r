 #basic.r
 #The following code creates bar graphs and plots for Argentina.
 #argentina_data.csv contains no of people sufferinf from flu in argentina (2002-2013)
 #The result files will be saved in pdf format in the documents folder.
 
 
   #reading the excel file into R
 a<-read.csv("Supporting_datasets/argentina_data.csv")
 
   #plotting no of people suffering(y axis) vs time(x axis).
jpeg(file = "results/result_basic/plot1.jpg")
 plot(a[,1],a[,2])
 dev.off()


  #plotting a bar graph for the data. 
jpeg(file = "results/result_basic/plot2.jpg")
 barplot(a[,2],main="Argentina Flu Graph",xlab="No. of people")
 dev.off()
 
 
 #END