#Exploratory Data Analysis Week 1 Programming Assignment. Part 2
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
png(filename = "plot2.png", width = 480, height = 480, units = "px")
#Create the plot
plot(powerdata$datetime, powerdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
#Close the devise so that the png file is closed and available for viewing 
dev.off()

