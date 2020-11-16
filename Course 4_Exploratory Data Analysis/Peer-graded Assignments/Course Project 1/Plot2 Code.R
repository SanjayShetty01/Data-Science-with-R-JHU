#*************************************
# Reading the text file
#*************************************

Power_Consum_Data <- read.csv("household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE)


#Change classes of Date and Time variables

Power_Consum_Data$Date <- as.Date(Power_Consum_Data$Date, format = "%d/%m/%Y")
Power_Consum_Data$DateTime <- strptime(paste(Power_Consum_Data$Date,Power_Consum_Data$Time),
                                 format = "%Y-%m-%d %H:%M:%S")
#Choose data from "2007-2-1" to "2007-2-2"
data <- Power_Consum_Data[Power_Consum_Data$Date >= "2007-2-1" & Power_Consum_Data$Date <= "2007-2-2",]

data$Global_active_power <-  as.numeric(data$Global_active_power)


plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Open PNG device
png(file = "Plot2.png", width = 480, height = 480, units = "px")

# Generating Plot2
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
