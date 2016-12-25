## Read data
datafile <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
datafile$Date <- as.Date(datafile$Date, format="%d/%m/%Y")

## Subsetting Data
datafile2 <- subset(datafile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting date & time
datafile2$datetime <- strptime(paste(datafile2$Date, datafile2$Time), "%Y-%m-%d %H:%M:%S")

## Open Device
png(filename = './plot4.png', width = 480, height = 480, units="px")

## plot Figure 4
par(mfrow = c(2, 2))
plot(datafile2$datetime, datafile2$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", type = "l")
plot(datafile2$datetime, datafile2$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(datafile2$datetime, datafile2$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(datafile2$datetime, datafile2$Sub_metering_2, col = "red")
lines(datafile2$datetime, datafile2$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
plot(datafile2$datetime, datafile2$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')

## close device
dev.off()
