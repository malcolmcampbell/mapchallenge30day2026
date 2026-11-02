# Copyright Prof M Campbell. 1 November 2026. All rights reserved.
# Script to READ in insideairbnb data: CLEAN, CURATE & MAP.
pacman::p_load(sf, readr, tidyverse, ggplot2, showtext)

# Loading fonts
font_add_google("Covered By Your Grace", "grace")
showtext_auto()
#
# There is a wonderful example using ggplot in the 
# r-graph-gallery - edited and amdended here
# https://r-graph-gallery.com/web-density-plot-map.html

#####################################################################################

# Insideairbnb.com
# https://data.insideairbnb.com/new-zealand/2026-09-13/visualisations/listings.csv
# step 1 - read in Airbnb scraped data
# step 2 - have a look and clean if needed
# step 3 - save as an *.rds file. [file="AirbnbNZDATENZ.RData")]
# step 4 - maps!

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

CHCH_TA <- st_read("https://raw.githubusercontent.com/malcolmcampbell/mapchallenge30day2026/refs/heads/main/data/CHCH_TA.gpkg")

ggplot(AirBnBNZSep_2026) +
  geom_point(
    data = AirBnBNZSep_2026, aes(x = longitude, y = latitude),
    color = "dodgerblue2", size = .5, alpha = .4
  ) +
  labs(     y = "",    subtitle = "",    x = "",    title = "",    caption = ""  ) +
  geom_sf(    data = CHCH_TA, fill = "transparent",
              color = "white", linewidth = .6  ) +
  theme_minimal() +
  geom_sf(data = CHCH_TA, fill = "transparent", color = "black", linewidth = 0.6) +
  ggtitle("Airbnb Listings", subtitle = "September 2026") +
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
  annotate("text",
           x = c(172.9), y = c(-43.56),
          label = c("Christchurch, N.Z."), color = "black",
          size = 20, family = "grace", hjust = 0.5, fontface = "bold"
 ) +
  annotate(
    geom = "curve", x = 172.89, y = -43.55, xend = 172.75, yend = -43.52,
    curvature = .3, arrow = arrow(length = unit(2, "mm"))
  )
ggsave("./maps/Day1ggplotversion.png")
#END