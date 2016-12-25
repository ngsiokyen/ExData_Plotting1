## Read Data
datafile <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
## Subsetting data
datafile2 <- subset(datafile,datafile$Date=="1/2/2007" | datafile$Date =="2/2/2007")

## Plot Figure 1
hist(datafile2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()



