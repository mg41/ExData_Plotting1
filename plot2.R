data<-read.csv("household_power_consumption.txt", sep=";", colClasses="character")
x <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
datetime <- paste(x[,1], x[,2])
datetime <- strptime(datetime, format="%e/%m/%Y %H:%M:%S")
x$Time <- datetime
x$Time <- as.POSIXct(x$Time) #necessary to prevent a plotting error


png(filename="plot2.png", width=480, height=480)
plot(x$Time, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()