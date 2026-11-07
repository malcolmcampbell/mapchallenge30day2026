# Copyright Prof M Campbell. 5 November 2026. All rights reserved.
# Script for Day5
# Date 	      Name 	    Description
#05-11-2026 	Senses: Sight 	How do you see something? Maybe map a viewshed?

#Today I'm using my (quite possibly) favourite library greenR
#How much sky can a pedestrian actually see from the street
#Sky View Factor (SVF) 3D Suite
#A low SVF (near 0) indicates a highly closed canopy or deep street canyon, offering maximum shade. 
#A high SVF (near 1) indicates full sky exposure, maximizing direct solar radiation.
# Mahajan, S., 2024. greenR: An open-source framework for quantifying urban greenness. Ecological Indicators 163, 112108. doi:10.1016/j.ecolind.2024.112108
# examples HERE https://github.com/sachit27/greenR/

pacman::p_load(greenR)

# Use https://nominatim.openstreetmap.org/ui/search.html to find the correct areas
############################################################################
# Holy See
svf_results <- uh_svf(
  city_name        = "Vatican city",
  analysis_scale   = "city_screening",
  terrain_source   = "elevatr",
  elevatr_z        = 13,
  buildings_source = "gba",
  sample_mode      = "both",                 # MUST be "both" or "grid" to compute buildings and enable 3D!
  spacing_street_m = 100,                     # Spacing along street network (meters)
  spacing_grid_m   = 100,                     # Grid sampling interval (meters)
  n_directions     = 36,                     # Number of ray-cast directions
  include_leaflet  = TRUE,                    # Build interactive Leaflet map
  include_3d       = TRUE,                    # Build fully interactive 3D WebGL explorer
  output_dir       = "./VC_svf_outputs",  # Save files in this directory
  output_prefix    = "VC_full"            # Prefix for all generated maps & assets
)

############################################################################
# Luxembourg, Canton Luxembourg, Luxembourg
svf_results <- uh_svf(
  city_name        = "Luxembourg, Canton Luxembourg, Luxembourg",
  analysis_scale   = "city_screening",
  terrain_source   = "elevatr",
  elevatr_z        = 13,
  buildings_source = "gba",
  sample_mode      = "both",                 # MUST be "both" or "grid" to compute buildings and enable 3D!
  spacing_street_m = 100,                     # Spacing along street network (meters)
  spacing_grid_m   = 100,                     # Grid sampling interval (meters)
  n_directions     = 36,                     # Number of ray-cast directions
  include_leaflet  = TRUE,                    # Build interactive Leaflet map
  include_3d       = TRUE,                    # Build fully interactive 3D WebGL explorer
  output_dir       = "./LUX_svf_outputs",  # Save files in this directory
  output_prefix    = "LUX_full"            # Prefix for all generated maps & assets
)
############################################################################
#Auckland, New Zealand
svf_results <- uh_svf(
  city_name        = "Auckland, New Zealand",
  analysis_scale   = "city_screening",
  terrain_source   = "elevatr",
  elevatr_z        = 13,
  buildings_source = "gba",
  sample_mode      = "both",                 # MUST be "both" or "grid" to compute buildings and enable 3D!
  spacing_street_m = 100,                     # Spacing along street network (meters)
  spacing_grid_m   = 100,                     # Grid sampling interval (meters)
  n_directions     = 36,                     # Number of ray-cast directions
  include_leaflet  = FALSE,                    # Build interactive Leaflet map
  include_3d       = FALSE,                    # Build fully interactive 3D WebGL explorer
  output_dir       = "./AKL_svf_outputs",  # Save files in this directory
  output_prefix    = "AKL_full"            # Prefix for all generated maps & assets
)
############################################################################
#Christchurch, New Zealand
svf_results <- uh_svf(
  city_name        = "Christchurch, New Zealand",
  analysis_scale   = "city_screening",
  terrain_source   = "elevatr",
  elevatr_z        = 13,
  buildings_source = "gba",
  sample_mode      = "both",                 # MUST be "both" or "grid" to compute buildings and enable 3D!
  spacing_street_m = 100,                     # Spacing along street network (meters)
  spacing_grid_m   = 100,                     # Grid sampling interval (meters)
  n_directions     = 36,                     # Number of ray-cast directions
  include_leaflet  = FALSE,                    # Build interactive Leaflet map
  include_3d       = FALSE,                    # Build fully interactive 3D WebGL explorer
  output_dir       = "./CHC_svf_outputs",  # Save files in this directory
  output_prefix    = "CHC_full"            # Prefix for all generated maps & assets
)
##################################################################################
#Belfast City, United Kingdom
svf_results <- uh_svf(
  city_name        = "Belfast City, United Kingdom",
  analysis_scale   = "city_screening",
  terrain_source   = "elevatr",
  elevatr_z        = 13,
  buildings_source = "gba",
  sample_mode      = "both",                 # MUST be "both" or "grid" to compute buildings and enable 3D!
  spacing_street_m = 100,                     # Spacing along street network (meters)
  spacing_grid_m   = 100,                     # Grid sampling interval (meters)
  n_directions     = 36,                     # Number of ray-cast directions
  include_leaflet  = FALSE,                    # Build interactive Leaflet map
  include_3d       = FALSE,                    # Build fully interactive 3D WebGL explorer
  output_dir       = "./BFS_svf_outputs",  # Save files in this directory
  output_prefix    = "BFS_full"            # Prefix for all generated maps & assets
)
################################################################################
# Manhattan, New York City
svf_results <- uh_svf(
  city_name        = "Manhattan, New York City",
  analysis_scale   = "city_screening",
  terrain_source   = "elevatr",
  elevatr_z        = 13,
  buildings_source = "gba",
  sample_mode      = "both",                 # MUST be "both" or "grid" to compute buildings and enable 3D!
  spacing_street_m = 30,                     # Spacing along street network (meters)
  spacing_grid_m   = 50,                     # Grid sampling interval (meters)
  n_directions     = 36,                     # Number of ray-cast directions
  include_leaflet  = TRUE,                    # Build interactive Leaflet map
  include_3d       = TRUE,                    # Build fully interactive 3D WebGL explorer
  output_dir       = "./NYC_svf_outputs",  # Save files in this directory
  output_prefix    = "NYC_full"            # Prefix for all generated maps & assets
)

