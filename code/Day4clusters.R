# Copyright Prof M Campbell. 4 November 2026. All rights reserved.
# Script for Day4 Clusters
# Date 	      Name 	    Description
# 04-11-2026 	Clusters 	Clusters of something. Hotspots, groups, things that gather together.
# Building on Day 1 points
pacman::p_load(sf, readr, tidyverse, ggplot2, tmap, sfhotspot)
# clustering with points example
# https://cran.r-project.org/web/packages/sfhotspot/vignettes/introduction.html
# This ESRI version is also very useful for spatio-temporal 
# https://hed.esri.ca/resourcefinder/data/files/HotSpotAnalysis.pdf

#####################################################################################
# Insideairbnb.com
# https://data.insideairbnb.com/new-zealand/2026-09-13/visualisations/listings.csv
# step 1 - read in Airbnb scraped data
# step 2 - have a look and clean if needed
# step 3 - map clusters, kde

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
#
CHC <- st_read("https://raw.githubusercontent.com/malcolmcampbell/mapchallenge30day2026/refs/heads/main/data/CHCH_TA.gpkg")
st_crs(CHC)
plot(st_geometry(CHC))
# basic map
ggplot(AirBnBNZSep_2026_sf) + 
  geom_sf(alpha = 0.2) + 
  geom_sf(data=CHC, alpha = 0.2) + 
  theme_minimal()
ggsave("./maps/Day4points_CHC.png")
#
point_counts <- hotspot_count(AirBnBNZSep_2026_sf)
point_counts
#
ggplot() +
  geom_sf(
    mapping = aes(fill = n),
    data = point_counts,
    alpha = 0.75,
    colour = NA
  ) +
  scale_fill_distiller(direction = 1)
#
airbnb_kde <- hotspot_kde(AirBnBNZSep_2026_sf, grid_type = "hex", 
                          bandwidth = 100, bandwidth_adjust = 2) |>
  hotspot_clip(CHC)
airbnb_kde

#grid_type specifies whether the grid should be made up of squares (“rect”, the default) or hexagons (“hex”).

ggplot() +
  geom_sf(
    mapping = aes(fill = kde),
    data = airbnb_kde,
    alpha = 0.75,
    colour = NA
  ) +
  scale_fill_distiller(direction = 1) 
 
#
ggplot() +
  geom_sf(mapping = aes(fill = kde), data = airbnb_kde, alpha = 0.75, colour = NA ) +
  scale_fill_distiller(direction = 1) +
  geom_sf(data = CHC, color = "firebrick", fill = NA, linewidth = .6,  alpha= 0.9  ) 
ggsave("./maps/Day4clusterKDE_CHC.png")

# removing all the zero VALUES
ggplot() +
  geom_sf(mapping = aes(fill = ifelse(kde == 0, NA, kde)), 
                        data = airbnb_kde, alpha = 0.75, colour = NA)  +
  scale_fill_distiller(direction = 1, na.value = NA, name = "Airbnb\nHotspots") +
  
  geom_sf(data = CHC, color = "firebrick", fill = NA, linewidth = .7,  alpha= 0.9  ) +
  theme(
    # Set the inner plot area to a specific colour
    panel.background = element_rect(fill = "grey85", colour = "grey85"),
    # Set the outer frame background to a specific colour
    plot.background = element_rect(fill = "grey85"),
    panel.grid.major = element_line(colour = "transparent")
  )
ggsave("./maps/Day4clusterKDE_CHCedit.png")
####################################################################################
# re-run for Auckland
# TA Geography
AKL <- st_read("https://raw.githubusercontent.com/malcolmcampbell/mapchallenge30day2026/refs/heads/main/data/AKL_TA.gpkg")
st_crs(AKL)
plot(st_geometry(AKL))
# Sept 2026		- Airbnb
AirBnBNZSep_2026	<- read_csv ( "https://raw.githubusercontent.com/malcolmcampbell/mapchallenge30day2026/refs/heads/main/data/nz_sep_2026.csv" )
glimpse(AirBnBNZSep_2026)
# CLEAN UP - REDUCES NUMBER OF COLUMNS - only Auckland
AirBnBNZSep_2026 <- AirBnBNZSep_2026 |> 
  filter(neighbourhood_group=="Auckland")|> 
  select (latitude, longitude)
glimpse(AirBnBNZSep_2026)
AirBnBNZSep_2026_sf <- st_as_sf(AirBnBNZSep_2026, coords = c("longitude", "latitude"), crs = 4326)
st_crs(AirBnBNZSep_2026)
plot(st_geometry(AirBnBNZSep_2026_sf))

ggplot(AirBnBNZSep_2026_sf) + 
  geom_sf(alpha = 0.2) + 
  geom_sf(data=AKL, alpha = 0.2) + 
  theme_minimal() 
ggsave("./maps/Day4points_AKL.png")
#
point_counts <- hotspot_count(AirBnBNZSep_2026_sf)
#
ggplot() +
  geom_sf(
    mapping = aes(fill = n),
    data = point_counts,
    alpha = 0.75,
    colour = NA
  ) +
  scale_fill_distiller(direction = 1)
#
airbnb_kde <- hotspot_kde(AirBnBNZSep_2026_sf, 
                          grid_type = "hex", 
                          bandwidth_adjust = 2,
                          bandwidth = 100) |>
  hotspot_clip(AKL)
airbnb_kde
#KDE map
ggplot() +
  geom_sf(
    mapping = aes(fill = kde),
    data = airbnb_kde,
    alpha = 0.75,
    colour = NA
  )  +
  scale_fill_distiller(direction = 1) 
# AKL
ggplot() +
  geom_sf(mapping = aes(fill = kde), data = airbnb_kde, alpha = 0.9, colour = NA ) +
  scale_fill_distiller(direction = 1) +
  geom_sf(data = AKL, color = "firebrick", fill = NA, linewidth = .2,  alpha= 0.2  )
# Saving
ggsave("./maps/Day4clusterKDE_AKL.png")

# removing all the zero VALUES
ggplot() +
  geom_sf(mapping = aes(fill = ifelse(kde == 0, NA, kde)), 
          data = airbnb_kde, alpha = 0.75, colour = NA)  +
  scale_fill_distiller(direction = 1, na.value = NA, name = "Airbnb\nHotspots") +
  geom_sf(data = AKL, color = "firebrick", fill = NA, linewidth = .5,  alpha= 0.9  ) +
  theme(
    # Set the inner plot area to a specific colour
    panel.background = element_rect(fill = "grey85", colour = "grey85"),
    # Set the outer frame background to a specific colour
    plot.background = element_rect(fill = "grey85"),
    panel.grid.major = element_line(colour = "transparent")
  )
ggsave("./maps/Day4clusterKDE_AKLedit.png")
# END