data<-read.csv("household_power_consumption.txt", sep=";", colClasses="character")
x <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
datetime <- paste(x[,1], x[,2])  #these three lines combine the date and time into one column
datetime <- strptime(datetime, format="%e/%m/%Y %H:%M:%S")
x$Time <- datetime


x$Time <- as.POSIXct(x$Time)
png(filename="plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot(x$Time, x$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(x$Time, x$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(x$Time, x$Sub_metering_2, type="l", col="red")
points(x$Time, x$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n")

plot(x$Time, x$Voltage, type="l", xlab="datetime", ylab="Voltage", lwd=0.1)

plot(x$Time, x$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", lwd=0.1)
dev.off()