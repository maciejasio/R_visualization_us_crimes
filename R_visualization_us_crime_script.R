# {Adapted from Mahbubul Majumder and course materials from Stanford University}
# Step 0 : Install packages and load them
install.packages("maps")
install.packages("ggmap")
install.packages("mapproj")
library(maps)
library(ggmap) 
library(mapproj)
library(ggplot2)
library(dplyr)
library(plyr)

# Step 1: Create the basic map

dfworldmap <- map_data("world")
ggplot() + geom_polygon(aes(x = long, y = lat, group = group), 
                        fill = "grey65", data = dfworldmap) + theme_bw()

# Step 2 : Format data for chloropleth map of the 1973 murder rates

us <- map_data("state")
head(us)
head(USArrests) 

# Step 3 : Resolve the mismatch between region and state

arrest <- USArrests %>% add_rownames("region") %>% mutate(region = tolower(region))
head(arrest)

# Step 4 : Plot the base map layer

g <- ggplot()
g <- g + geom_map(data = us, map = us, aes(x = long, y = lat, map_id = region), fill = "#ffffff", color = "#ffffff", size = 0.15)
g

# Step 5 : Add the arrest data

g <- g + geom_map(data = arrest, map = us, aes(fill = Murder, map_id = region), color = "#ffffff", size = 0.15)
g

# Step 6 : Make it look pretty

g <- g + scale_fill_continuous(low = 'thistle2', high = 'darkblue', guide = 'colorbar') + xlab("")
g <- g + theme(panel.border = element_blank())
g





