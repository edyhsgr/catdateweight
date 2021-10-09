
catdateweight<-read.table(file="https://raw.githubusercontent.com/edyhsgr/catdateweight/main/catdateweight.csv",header=FALSE,sep=",")
names(catdateweight)<-c("date","weight")
catdateweight<-data.frame(catdateweight)
plot(catdateweight$weight,col="black",main="cat weight by date (grid lines for every ten days)",xlab="date (starting 20210623, at age four-to-six weeks)",
		ylab="weight (grams)",ylim=c(500,max(catdateweight$weight,na.rm=TRUE)*1.1),axes=FALSE)
	axis(side=2,cex.axis=0.75)
	axis(side=1,at=1:length(catdateweight$date),
		labels=substr(catdateweight$date,nchar(catdateweight$date)-4+1,
		nchar(catdateweight$date)),cex.axis=0.75,las=2)
	catdateweight_interp<-approx(catdateweight$weight,n=length(catdateweight$weight))
	abline(h=(catdateweight_interp$y[seq(1,10000,10)]),v=seq(1,10000,10),col="grey")
dailyweightchange<-catdateweight[2:nrow(catdateweight),2]-catdateweight[1:nrow(catdateweight)-1,2]
mean(dailyweightchange,na.rm=TRUE)                                        
quantile(dailyweightchange,c(0,.05,.25,.5,.75,.95,1),na.rm=TRUE)        
mean(tail(dailyweightchange,100),na.rm=TRUE)                               #(Last 100 days)
quantile(tail(dailyweightchange,100),c(0,.05,.25,.5,.75,.95,1),na.rm=TRUE) #(Last 100 days)