# Open interactive 3D explorer
browseURL("./NYC_svf_outputs/NYC_full_svf_3d_explorer.html")

#################################################################################
# Singapore City, Singapore
svf_results <- uh_svf(
  city_name        = "Singapore City, Singapore",
  analysis_scale   = "city_screening",
  terrain_source   = "elevatr",
  elevatr_z        = 13,
  buildings_source = "gba",
  sample_mode      = "both",                 # MUST be "both" or "grid" to compute buildings and enable 3D!
  spacing_street_m = 30,                     # Spacing along street network (meters)
  spacing_grid_m   = 50,                     # Grid sampling interval (meters)
  n_directions     = 36,                     # Number of ray-cast directions
  include_leaflet  = FALSE,                    # Build interactive Leaflet map
  include_3d       = FALSE,                    # Build fully interactive 3D WebGL explorer
  output_dir       = "./SG_svf_outputs",  # Save files in this directory
  output_prefix    = "SG_full"            # Prefix for all generated maps & assets
)

##################################################################################
# Hong Kong Island, Hong Kong, China
svf_results <- uh_svf(
  city_name        = "Hong Kong Island, Hong Kong, China",
  analysis_scale   = "city_screening",
  terrain_source   = "elevatr",
  elevatr_z        = 13,
  buildings_source = "gba",
  sample_mode      = "both",                 # MUST be "both" or "grid" to compute buildings and enable 3D!
  spacing_street_m = 30,                     # Spacing along street network (meters)
  spacing_grid_m   = 50,                     # Grid sampling interval (meters)
  n_directions     = 36,                     # Number of ray-cast directions
  include_leaflet  = FALSE,                    # Build interactive Leaflet map
  include_3d       = FALSE,                    # Build fully interactive 3D WebGL explorer
  output_dir       = "./HK_svf_outputs",  # Save files in this directory
  output_prefix    = "HK_full"            # Prefix for all generated maps & assets
)
##################################################################################
#Toronto, Ontario, Canada
svf_results <- uh_svf(
  city_name        = "Toronto, Ontario, Canada",
  analysis_scale   = "city_screening",
  terrain_source   = "elevatr",
  elevatr_z        = 13,
  buildings_source = "gba",
  sample_mode      = "both",                 # MUST be "both" or "grid" to compute buildings and enable 3D!
  spacing_street_m = 100,                     # Spacing along street network (meters)
  spacing_grid_m   = 100,                     # Grid sampling interval (meters)
  n_directions     = 36,                     # Number of ray-cast directions
  include_leaflet  = TRUE,                    # Build interactive Leaflet map
  include_3d       = TRUE,                    # Build fully interactive 3D WebGL explorer
  output_dir       = "./TO_svf_outputs",  # Save files in this directory
  output_prefix    = "TO_full"            # Prefix for all generated maps & assets
)
# END