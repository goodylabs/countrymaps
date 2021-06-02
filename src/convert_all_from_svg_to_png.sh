#!/bin/bash

BASENAME=`which basename`
LS=`which ls`
SED=`which sed`

PATHS=( "svg/dark" "svg/light")
output_path="../png"

for index in ${!PATHS[*]}; do
  input_path="${PATHS[$index]}"
  for i in `${LS} -1 ${input_path}/*.svg`; do
    output_filename=`echo ${i##*/}`
    output_filename="${output_path}/${output_filename}.png"
    echo "Converting ${i} to ${output_filename} ..."
    ./convert_svg_to_png.sh ${i} ${output_filename}
  done

done
