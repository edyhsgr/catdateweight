
catdateweight<-data.frame(read.table(file="https://raw.githubusercontent.com/edyhsgr/catdateweight/main/catdateweight.csv",header=FALSE,sep=","))
	names(catdateweight)<-c("date","weight","note")

catdateweight$change[2:nrow(catdateweight)]<-catdateweight$weight[2:nrow(catdateweight)]-catdateweight$weight[1:nrow(catdateweight)-1]
catdateweight$pctchange[2:nrow(catdateweight)]<-catdateweight$change[2:nrow(catdateweight)]/catdateweight$weight[1:nrow(catdateweight)-1]

catdateweight_interp<-approx(catdateweight$weight,n=length(catdateweight$weight))	#Only for gridlines on missing data
	names(catdateweight_interp)<-c("date","weight")

plot(catdateweight$weight,
     panel.first=abline(h=(catdateweight_interp$weight[seq(1,10000,10)]),v=seq(1,10000,10),col="grey"),
     col="black",main="cat weight by date (grid lines for every ten days)",
		xlab="date (starting 20210623, at age four-to-six weeks)",
		ylab="weight (grams)",ylim=c(500,max(catdateweight$weight,na.rm=TRUE)*1.1),axes=FALSE)
	axis(side=2,cex.axis=0.75)
	axis(side=1,at=1:length(catdateweight$date),
		labels=substr(catdateweight$date,nchar(catdateweight$date)-4+1,
		nchar(catdateweight$date)),cex.axis=0.75,las=2)

Sys.sleep(5)

plot(catdateweight$change,
     panel.first=abline(h=seq(-100,100,50),v=seq(1,10000,10),col="grey"),
     main="cat weight change by date",
		xlab="date (starting 20210623, at age four-to-six weeks)",
		ylab="daily weight change (grams)",ylim=c(-100,100),axes=FALSE)
	axis(side=2,cex.axis=0.75)
	axis(side=1,at=1:length(catdateweight$date),
		labels=substr(catdateweight$date,nchar(catdateweight$date)-4+1,
		nchar(catdateweight$date)),cex.axis=0.75,las=2)

mean(catdateweight$change,na.rm=TRUE)                                        
quantile(catdateweight$change,c(0,.05,.25,.5,.75,.95,1),na.rm=TRUE)        
#mean(tail(catdateweight$change,100),na.rm=TRUE)                               		#Last 100 days
#quantile(tail(catdateweight$change,100),c(0,.05,.25,.5,.75,.95,1),na.rm=TRUE) 		#Last 100 days

Sys.sleep(5)

plot(catdateweight$pctchange,
     panel.first=abline(h=seq(-.1,.1,.01),v=seq(1,10000,10),col="grey"),
     main="cat weight change by date",
		xlab="date (starting 20210623, at age four-to-six weeks)",
		ylab="daily weight change (percent)",ylim=c(-.1,.1),axes=FALSE)
	axis(side=2,cex.axis=0.75)
	axis(side=1,at=1:length(catdateweight$date),
		labels=substr(catdateweight$date,nchar(catdateweight$date)-4+1,
		nchar(catdateweight$date)),cex.axis=0.75,las=2)

mean(catdateweight$pctchange,na.rm=TRUE)                                        
quantile(catdateweight$pctchange,c(0,.05,.25,.5,.75,.95,1),na.rm=TRUE)        
#mean(tail(catdateweight$pctchange,100),na.rm=TRUE)                               		#Last 100 days
#quantile(tail(catdateweight$pctchange,100),c(0,.05,.25,.5,.75,.95,1),na.rm=TRUE) 	#Last 100 days

