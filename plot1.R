# plot1.R

setClass("myDate")
setClass("myTime")

setAs("character","myDate", function(from) as.Date(from, "%d/%m/%Y"))
setAs("character","myTime", function(from) strptime(from, "%H:%M:%S"))

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F, colClasses=c("myDate", "myTime", rep("double", 7)), na.strings = "?")
d1 <- data[data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d"), ]

png(filename="./plot1.png", width=480, height=480, units="px", bg = "transparent")
hist(d1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()
