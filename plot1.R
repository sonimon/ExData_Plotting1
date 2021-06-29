powerdata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",na.strings=c("","?"))
powerdata <- subset(powerdata,  Date == "1/2/2007"|Date == "2/2/2007" )
powerdata$datetime <- strptime(paste(powerdata$Date, powerdata$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(powerdata$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()