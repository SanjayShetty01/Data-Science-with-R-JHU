# Load library 

library(ggplot2)

# Read the downloaded files

# Read the National emission data 

NED <-  readRDS("summarySCC_PM25.rds")

# Read the source classifictation code

SCC <-  readRDS("Source_Classification_Code.rds")

# Emission from motor motor vehicle sources from 1999-2008 in Baltimore
#Check EI.Sector values from SCC dataset and you could find all the motor vehicles classified as On Road Sources (Hint use Unique fn)

NED_MV <- NED[NED$fips=="24510" & NED$type=="ON-ROAD", ]

Total_Emission <-  aggregate(Emissions~year, NED_MV, sum)


# Create a PNG file

png("Plot5.png", height = 480, width = 480, units = "px")

ggplot(Total_Emission, aes(x = factor(year), y = Emissions))+
      geom_bar(stat = "Identity")+
      xlab("years")+
      ylab(expression('Total PM'[2.5]*" Emissions"))+
      labs(title =expression("PM"[2.5]*" Emissions from motor vehicles Baltimore US, 1999-2008"))+
      theme(plot.title = element_text(hjust = 0.5,face = "bold", size = 24))

dev.off()

