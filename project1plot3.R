##########################################################
# read data
data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", dec=".", na.strings="?", 
                 colClasses=c("character","character",rep("numeric",7)),comment.char = "")
# date format 
data$newdate <- strptime(as.character(data$Date), "%d/%m/%Y")
data$newtime <- strptime(as.character(data$Time), "%H:%M:%S")


# select data
plotdata<-subset(data, (data$newdate >= ("2007-02-01") & data$newdate <= ("2007-02-02")))
plotdata<-plotdata[plotdata$Date!="?" | plotdata$Global_active_power!="?", ]

#draw plot 3
png(file="plot3.png",width=480,height=480)
with(plotdata, plot(Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="", xaxt="n"))
with(plotdata, lines(Sub_metering_2, col="red"))
with(plotdata, lines(Sub_metering_3, col="blue"))
axis(1, at=c(0,1500,2900), labels=c("Thu", "Fri","Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, cex = 0.8)
dev.off()
