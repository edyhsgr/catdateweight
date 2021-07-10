
catdateweight<-read.table(file="C:/Users/ehunsing/Desktop/catdateweight.csv",header=FALSE,sep=",")
names(catdateweight)<-c("date","weight")
catdateweight<-data.frame(catdateweight)
plot(catdateweight$weight)
dailyweightchange<-catdateweight[2:nrow(catdateweight),2]-catdateweight[1:nrow(catdateweight)-1,2]
median(dailyweightchange,na.rm=TRUE)
mean(dailyweightchange,na.rm=TRUE)
