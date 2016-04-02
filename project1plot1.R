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

#draw plot 1
png(file="plot1.png",width=480,height=480)
with(plotdata, hist(Global_active_power, freq=TRUE, main="Global active power", col="red"))
dev.off()