hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
hpc$DateTime = paste(hpc$Date, hpc$Time)
hpc$DateTime = as.POSIXlt(hpc$DateTime,format="%d/%m/%Y %H:%M:%S")
hpc$Date = NULL
hpc$Time = NULL

subhpc <- subset(hpc,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot3.png",width=480,height=480)
plot(x=(subhpc$DateTime),y=subhpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(subhpc$DateTime),y=subhpc$Sub_metering_2,col="red")
lines(x=(subhpc$DateTime),y=subhpc$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
dev.off()
