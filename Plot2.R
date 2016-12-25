## Read Data
 <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
datafile$Date <- as.Date(datafile$Date, format="%d/%m/%Y")

## Subsetting Data
datafile2 <- subset(datafile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting date & time
datafile2$datetime <- strptime(paste(datafile2$Date, datafile2$Time), "%Y-%m-%d %H:%M:%S")

## Plot Figure 2
plot(datafile2$datetime, datafile2$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
