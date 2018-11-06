library(ggplot2)
library(grid)
library(gridextra)

setwd("/Users/bridgetmoroney/Desktop/")
#loading data for plot
workData=read.table("canadaWorkData.txt",header=TRUE,sep="\t",stringsAsFactors = FALSE)                                                                                                                                                                                                                                                                                                                
#seeing first 6 lines of data
head(workData)
#creating plot of % participation for women vs. time
plot=ggplot(data=workData,aes(x=X,y=partic))
#customizing graph to remove grey and add trendline
plot+geom_point(color="midnightblue")+coord_cartesian()+ylab("Percent Participation")+xlab("Year")+ggtitle("Canadian Women Workforce Participation")+theme_bw()+stat_smooth(method="lm")

setwd("/Users/bridgetmoroney/Desktop/Biocomp-Fall2018-181102-Exercise9/")
#loading data.txt information
data9=read.table("data.txt",header=TRUE,sep=",",stringsAsFactors = FALSE)
#creating new dataframe that has the mean observation for each region
meanDF=aggregate(formula=observations~region,data=data9,FUN=mean)
#creating plot with mean data
plot2=ggplot(data=meanDF, aes(x=region, y=observations))
#customizing plot to be a bar plot with labels and classic theme
plot2+geom_bar(aes(color=region,fill=region), stat="identity")+theme_classic()+geom_text(data=meanDF,aes(label=round(observations,digits=3),y=observations-1))+xlab("Region")+ylab("Mean Observation")+ggtitle("Mean Observation by Region")

#making scatter plot of all observations using original data
plot3=ggplot(data=data9,aes(x=region,y=observations))
#using jitter to show scatter by region
plot3+geom_jitter(aes(color=region),size=0.5)+theme_classic()+ggtitle("Observations for Each Region")+xlab("Region")+ylab("Observations")

#The two plots tell a very different story. The bar chart is communicating one number for each 
#region (the mean) and comparing that number to every other region. In the case of the jitter plot,
#it becomes a lot clearer that although all the regions have a similar mean, the observations are
#distributed in very different ways. I believe the jitter plot is much more informative about the
#data as a whole and still hints that the average of the observations for each region should be similar
