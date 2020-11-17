# Load library 

library(ggplot2)

# Read the downloaded files

# Read the National emission data 

NED <-  readRDS("summarySCC_PM25.rds")

# Read the source classifictation code

SCC <-  readRDS("Source_Classification_Code.rds")

# Emission from motor motor vehicle sources from 1999-2008 in Baltimore and LA 

Both_Cities_Emission <- NED[(NED$fips=="24510"|NED$fips=="06037") & NED$type=="ON-ROAD",  ]

Total_Emission <-  aggregate(Emissions~year +fips, Both_Cities_Emission, sum)

Total_Emission$fips[Total_Emission$fips == '24510'] <-  'Baltimore'
Total_Emission$fips[Total_Emission$fips == '06037'] <-  'Los Angeles'

png("Plot6.png", width = 480, height = 480, units = 'px')

ggplot(Total_Emission, aes(x = factor(year), y = Emissions, fill = fips))+
      (facet_grid(fips~., scales = "free"))+
      geom_bar(stat = "Identity")+
      labs( x = "Years", y = expression("total PM"[2.5]*" emissions in tons"))+
      labs(title = expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))+
      theme(legend.title = element_blank())

dev.off()
            