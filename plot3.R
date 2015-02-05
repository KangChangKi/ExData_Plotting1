# plot3.R

# Read data
if (! file.exists("household_power_consumption.txt")) {
  system("tar xfvz household_power_consumption.tgz")
}

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F, na.strings = "?")
d1 <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
d1$DateTime <- strptime(paste(d1[, 1], d1[, 2], sep=" "), "%d/%m/%Y %H:%M:%S")

# Make png file
png(filename="./plot3.png", width=480, height=480, units="px", bg = "transparent")
plot(d1$DateTime, d1$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(d1$DateTime, d1$Sub_metering_2, type="l", col="red")
lines(d1$DateTime, d1$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
