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

#draw plot 2
png(file="plot2.png",width=480,height=480)
with(plotdata, plot(Global_active_power, type = "l", ylab="Global active power (kilowatts)", xlab="", xaxt="n"))
axis(1, at=c(0,1500,2900), labels=c("Thu", "Fri","Sat"))
dev.off()
