#!/bin/bash

BASENAME=`which basename`
LS=`which ls`
SED=`which sed`

PATHS=( "svg/dark" "svg/light")
output_path="../png"

if [ "x$1" == "x--help" ]; then
  echo "$0 [--overwrite]"
  exit 0;
fi

if [ "x$1" == "x--overwrite" ]; then
  is_overwrite="true"
fi

for index in ${!PATHS[*]}; do
  input_path="${PATHS[$index]}"
  for i in `${LS} -1 ${input_path}/*.svg`; do
    output_filename=`echo ${i##*/}`
    output_filename=`echo ${output_filename%.svg}`
    output_filename="${output_path}/${output_filename}.png"

    if [ "$is_overwrite" != "true" ] && [ -f "$output_filename" ]; then
      echo "Skipping file ${output_filename} as it already exists..."
    else
      echo "Converting ${i} to ${output_filename} ..."
      ./convert_svg_to_png.sh ${i} ${output_filename}
    fi
  done

done
