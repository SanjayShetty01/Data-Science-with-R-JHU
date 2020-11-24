# Loading library

library(ggplot2)
library(plyr)
library(dplyr)



# Load the Dataset

StormData <-  read.csv("repdata_data_StormData.csv", header = T, sep = ",")

# Since we need to find the which types of events are most harmful with respect to population health and Across the United States, which types of events have the greatest economic consequences.
# Hence We need colnames like EV.TYPE, FATALITIES INJURIES AND COLNAMES CONTAINING DMG word (Short for Damage)

# 1)which types of events are most harmful with respect to population health and Across the United States?

# Preparing data

Death_Data <- data_frame(StormData$EVTYPE, StormData$FATALITIES)
colnames(Death_Data) <- c("EVTYPE", "FATALITIES")


Inj_Data <-  data_frame(StormData$EVTYPE, StormData$INJURIES)
colnames(Inj_Data) <-  c("EVTYPE", "INJURIES")

# Gauging the total health damage by summing the fatalities and injuries over various events

Total_Death <- aggregate(FATALITIES~EVTYPE,Death_Data, sum)

# Taking only top 10 values

Total_Death <- head(Total_Death[order(Total_Death$FATALITIES, decreasing = T), ], n = 10)

Total_Inj <-  aggregate(INJURIES~EVTYPE, Inj_Data, sum)

#Taking only top 10 values

Total_Inj <-head(Total_Inj[order(Total_Inj$INJURIES, decreasing = T),], n =10)

# Graphical representation of Total death and Injuries by various calamities

ggplot(Total_Death)+
        geom_col(aes(EVTYPE,FATALITIES, fill = "Pink"))+
        theme(axis.text.x = element_text(angle =90), legend.position = "None")+
        expand_limits(y = c(0,6000))+
        labs(title = "Graphical representation of Total death by various natural calamities", x = "Event Type", y = "Total number of Fatalities")

ggplot(Total_Inj)+
  geom_col(aes(EVTYPE,INJURIES, fill = "Pink"))+
  theme(axis.text.x = element_text(angle =90), legend.position = "None")+
  labs(title = "Graphical representation of Total Injuries by various natural calamities", x = "Event Type", y = "Total number of Injuries")


# Across the United States, which types of events have the greatest economic consequences?
# Extract Data from "PRODMG" "PRODMGXP" "CROPDMG" "CROPDMG" columns

# Pre-processing of data.

StormData$CROPDMGEXP <- mapvalues(StormData$CROPDMGEXP, from = c("","M", "K", "m", "B","?","0","k","2"), 
                                 to = c(0,10^6, 10^3, 10^6, 10^9, 0,0,10^3,0))


StormData$PROPDMGEXP <- mapvalues(StormData$PROPDMGEXP, from = c("K","M","","B","m","+","0","5","6","?","4","2","3","h","7","H","-","1","8"),
                                                        to = c(10^3,10^6,0,10^9,10^6,0,0,10^5,10^6,0,10^4,10^2,10^3,10^6,10^7,10^6,0,1,10^8))

StormData$CROPDMGEXP <- as.numeric(StormData$CROPDMGEXP)
StormData$PROPDMGEXP <- as.numeric(StormData$PROPDMGEXP)

StormData$Actual_CROPDMG <- (StormData$CROPDMG * StormData$CROPDMGEXP)/10^9
StormData$Actual_PROPDMG <- (StormData$PROPDMG * StormData$PROPDMGEXP)/10^9


StormData$TOTAL_DAMAGE <- StormData$Actual_CROPDMG + StormData$Actual_PROPDMG


Total_ECON_DAMAGE <-  aggregate(TOTAL_DAMAGE~EVTYPE, StormData,sum)

# Top 10 events with most economic damages

Total_ECON_DAMAGE <- head(Total_ECON_DAMAGE[order(Total_ECON_DAMAGE$TOTAL_DAMAGE, decreasing = T),], n =10)


# Graphical representation of Total economic damage by various calamities


ggplot(Total_ECON_DAMAGE)+
  geom_col(aes(EVTYPE,TOTAL_DAMAGE, fill = "Pink"))+
  theme(axis.text.x = element_text(angle =90), legend.position = "None")+
  labs(title = "Graphical representation of Total Economic Cost by various natural calamities", x = "Event Type", y = "Total Economic Cost \n(in $ Billions)")

