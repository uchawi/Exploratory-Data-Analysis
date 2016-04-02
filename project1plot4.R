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

#draw plot 4
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(plotdata, {
  with(plotdata, plot(Global_active_power, type = "l", ylab="Global active power", xlab="", xaxt="n"))
  axis(1, at=c(0,1500,2900), labels=c("Thu", "Fri","Sat"))
  
  plot(Voltage, type = "l", xlab="datetime", xaxt="n")
  axis(1, at=c(0,1500,2900), labels=c("Thu", "Fri","Sat"))
  
  plot(Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="", xaxt="n")
  lines(Sub_metering_2, col="red")
  lines(Sub_metering_3, col="blue")
  axis(1, at=c(0,1500,2900), labels=c("Thu", "Fri","Sat"))
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, cex = 0.5, bty = "n")
  
  plot(Global_reactive_power, type = "l", xlab="datetime", xaxt="n")
  axis(1, at=c(0,1500,2900), labels=c("Thu", "Fri","Sat"))
  
}
)
dev.off()