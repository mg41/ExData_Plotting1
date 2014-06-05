data<-read.csv("household_power_consumption.txt", sep=";", colClasses="character")
x <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
datetime <- paste(x[,1], x[,2])
datetime <- strptime(datetime, format="%e/%m/%Y %H:%M:%S")
x$Time <- datetime
gap <- as.numeric(x$Global_active_power)

png(filename="plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()