
catdateweight<-read.table(file="https://raw.githubusercontent.com/edyhsgr/catdateweight/main/catdateweight.csv",header=FALSE,sep=",")
names(catdateweight)<-c("date","weight")
catdateweight<-data.frame(catdateweight)
plot(catdateweight$weight,main="cat weight by date",xlab="date (starting 20210623, at age four-to-six weeks)",ylab="weight (grams)",axes=FALSE)
  axis(side=2,cex.axis=0.75)
  axis(side=1,at=1:length(catdateweight$date),labels=substr(catdateweight$date,nchar(catdateweight$date)-4+1,nchar(catdateweight$date)),cex.axis=0.75,las=2)
dailyweightchange<-catdateweight[2:nrow(catdateweight),2]-catdateweight[1:nrow(catdateweight)-1,2]
mean(dailyweightchange,na.rm=TRUE)
median(dailyweightchange,na.rm=TRUE)
max(dailyweightchange,na.rm=TRUE)
min(dailyweightchange,na.rm=TRUE)

