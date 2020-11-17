# Load library 

library(ggplot2)


# Read the downloaded files

# Read the National emission data 

NED <-  readRDS("summarySCC_PM25.rds")

# Read the source classifictation code

SCC <-  readRDS("Source_Classification_Code.rds")


# Extracting Baltimore from NED

Baltimore_ED <- NED[NED$fips == "24510",]

# Create a PNG plot

png("Plot3.png", width = 1080, height = 720, units = "px")

ggplot(Baltimore_ED, aes(x= factor(year), y = Emissions, fill = type))+
  geom_bar(stat = "Identity")+
  facet_grid(.~type)+
  labs( x = "Years", y=expression("Total PM "[2.5]*" Emission (Tons)"))+
  labs(title =expression("PM"[2.5]*" Emissions in Baltimore City 1999-2008 by Different Source Type"))+
  theme(plot.title = element_text(hjust = 0.5,face = "bold", size = 24))

         

dev.off()