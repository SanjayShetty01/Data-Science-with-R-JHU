#*************************************
# Reading the text file
#*************************************

Power_Consum_Data <- read.csv("household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE )

# Subsetting data from the dates 2007-02-01 and 2007-02-02

data <- subset(Power_Consum_Data, Date %in% c("1/2/2007","2/2/2007"))

#Converting Global_active_power obs from Chr to num Data type

data$Global_active_power <-  as.numeric(data$Global_active_power)

#************************************************
# Generating Plot1
#************************************************

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Creating a png plot files 

png("Plot1.png", width=480, height=480)

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()