#Exploratory Data Analysis Week 1 Programming Assignment. Part 3
#Load  data from the txt file (; delimitter), format defined in the documentation
#Assumption: THe data file "household_power_consumption.txt" is available in the working directory

#Note:
# I am not encapsulating this in a separate function to run all these commands together. 
# Each step has to be executed in sequence i.e. run the entire file. 
# It is easy to wrap all these steps in a single function but it is not an explicit requirement for this assignment

#Load the data from txt file to dataframe
powerdata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",na.strings=c("","?"))
#subset the data beacuse we need data only for 1/2/2007 and 2/2/2007 (d/m/Y format)
powerdata <- subset(powerdata,  Date == "1/2/2007"|Date == "2/2/2007" )
#add a Datetime vector column by combining and reformatting the Date an Time columns
powerdata$datetime <- strptime(paste(powerdata$Date, powerdata$Time), "%d/%m/%Y %H:%M:%S")

#Open png file with predefined size
png(filename = "plot3.png", width = 480, height = 480, units = "px")
#Create the plot
with(powerdata,{
     plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="")
     lines(datetime, Sub_metering_2, type = "l", col="red")
     lines(datetime, Sub_metering_3, type = "l", col="blue")
     legend("topright", lty=c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
#Close the devise so that the png file is closed and available for viewing 
dev.off()

