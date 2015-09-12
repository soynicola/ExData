## make sure you've unzipped exdata_data_household_power_consumption file
## and your working directory is set at the exdata file. 
## read data from household power consumption data
dat <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", colClasses="character", sep=";")
## Extract only the data with date = 2007/2/1 & 20007/2/2
data <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]
## Create png file for histogram plot
png(file= "plot1.png", width= 480, height= 480)
hist(as.numeric(data$Global_active_power), col= "red", main= "Global Active Power", xlab= "Global Active Power (kilowatts)")
dev.off()