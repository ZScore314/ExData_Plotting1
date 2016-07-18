hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
hpc$DateTime = paste(hpc$Date, hpc$Time)
hpc$DateTime = as.POSIXlt(hpc$DateTime,format="%d/%m/%Y %H:%M:%S")
hpc$Date = NULL
hpc$Time = NULL

subhpc <- subset(hpc,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot2.png",width=480,height=480)
plot(x=(subhpc$DateTime),y=subhpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()