# make sure you've unzipped exdata_data_household_power_consumption file
## and your working directory is set at the exdata file. 
## read data from household power consumption data
dat <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", colClasses="character", sep=";")
## Extract only the data with date = 2007/2/1 & 20007/2/2
data <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]
## convert the Date & time to POSIXct format
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
## generate plot
png(file= "plot4.png", width= 480, height= 480)
par(mfrow = c(2,2))
with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(data, plot(DateTime, Voltage, type="l", xlab="datatime", ylab="Voltage"))
with(data, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(DateTime, Sub_metering_2, col= "red"))
with(data, lines(DateTime, Sub_metering_3, col= "blue"))
legend("topright", lty = 1, col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()