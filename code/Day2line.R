# Copyright Prof M Campbell. 2 November 2026. All rights reserved.
# Script for Day2: lines
pacman::p_load(sf, tmap, tmaptools, tidyverse, ggplot2, showtext, rmapshaper)
###############################################
# the 'cheeky' lack of lines map
SOUTH <- st_read("https://raw.githubusercontent.com/malcolmcampbell/mapchallenge30day2026/refs/heads/main/data/SOUTH.gpkg")

tmap_mode("plot")
SOUTHMAP <-
  tm_shape(SOUTH) +
  tm_polygons(fill="seagreen") +
  tm_layout(bg.color = "aliceblue") +
  tm_title("Lack of Line(s) Current South Island Commuter Rail") +
  tm_scalebar(width=15)
SOUTHMAP
tmap_save(tm = SOUTHMAP, 
          filename ="./maps/Day2lines_CommunterLinesSouthIsland.png", 
          height = 12, width = 8)
#####################################################
# all train lines
Trainlines <- st_read("https://raw.githubusercontent.com/malcolmcampbell/mapchallenge30day2026/refs/heads/main/data/NZ_Rail_Network.gpkg")
head (Trainlines)
plot(st_geometry(Trainlines), graticule=TRUE, axes=TRUE)
# Loading fonts
font_add_google("Covered By Your Grace", "grace")
showtext_auto()
#
ggplot() +
  geom_sf(data = Trainlines, fill = "dodgerblue2",
              color = "firebrick", linewidth = .6  ) +
  theme_minimal() +
  ggtitle("Train Lines", subtitle = "New Zealand") +
  theme(
    panel.grid = element_blank(),
    axis.text = element_blank(),
    plot.title = element_text(
      hjust = 0.5, family = "grace", size = 60,
      lineheight = 1.1,
      margin = margin(1, 0, 1, 0)
    ),
    plot.subtitle = element_text(
      hjust = 0.5, family = "grace",
      size = 50, color = "black"
    ))+
  annotate(
    geom = "curve", x = 170.1, y = -34.61, xend = 172.63, yend = -39.2,
    curvature = .3, arrow = arrow(length = unit(2, "mm"))
  )
ggsave("./maps/Day2linesggplotversion.png")

#################################################################################
SOUTH_wgs_84 <- st_transform(SOUTH, crs=4326)
ggplot() +
  geom_sf(data = SOUTH_wgs_84, fill = "grey70", color = "black", linewidth = .15  ) +
  theme_minimal() +
  ggtitle("Lack of Line(s)\nCurrent South Island Commuter Rail") +
  theme(
    panel.grid = element_blank(), axis.text = element_blank(),
    plot.title = element_text(hjust = 0.5, family = "grace", size = 60,
      lineheight = 1.1, margin = margin(1, 0, 1, 0) ),
    plot.subtitle = element_text(hjust = 0.5, family = "grace",
      size = 50, color = "black"))+
  annotate("text",
           x = c(171.22), y = c(-43.4),
           label = c("?"), color = "black",
           size = 20, family = "grace", fontface = "bold") +
  annotate(geom = "curve", x = 168.94, y = -40.45, xend = 169.82, yend = -43.29,
    curvature = .3, arrow = arrow(length = unit(2, "mm")))
ggsave("./maps/Day2lines_cheeky_ggplotversion.png")

#################################################################################
# South Line ONLY - south island
TrainSouthLine <- Trainlines[Trainlines$LINESECTIO=="Main South Line",]
# (new) railways
Christchurch <- geocode_OSM("Christchurch")
Dunedin <- geocode_OSM("Dunedin")
Invercargill <- geocode_OSM("Invercargill")
#
ggplot() +
  geom_sf(data = SOUTH_wgs_84, fill = "white", color = "black", linewidth = .15  ) +
  geom_sf(data = TrainSouthLine, fill = "red", color = "red", linewidth = 2  ) +
  theme_minimal() +
  ggtitle("Proposed 'new' Line(s)") +
  theme(
    panel.grid = element_blank(), axis.text = element_blank(),
    plot.title = element_text(hjust = 0.5, family = "grace", size = 60,
                              lineheight = 1.1, margin = margin(1, 0, 1, 0) ),
    plot.subtitle = element_text(hjust = 0.5, family = "grace",
                                 size = 50, color = "black"),
    plot.caption = element_text(hjust = 0.5, family = "grace",
                                 size = 30, color = "black"))+

  annotate("text",
           x = c(Christchurch$coords[1]), y = c(Christchurch$coords[2]),
           label = c(Christchurch$query), color = "black",
           hjust=-.25, vjust=0.75,
           size = 15, family = "grace", fontface = "bold") +
  annotate(geom = "curve", x = 168.94, y = -40.45, 
           xend = Christchurch$coords[1], yend = Christchurch$coords[2],
           curvature = .3, arrow = arrow(length = unit(2, "mm"))) +

  annotate("text",x = c(Dunedin$coords[1]), y = c(Dunedin$coords[2]),
           label = c(Dunedin$query), color = "black",hjust=-0.35,
           size = 15, family = "grace", fontface = "bold") +
  annotate(geom = "curve", x = 168.94, y = -40.45, 
           xend = Dunedin$coords[1], yend = Dunedin$coords[2],
           curvature = .3, arrow = arrow(length = unit(2, "mm")))+
  
  annotate("text",
           x = c(Invercargill$coords[1]), y = c(Invercargill$coords[2]),
           label = c(Invercargill$query), color = "black",hjust=1.55,
           size = 15, family = "grace", fontface = "bold") +
  annotate(geom = "curve", x = 168.94, y = -40.45, 
           xend = Invercargill$coords[1], yend = Invercargill$coords[2],
           curvature = .3, arrow = arrow(length = unit(2, "mm"))) +
  labs(caption = "Source: RNZ. South Island Intercity Rail Lines")

# Saving
ggsave("./maps/Day2lines_NEW_ggplotversion.png")
#END