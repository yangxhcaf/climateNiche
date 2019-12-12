# Create Data for climateNichepackage

# Read Raster file to memory
Passer_domesticus <- SpaDES.core::rasterToMemory("inst/extdata/Passer_domesticus.tif")
Passer_motitensis <- SpaDES.core::rasterToMemory("inst/extdata/Passer_motitensis.tif")

# Save as .rda file
save(Passer_domesticus, file="data/Passer_domesticus.rda", compress="xz")
save(Passer_motitensis, file="data/Passer_motitensis.rda", compress="xz")

# Get Equus quagga GBIF data
source("R/terrestrialGBIF.R")
terrestrialGBIF(species="Equus quagga", genus=NULL, limit = 200000, hasCoordinate=TRUE,
                path = "data/", overwrite=T)
Equus_quagga <- readRDS("data/Equus_quagga.rds")
save(Equus_quagga, file="data/Equus_quagga.rda", compress="xz")
file.remove("data/Equus_quagga.rds")
