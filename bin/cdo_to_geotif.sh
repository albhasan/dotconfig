#!/bin/bash
###############################################################################
# EXPORT FROM GRADS TO GEOTIF USING CDO.
###############################################################################

# Check if software is installed.
command -v cdo            > /dev/null 2>&1 || { echo >&2 "I require 'cdo' but it's not installed. Aborting."; exit 1; }
command -v gdal_translate > /dev/null 2>&1 || { echo >&2 "I require 'gdal_translate' but it's not installed. Aborting."; exit 1; }
command -v gdalinfo      > /dev/null 2>&1 || { echo >&2 "I require 'gdalinfo' but it's not installed. Aborting."; exit 1; }



# Parameter validation.
Help()
{
        echo ""
        echo "Export data from GRADS to GeoTIF."
        echo
        echo "Syntax: $(basename $0) [-h] in_dir"
        echo
        echo "options:"
        echo "h      Print this Help."
        echo "in_dir Path to a directory with CTL files."
        echo
}

if [[ $# -ne 1 ]]; then
    echo "ERROR: Illegal number of parameters."
    Help
    exit 1
fi

if [ "$1" == "-h" ]; then
    Help
    exit 0
fi

#TODO: Validate input directory.

# Get input directory.
IN_DIR=$1

# Export.
for f in "${IN_DIR}"/*.ctl; do
    echo "Processing $(basename ${f})..."
    fnoext="${f%.*}"
    # GRADS to NetCDF.
    cdo -f nc import_binary ${f} ${fnoext}.nc
    # NetCDF to GeoTIF.
    # NOTE: This script expects ONLY ONE variable in each NetCDF file.
    # NOTE: This script assumes WGS84 as the spatial reference system.
    VAR_NAME=$(gdalinfo "${fnoext}".nc | grep NETCDF_VARNAME | cut -f2 -d "=")
    gdal_translate -a_srs EPSG:4326 NETCDF:\"${fnoext}.nc\":\"${VAR_NAME}\" ${fnoext}_${VAR_NAME}.tif
    # Remove NetCDF.
    rm -f "${fnoext}".nc
done

exit 0

