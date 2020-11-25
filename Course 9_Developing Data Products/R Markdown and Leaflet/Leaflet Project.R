# Load the librabry

library(leaflet)

# Create a Icon

Taj_Mahal_Icon <- makeIcon(
                  iconUrl = "C:/Users/HP/Downloads/TajMahal.png",
                  iconWidth = 31*215/230, iconHeight =31,
                  iconAnchorX = 31*215/230/2, iconAnchorY = 16
)

my_map <- leaflet() %>%
            addTiles() %>%
            addMarkers( lng = 78.0421, lat = 27.1751,icon = Taj_Mahal_Icon, popup = "Taj Mahal - Symbol of LOVE")

my_map
