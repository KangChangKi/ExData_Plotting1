# plot2.R

# Read data
if (! file.exists("household_power_consumption.txt")) {
  system("tar xfvz household_power_consumption.tgz")
}

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F, na.strings = "?")
d1 <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
d1$DateTime <- strptime(paste(d1[, 1], d1[, 2], sep=" "), "%d/%m/%Y %H:%M:%S")

# Make png file
png(filename="./plot2.png", width=480, height=480, units="px", bg = "transparent")
plot(d1$DateTime, d1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
