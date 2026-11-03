# Copyright Prof M Campbell. 3 November 2026. All rights reserved.
# Script for Day3: polygons
# note:: some 'upcycling' from 2025 code
# Date 	      Name 	    Description
# 03-11-2026 	Polygons 	A map challenge classic. Map with polygons.
pacman::p_load(sf, tmap, tmaptools, tidyverse, ggplot2)
# This article is helpful for inset maps 
# https://r-tmap.github.io/tmap/articles/adv_inset_maps
# Read in an *.rds slimmed dataset from the Census 2023 
SMOKE <-readRDS(url("https://raw.githubusercontent.com/malcolmcampbell/mapchallenge30day2026/refs/heads/main/data/SMOKE.rds"))

# Smoking
tmap_mode("plot")
#
SmokingMap <- tm_shape (SMOKE) + 
  tm_polygons(
    fill = "SmokingProp2023",
    fill.scale = tm_scale_intervals(n=10, style="quantile", 
                                    values = "-orange_blue_diverging"),
    fill.legend = tm_legend("Regular Smoker (%)"),
    col = NULL) +
  tm_layout(legend.position = c("left", "top")) +
  tm_title("Smoking (%), SA2, 2023") +
  tm_title("Auckland", size = 0.95, position = c("right", "top")) +
  tm_inset(bb("Auckland, New Zealand"), position = c("right", "top"),
           box_frame.color = "firebrick", main_frame.color = "firebrick") +
  tm_title("Wellington", size = 0.95, position = c("right", "center")) +
  tm_inset(bb("Wellington"), position = c("right", "center"),
           box_frame.color = "dodgerblue", main_frame.color = "dodgerblue") +
  tm_title("Christchurch", size = 0.95, position = c("right", "bottom")) +
  tm_inset(bb("Christchurch, New Zealand"), position = c("right", "bottom"), 
           box_frame.color = "seagreen", main_frame.color = "seagreen") +
  tm_credits(text ="Prof. M. Campbell \n Data: NZCensus2023",position = c("bottom", "center")) +
  tm_layout(frame=F)
SmokingMap  

# Save the map to a file
tmap_save(SmokingMap, dpi=400,  height = 297, width = 210, units="mm",filename = "./maps/Day3polygons_SmokingMap.png")

# Interactive Version
tmap_mode("view")
#
tm_shape (SMOKE) + 
  tm_polygons(
    fill = "SmokingProp2023",
    fill.scale = tm_scale_intervals(n=10, style="quantile", 
                                    values = "-orange_blue_diverging"),
    fill.legend = tm_legend("Smoking (%)"),
    col = "grey20")

#############################################################################
# Smokefree Map
tmap_mode("plot")
#
SmokeFreeMap <- tm_shape (SMOKE) + 
  tm_polygons(
    fill = "SmokeTarget_2023",
    fill.scale = tm_scale_categorical(n.max=2, values = "-cols4all.friendly5"),
    fill.legend = tm_legend("Smokefree Status"),
    col = NULL) +
  tm_layout(legend.position = c("left", "top")) +
  tm_title("Reached Smokefree Target, Less than 5% Smoking in 2023") +
  tm_title("Auckland", size = 0.95, position = c("right", "top")) +
  tm_inset(bb("Auckland, New Zealand"), position = c("right", "top"),
           box_frame.color = "black", main_frame.color = "black") +
  tm_title("Wellington", size = 0.95, position = c("right", "center")) +
  tm_inset(bb("Wellington"), position = c("right", "center"),
           box_frame.color = "black", main_frame.color = "black") +
  tm_title("Christchurch", size = 0.95, position = c("right", "bottom")) +
  tm_inset(bb("Christchurch, New Zealand"), position = c("right", "bottom"), 
           box_frame.color = "black", main_frame.color = "black") +
  tm_credits(text ="Prof. M. Campbell \n Data: NZCensus2023",position = c("bottom", "center")) +
  tm_layout(frame=F)
SmokeFreeMap 

# Save the map to a file
tmap_save(SmokeFreeMap, dpi=400,  height = 297, width = 210, units="mm",filename = "./maps/Day3polygons_SmokeFreeMap.png")

#######################
# Interactive Version
tmap_mode("view")
#
SmokeFreeMap <- tm_shape (SMOKE) + 
  tm_polygons(
    fill = "SmokeTarget_2023",
    fill.scale = tm_scale_categorical(n.max=2, values = "-cols4all.friendly5"),
    fill.legend = tm_legend("Smokefree Status"),
    col = NULL)
#END