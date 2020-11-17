# Read the downloaded files

# Read the National emission data 

NED <-  readRDS("summarySCC_PM25.rds")

# Read the source Classification code

SCC <-  readRDS("Source_Classification_Code.rds")


# Cal. total emission from all sources from the year 1999- 2008

Total_Em <- aggregate(Emissions ~ year,NED, sum)

# Create a PNG plot

png("Plot1.png", width = 480, height = 480, units = "px")

barplot(Total_Em$Emissions/1000,Total_Em$year, names.arg = Total_Em$year, xlab = "years", ylab = expression('Total PM'[2.5]*' emission in kilotons'), main = "Emissions over the Years") # Dividing by 1000 since the emission is converted to Kilo tonnes from tonnes

dev.off()

