# Copyright Prof M Campbell. 8 November 2026. All rights reserved.
# Script for Day 8
# Date 	      Name 	    Description
# 08-11-2026 	Utopia 	A map of something which could be.
# The map of ZERO homelessness. NZ at the 2029 election
# homelessness = 0
#remotes::install_github("wmgeolab/rgeoboundaries")
pacman::p_load(rgeoboundaries, sf, tidyverse, ggplot2, showtext, patchwork, gt)
# source https://www.stats.govt.nz/information-releases/2023-census-severe-housing-deprivation-homelessness-estimates/

############################################################################
# 0. Data frame to gt table
Homeless <- read_csv("https://raw.githubusercontent.com/malcolmcampbell/mapchallenge30day2026/refs/heads/main/data/Homeless.csv")
# Living situation	2013	2018	2023	2029
# Roofless or rough sleeper	30	207	333	0
# Improvised dwelling	1425	1347	1116	0
# Mobile dwelling	2667	2070	3516	0
# Total	4122	3624	4965	0

# 1. Create ggplot object
# Get Level 2 boundaries for NZ
NZ <- gb_adm2("New Zealand" ,type="simplified")
NZ <- NZ |> filter(shapeName!="Chatham Islands Territory")
NZ <- st_union(NZ)
plot(st_geometry(NZ))

#
ggplot() +
  geom_sf(data=NZ, alpha = 0.75) +
  theme_void() 

##################################
# clean version
p1 <-  ggplot(NZ) +
  geom_sf(fill = "seagreen", color = "grey20", linewidth = 0.15) +
  labs(title = "Severe Housing Deprivation", 
       subtitle = "New Zealand, 2013",
       caption="Severe Housing Deprivation Total: 4,122",
       y = "", x = "") +
  theme(
    panel.background = element_rect(colour="aliceblue", fill="aliceblue"),
    plot.background = element_rect(fill="aliceblue", colour="aliceblue"),
    axis.ticks = element_blank(),
    panel.grid = element_blank(),
    axis.text = element_blank(),
    panel.grid.major = element_line(colour = "aliceblue"),
    plot.title = element_text(hjust = 0.5, family = "grace", size = 60, color = "black"),
    plot.subtitle = element_text( hjust = 0.5, family = "grace",size = 50, color = "black"),
plot.caption= element_text( hjust = 0.5, family = "grace",size = 50, color = "black"))+
  annotate("text", x = c(177.95), y = c(-45.5),
           label = c("Rough sleeper: 30"), color = "black",
           size = 20, family = "grace", hjust = 1, vjust=1) +
  annotate( geom = "curve", x = 177.95, y = -45.5, xend = 174.7338891, yend = -41.558277, 
            curvature = .3, arrow = arrow(length = unit(2, "mm"))  ) 
p1
ggsave("./maps/Day8utopia_2013.png")

# 2018
# Living situation	2013	2018	2023	2029
#Roofless or rough sleeper	30	207	333	0
#Improvised dwelling	1425	1347	1116	0
#Mobile dwelling	2667	2070	3516	0
#Total	4122	3624	4965	0
p2 <-ggplot(NZ) +
  geom_sf(fill = "seagreen", color = "grey20", linewidth = 0.15) +
  labs(title = "Severe Housing Deprivation", 
       subtitle = "New Zealand, 2018",
       caption="Severe Housing Deprivation Total: 3,624",
       y = "", x = "") +
  theme(
    panel.background = element_rect(colour="aliceblue", fill="aliceblue"),
    plot.background = element_rect(fill="aliceblue", colour="aliceblue"),
    axis.ticks = element_blank(),
    panel.grid = element_blank(),
    axis.text = element_blank(),
    panel.grid.major = element_line(colour = "aliceblue"),
    plot.title = element_text(hjust = 0.5, family = "grace", size = 60, color = "black"),
    plot.subtitle = element_text( hjust = 0.5, family = "grace",size = 50, color = "black"),
    plot.caption= element_text( hjust = 0.5, family = "grace",size = 50, color = "black"))+
  annotate("text", x = c(177.95), y = c(-45.5),
           label = c("Rough sleeper: 207"), color = "black",
           size = 20, family = "grace", hjust = 1, vjust=1) +
  annotate( geom = "curve", x = 177.95, y = -45.5, xend = 174.7338891, yend = -41.558277, 
            curvature = .3, arrow = arrow(length = unit(2, "mm"))  ) 
p2
ggsave("./maps/Day8utopia_2018.png")

# 2023
# Living situation	2013	2018	2023	2029
#Roofless or rough sleeper	30	207	333	0
#Improvised dwelling	1425	1347	1116	0
#Mobile dwelling	2667	2070	3516	0
#Total	4122	3624	4965	0
p3 <-ggplot(NZ) +
  geom_sf(fill = "seagreen", color = "grey20", linewidth = 0.15) +
  labs(title = "Severe Housing Deprivation", 
       subtitle = "New Zealand, 2023",
       caption="Severe Housing Deprivation Total: 4,965",
       y = "", x = "") +
  theme(
    panel.background = element_rect(colour="aliceblue", fill="aliceblue"),
    plot.background = element_rect(fill="aliceblue", colour="aliceblue"),
    axis.ticks = element_blank(),
    panel.grid = element_blank(),
    axis.text = element_blank(),
    panel.grid.major = element_line(colour = "aliceblue"),
    plot.title = element_text(hjust = 0.5, family = "grace", size = 60, color = "black"),
    plot.subtitle = element_text( hjust = 0.5, family = "grace",size = 50, color = "black"),
    plot.caption= element_text( hjust = 0.5, family = "grace",size = 50, color = "black"))+
  annotate("text", x = c(177.95), y = c(-45.5),
           label = c("Rough sleeper: 333"), color = "black",
           size = 20, family = "grace", hjust = 1, vjust=1) +
  annotate( geom = "curve", x = 177.95, y = -45.5, xend = 174.7338891, yend = -41.558277, 
            curvature = .3, arrow = arrow(length = unit(2, "mm"))  ) 
p3
ggsave("./maps/Day8utopia_2023.png")

###################################################################
# 2030!
p4 <-ggplot(NZ) +
  geom_sf(fill = "seagreen", color = "grey20", linewidth = 0.15) +
  labs(title = "Severe Housing Deprivation", 
       subtitle = "New Zealand, 2030",
       caption="Severe Housing Deprivation Total: 0",
       y = "", x = "") +
  theme(
    panel.background = element_rect(colour="aliceblue", fill="aliceblue"),
    plot.background = element_rect(fill="aliceblue", colour="aliceblue"),
    axis.ticks = element_blank(),
    panel.grid = element_blank(),
    axis.text = element_blank(),
    panel.grid.major = element_line(colour = "aliceblue"),
    plot.title = element_text(hjust = 0.5, family = "grace", size = 60, color = "black"),
    plot.subtitle = element_text( hjust = 0.5, family = "grace",size = 50, color = "black"),
    plot.caption= element_text( hjust = 0.5, family = "grace",size = 50, color = "black"))+
  annotate("text", x = c(177.95), y = c(-45.5),
           label = c("Rough sleeper: 0"), color = "black",
           size = 20, family = "grace", hjust = 1, vjust=1) +
  annotate( geom = "curve", x = 177.95, y = -45.5, xend = 174.7338891, yend = -41.558277, 
            curvature = .3, arrow = arrow(length = unit(2, "mm"))  ) 
p4
ggsave("./maps/Day8utopia_2030.png")
#END
