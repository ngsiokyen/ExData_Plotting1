## Read Data
datafile <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
datafile$Date <- as.Date(datafile$Date, format="%d/%m/%Y")

## Subsetting Data
datafile2 <- subset(datafile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting date & time
datafile2$datetime <- strptime(paste(datafile2$Date, datafile2$Time), "%Y-%m-%d %H:%M:%S")

## Open Device
png(filename = './plot3.png', width = 480, height = 480, units="px")

## Plot Figure 3
plot(datafile2$datetime, datafile2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datafile2$datetime, datafile2$Sub_metering_2, col = "Red")
lines(datafile2$datetime, datafile2$Sub_metering_3, col = "Blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)

## Close Device
dev.off()
