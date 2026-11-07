# Copyright Prof M Campbell. 7 November 2026. All rights reserved.
# Script for Day7
# Date 	      Name 	    Description
#07-11-2026 	10 minute map 	You have no more than 10 minutes to complete this map.
#start the clock - Video record using snipping tool 
start <- Sys.time()
pacman::p_load(mapgl, beepr, tmaptools) 
# Map the (approximate) mapping HQ.
UC <- geocode_OSM("Ancestral, University of Canterbury, New Zealand")
UCMap <- mapboxgl(center = c(UC$coords[[1]], UC$coords[[2]])) |> 
  fly_to(center = c(UC$coords[[1]], UC$coords[[2]]), zoom = 17, pitch = 55, bearing = 50  )
UCMap
# stop the clock!!
end <- Sys.time()
end - start
# end