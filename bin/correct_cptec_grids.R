#!/usr/bin/env -S Rscript --vanilla

###############################################################################
# CONVERT RASTER FILES FROM THE LONGITUDE USED IN METEREOLOGY TO THE ONE USED
# IN CARTOGRAPHY.
# They use the longitude starting at 0 and prolonging beyond 180.
# This scripts fixes this problem using terra::rotate.
# Original script by Guilherme Mataveli guilhermemataveli@gmail.com
###############################################################################


help_msg <- "
This script converts raster files from the longitude used in metereology to the 
one used in cartography.

Syntax: correct_cptec_grids [-h] in_dir

options:
h      Print this Help.
in_dir Path to a directory with CTL files."



#---- Validation ----

if (length(args) != 1) {
    print("ERROR: This script expects one parameter.")
    print(help_msg)
}

args <- commandArgs(trailingOnly = TRUE)[1]

if (args == "-h") {
  stop("Unknown", "\n", help_msg)
}

in_dir <- args[1]
#in_dir <- "/home/alber/Documents/trees_lab/people/ignacio/data/temperature"

if (!dir.exists(in_dir)) {
  stop("Input directory not found!", "\n", help_msg)
}



#---- Loading or installing packages ----

packages <- c("terra")

if(!all(packages %in% installed.packages())) {
  missing_packs <- packages[!packages %in% installed.packages()]
  install.packages(missing_packs, dependencies = TRUE)
}

sapply(packages, require, character = TRUE)



#---- Processing raster files ----

raster_files <- list.files(
    path = in_dir,
    pattern = "\\.tif$",
    full.names = TRUE
)

stopifnot("No raster files found!" = length(raster_files) > 0)

for (raster_file in raster_files) {
  print(sprintf("Processing %s...", basename(raster_file)))
  r <- terra::rast(raster_file)

  # Adjust the raster's coordinates from 0-360 to -180 to 180
  r_adjusted <- terra::rotate(r)

  # Force WGS84 on raster.
  terra::crs(r_adjusted) <- "EPSG:4326"

  # Save the adjusted raster.
  out_filename <- 
    file.path(
        dirname(raster_file),
        paste0(tools::file_path_sans_ext(basename(raster_file)), 
            "_corrected.tif")
    )
  terra::writeRaster(r_adjusted, out_filename)
}

