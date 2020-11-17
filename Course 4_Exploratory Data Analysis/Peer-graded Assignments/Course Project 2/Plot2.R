# Read the downloaded files

# Read the National emission data 

NED <-  readRDS("summarySCC_PM25.rds")

# Read the source classifictation code

SCC <-  readRDS("Source_Classification_Code.rds")

# Extracting Baltimore from NED

Baltimore_ED <- NED[NED$fips == "24510",]  

# Aggregate using the total emission from Baltimore emission over the years

Total_Baltimore_ED <- aggregate(Emissions~year, Baltimore_ED,sum)

# Create a PNG plot

png("Plot2.png", width = 480, height = 480, units = "px")

barplot(Total_Baltimore_ED$Emissions/1000, Total_Baltimore_ED$year, names.arg = Total_Baltimore_ED$year, xlab = "years", ylab = expression('Total PM'[2.5]*' emission in kilotons'), main = "Emissions over the Years in Baltimore") # Dividing by 1000 since the emission is converted to Kilo tonnes from tonnes

dev.off()


