# plot4.R

# Read data
if (! file.exists("household_power_consumption.txt")) {
  system("tar xfvz household_power_consumption.tgz")
}

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F, na.strings = "?")
d1 <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
d1$DateTime <- strptime(paste(d1[, 1], d1[, 2], sep=" "), "%d/%m/%Y %H:%M:%S")

# Make png file
png(filename="./plot4.png", width=480, height=480, units="px", bg="transparent")
par(mfrow = c(2, 2))
with(d1, {
  plot(DateTime, Global_active_power, type="l", ylab="Global Active Power", xlab="")

  plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime")

  plot(d1$DateTime, d1$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
  lines(d1$DateTime, d1$Sub_metering_2, type="l", col="red")
  lines(d1$DateTime, d1$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=c(1, 1), bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})
dev.off()
