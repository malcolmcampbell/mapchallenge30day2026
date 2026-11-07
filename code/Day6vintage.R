# Copyright Prof M Campbell. 6 November 2026. All rights reserved.
# Script for Day6
# Date 	      Name 	    Description
#06-11-2026 	Vintage 	Spin up your time machine and do a map which looks like a historical map, or maybe the theme itself should be vintage.
pacman::p_load(sf, ggplot2, showtext, ggrepel, dplyr)

# UK Parliamentary Constituency boundaries for the island of Ireland, 1885-1918
# https://zenodo.org/records/13993331
# get the data
IRL <- st_read("https://zenodo.org/records/13993331/files/All_Ireland_1885.gpkg")

# Loading fonts
font_add_google("Old Standard TT", "Old Standard TT")
showtext_auto()
# Old Standard TT or # Ewert

# Aged paper attempt!
theme_antique_atlas <- function(base_size = 30) {
  theme_minimal(base_size = base_size,  base_family = "Old Standard TT") +
    theme(
      plot.background = element_rect(fill = "#D9C49C", colour = NA),
      panel.background = element_rect(fill = "#D9C49C", colour = NA ),
      # Traditional map frame
      panel.border = element_rect(colour = "#806044", fill = NA, linewidth = 0.5),
      # Remove gridlines
      panel.grid = element_blank(),
      # Vintage atlas typography
      plot.title = element_text(family = "Old Standard TT", face = "bold",
        size = 50, colour = "#392F27", hjust = 0),
      plot.subtitle = element_text(family = "Old Standard TT", size = 11,
                                   colour = "#806044"),
      # Legend
      legend.background = element_rect(fill = "#F0E5CC",colour = NA),
      legend.key = element_rect(fill = "#F0E5CC", colour = NA),
      legend.title = element_text(face = "bold", colour = "#392F27"),
      legend.text = element_text(colour = "#66503D"),
      # Axis 
      axis.text = element_text(colour = "#66503D", size = 40),
      axis.title = element_blank(),
      # Margins
      plot.margin = margin(5, 5, 5, 5),
      legend.position = "none")
}
# make it look old!
vintage_palette <- c("#F0E5CC",  "#D9C49C",  "#BFA477",  "#A58B65",  "#898768",
  "#A76B50",  "#754B3A")

# https://danielroelfs.com/posts/advanced-map-norway/
# great resource here on labels!
IRL_centroids <- IRL |>   st_centroid() |>
  mutate(lon = st_coordinates(geom)[, 1], lat = st_coordinates(geom)[, 2] )
# map it!
ggplot(IRL) +
  geom_sf(aes(fill = "#F0E5CC"),colour = "#D9C49C",  linewidth = 0.15, fill="#BFA477")  +
  labs(title = "Irish Parlimentary Consistuency Map, 1885",  
       caption = "Source: NUI, Maynooth, UK Parliamentary Constituency boundaries for the island of Ireland, 1885-1918") +
  theme_antique_atlas() +
  # labels
  ggrepel::geom_text_repel(
    data = IRL_centroids,
    aes(x = lon, y = lat, label = C1885),
    min.segment.length = 0, colour = "#754B3A", family = "Old Standard TT",
    size = 12, seed = 41)
ggsave("./maps/Day6Vintage.png", width = 9.27, height = 14.6, units = "in")
#END