# Copyright Prof M Campbell. 1 November 2026. All rights reserved.
# Script to READ in insideairbnb data: CLEAN, CURATE & MAP.
pacman::p_load(sf, readr, tidyverse, ggplot2, tmap)
# tmap (version 4) examples https://r-tmap.github.io/tmap/articles/01_tmap_intro_v4.html

#####################################################################################

# Insideairbnb.com
# https://data.insideairbnb.com/new-zealand/2026-09-13/visualisations/listings.csv
# step 1 - read in Airbnb scraped data
# step 2 - have a look and clean if needed
# step 3 - map

#####################################################################################
# Sept 2026		- Airbnb
AirBnBNZSep_2026	<- read_csv ( "https://raw.githubusercontent.com/malcolmcampbell/mapchallenge30day2026/refs/heads/main/data/nz_sep_2026.csv" )
glimpse(AirBnBNZSep_2026)
# CLEAN UP - REDUCES NUMBER OF COLUMNS - only christchurch
AirBnBNZSep_2026 <- AirBnBNZSep_2026 |> 
  filter(neighbourhood_group=="Christchurch City")|> 
  select (latitude, longitude)
glimpse(AirBnBNZSep_2026)
AirBnBNZSep_2026_sf <- st_as_sf(AirBnBNZSep_2026, coords = c("longitude", "latitude"), crs = 4326)
st_crs(AirBnBNZSep_2026)
plot(st_geometry(AirBnBNZSep_2026_sf))

AirBnBNZSep_2026_sf$AIRBNB <- 1
CHCH_TA <- st_read("https://raw.githubusercontent.com/malcolmcampbell/mapchallenge30day2026/refs/heads/main/data/CHCH_TA.gpkg")

# tmap v4
day1map <- tm_shape(CHCH_TA) + 
  tm_polygons(fill="grey70", fill_alpha = 0.4) +
  tm_shape(AirBnBNZSep_2026_sf) +
  tm_symbols(fill = "seagreen", size=0.01, shape = 20 ) +
  tm_layout(frame = FALSE) 
day1map
tmap_save(day1map, filename="./maps/day1map_tmap.png", 
          width=210, height=297, dpi = 300, units="mm")
#END