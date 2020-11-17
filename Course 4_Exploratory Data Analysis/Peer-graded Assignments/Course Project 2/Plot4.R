# Load library 

library(ggplot2)

# Read the downloaded files

# Read the National emission data 

NED <-  readRDS("summarySCC_PM25.rds")

# Read the source classifictation code

SCC <-  readRDS("Source_Classification_Code.rds")

Merged_data <- merge(NED, SCC)


# Subseting Coal related emissions 

Coal_Emission <-  grepl('Coal', Merged_data$Short.Name, ignore.case = T)

Coal_Emission_Data <-  Merged_data[Coal_Emission,]


Total_Coal_Emission <-  aggregate(Emissions~year, Coal_Emission_Data, sum)

Total_Coal_Emission$year <- as.factor(Total_Coal_Emission$year)

# Create a PNG file

png("Plot4.png", width = 1080, height = 720, units = "px")

ggplot(Coal_Emission_Data, aes(x = factor(year), y = Emissions/1000))+
  geom_bar(stat = "Identity")+
  labs( x = "Years", y=expression("Total PM "[2.5]*"Emission from Coal (Kilo Tons)"))+
  labs(title =expression("PM"[2.5]*" Emissions from Coal combustion-related sources in US, 1999-2008"))+
  theme(plot.title = element_text(hjust = 0.5,face = "bold", size = 24))

dev.off()


  

