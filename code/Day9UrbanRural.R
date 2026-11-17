# Copyright Prof M Campbell. 9 November 2026. All rights reserved.
# Script for Day9
# Date 	      Name 	    Description
# 09-11-2026 	Urban-rural 	Urban or rural. Cities and countryside.
# Revised from November 2025: Day 8 - Urban 	(World Urbanism Day) Map the built environment: 
pacman::p_load(sf, tmap) 

# Auckland - Building Layer
unzip ("./data/AKL-lds-nz-building-outlines-SHP.zip", 
       exdir = "./data/AKL/")
BUILDING <- st_read(dsn = "./data/AKL/nz-building-outlines.shp")         
AKL <- tm_shape(BUILDING) +tm_polygons(fill="#BC13FE", lwd=0.025) + tm_layout(bg.color = "grey10")

#AKL
tmap_save(tm=AKL, filename="./maps/Day9_Urban_AKL.png", height = 12, width = 12, dpi=300)

# FUA geography 2026
FUA_AKL <- st_read(dsn = "./data/FUA_AKL.gpkg")
tm_shape(FUA_AKL) +tm_borders(col="black")
tm_shape(FUA_AKL) +tm_borders(col="black")+tm_fill(fill="dodgerblue2")

AKL_FUAmap <- tm_shape(BUILDING) +tm_polygons(fill="#ff073a", lwd=0.025) + tm_layout(bg.color = "grey10") +
  tm_shape(FUA_AKL) +tm_borders(col="white", lwd=0.2)
#AKL_FUAmap 
tmap_save(tm=AKL_FUAmap, filename="./maps/Day9_UrbanFUA_AKL.png", height = 12, width = 12, dpi=500)

# as needed
rm(list=ls())

###################################################################
# Wellington Building Layer
unzip ("./data/WLG-lds-nz-building-outlines-SHP.zip", 
       exdir = "./data/WLG/")
BUILDING <- st_read(dsn = "./data/WLG/nz-building-outlines.shp")         
tmap_mode("plot")
WLG <- tm_shape(BUILDING) +tm_polygons(fill="#ff073a", lwd=0.025) + tm_layout(bg.color = "grey10")
#WLG
tmap_save(tm=WLG, filename="./data/Day9_Urban_WLG.png", height = 12, width = 12, dpi=300)

# FUA geography 2026
FUA_WLG <- st_read(dsn = "./data/FUA_WLG.gpkg")
tm_shape(FUA_WLG) +tm_borders(col="black")
tm_shape(FUA_WLG) +tm_borders(col="black")+tm_fill(fill="dodgerblue2")
#
WLG_FUAmap <- tm_shape(BUILDING) +tm_polygons(fill="#ff073a", lwd=0.025) + tm_layout(bg.color = "grey10") +
    tm_shape(FUA_WLG) + (tm_borders(col="white", lwd=0.2))
tmap_save(tm=WLG_FUAmap, filename="./maps/Day9_UrbanFUA_WLG.png", height = 12, width = 12, dpi=500)

# as needed
rm(list=ls())
######################################################################
# Christchurch Building Layer
unzip ("./data/CHC-lds-nz-building-outlines-SHP.zip", 
       exdir = "./data/CHC/")
BUILDING <- st_read(dsn = "./data/CHC/nz-building-outlines.shp")         
#tmap
CHC <- tm_shape(BUILDING) +tm_polygons(fill="#39ff14", lwd=0.025) + tm_layout(bg.color = "grey10")
#cHC
tmap_save(tm=CHC, filename="./maps/Day9_Urban_CHC.png", height = 12, width = 12, dpi=300)

# FUA geography 2026
FUA_CHC <- st_read(dsn = "./data/FUA_CHC.gpkg")
tm_shape(FUA_CHC) +tm_borders(col="black")
tm_shape(FUA_CHC) +tm_borders(col="black")+tm_fill(fill="firebrick")

CHC_FUAmap <- tm_shape(BUILDING) +tm_polygons(fill="#ff073a", lwd=0.025) + tm_layout(bg.color = "grey10") +
  tm_shape(FUA_CHC) +tm_borders(col="white", lwd=0.2)
#CHC_FUAmap 
tmap_save(tm=CHC_FUAmap, filename="./maps/Day9_UrbanFUA_CHC.png", height = 12, width = 12, dpi=500)
# as needed
rm(list=ls())
#END