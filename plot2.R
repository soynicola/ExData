# make sure you've unzipped exdata_data_household_power_consumption file
## and your working directory is set at the exdata file. 
## read data from household power consumption data
dat <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", colClasses="character", sep=";")
## Extract only the data with date = 2007/2/1 & 20007/2/2
data <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]
## convert the Date & time to POSIXct format
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
## generate plot
png(file= "plot2.png", width= 480, height= 480)
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()