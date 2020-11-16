#*************************************
# Reading the text file
#*************************************

Power_Consum_Data <- read.csv("household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE)


# All plot codes compiled

#*************************************
# Plot1
#*************************************

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



#*************************************
# Plot2
#*************************************

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


#*************************************
# Plot3
#*************************************


#Change classes of Date and Time variables

Power_Consum_Data$Date <- as.Date(Power_Consum_Data$Date, format = "%d/%m/%Y")
Power_Consum_Data$DateTime <- strptime(paste(Power_Consum_Data$Date,Power_Consum_Data$Time),
                                       format = "%Y-%m-%d %H:%M:%S")
#Choose data from "2007-2-1" to "2007-2-2"
data <- Power_Consum_Data[Power_Consum_Data$Date >= "2007-2-1" & Power_Consum_Data$Date <= "2007-2-2",]

#*******************************************
# Generating plot 
#*******************************************

with(data, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",
                xlab = "", ylab = "Energy sub metering"))
axis(side = 1, at = c(as.numeric(data$DateTime[1]),
                      as.numeric(data$DateTime[1441]),
                      as.numeric(data$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(data, lines(DateTime, Sub_metering_1))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Open PNG device 
png(file = "Plot3.png", width = 480, height = 480, units = "px")



with(data, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",
                xlab = "", ylab = "Energy sub metering"))
axis(side = 1, at = c(as.numeric(data$DateTime[1]),
                      as.numeric(data$DateTime[1441]),
                      as.numeric(data$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(data, lines(DateTime, Sub_metering_1))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()



#*************************************
# Plot4
#*************************************



#Change classes of Date and Time variables

Power_Consum_Data$Date <- as.Date(Power_Consum_Data$Date, format = "%d/%m/%Y")
Power_Consum_Data$DateTime <- strptime(paste(Power_Consum_Data$Date,Power_Consum_Data$Time),
                                       format = "%Y-%m-%d %H:%M:%S")
#Choose data from "2007-2-1" to "2007-2-2"
data <- Power_Consum_Data[Power_Consum_Data$Date >= "2007-2-1" & Power_Consum_Data$Date <= "2007-2-2",]


#*******************************************
# Generating plot 
#*******************************************


par(mfrow = c(2,2))
#Plot at topleft
with(data, plot(DateTime, Global_active_power, type = "l", xlab = "",
                ylab = "Global Active Power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(data$DateTime[1]),
                      as.numeric(data$DateTime[1441]),
                      as.numeric(data$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Plot at topright
with(data, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage",
                xaxt = "n"))
axis(side = 1, at = c(as.numeric(data$DateTime[1]),
                      as.numeric(data$DateTime[1441]),
                      as.numeric(data$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Plot at bottomleft
with(data, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",
                xlab = "", ylab = "Energy sub metering"))
axis(side = 1, at = c(as.numeric(data$DateTime[1]),
                      as.numeric(data$DateTime[1441]),
                      as.numeric(data$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(data, lines(DateTime, Sub_metering_1))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot at bottomright
with(data, plot(DateTime, Global_reactive_power, type= "l", xlab = "datetime", 
                ylab = "Global_reactive_power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(data$DateTime[1]),
                      as.numeric(data$DateTime[1441]),
                      as.numeric(data$DateTime[2880])),labels = c("Thu","Fri","Sat"))



# Open PNG device 
png(file = "Plot4.png", width = 480, height = 480, units = "px") 



par(mfrow = c(2,2))
#Plot at topleft
with(data, plot(DateTime, Global_active_power, type = "l", xlab = "",
                ylab = "Global Active Power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(data$DateTime[1]),
                      as.numeric(data$DateTime[1441]),
                      as.numeric(data$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Plot at topright
with(data, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage",
                xaxt = "n"))
axis(side = 1, at = c(as.numeric(data$DateTime[1]),
                      as.numeric(data$DateTime[1441]),
                      as.numeric(data$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Plot at bottomleft
with(data, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",
                xlab = "", ylab = "Energy sub metering"))
axis(side = 1, at = c(as.numeric(data$DateTime[1]),
                      as.numeric(data$DateTime[1441]),
                      as.numeric(data$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(data, lines(DateTime, Sub_metering_1))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot at bottomright
with(data, plot(DateTime, Global_reactive_power, type= "l", xlab = "datetime", 
                ylab = "Global_reactive_power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(data$DateTime[1]),
                      as.numeric(data$DateTime[1441]),
                      as.numeric(data$DateTime[2880])),labels = c("Thu","Fri","Sat"))

dev.off()