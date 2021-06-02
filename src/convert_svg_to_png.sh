#!/bin/bash

CONVERT=`which convert`
RM=`which rm`
RSVG_CONVERT=`which rsvg-convert`

PNG_WIDTH=450
PNG_HEIGHT=450

OUTPUT_WIDTH=500
OUTPUT_HEIGHT=500

if [ "x$1" == "x" ] || [ "x$2" == "x" ]; then
  echo "Usage:"
  echo "$0 [svg_file] [output_file]"
  exit 1
fi

i=$1
OUTPUT_FILE="$2"

${RSVG_CONVERT} -a -w ${PNG_WIDTH} -h ${PNG_HEIGHT} $i > $i-rsvg.png
${CONVERT} -background none -resize ${PNG_WIDTH}x${PNG_HEIGHT} -gravity center -extent ${OUTPUT_WIDTH}x${OUTPUT_HEIGHT} $i-rsvg.png ${OUTPUT_FILE}
${RM} -rf $i-rsvg.png
