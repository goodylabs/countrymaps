#!/bin/bash

BASENAME=`which basename`
LS=`which ls`
SED=`which sed`

output_path="svg/light"

for i in `${LS} -1 svg/dark/*.svg`; do
  output_filename=`echo ${i} | ${SED} -e 's/\-dark/\-light/'`
  output_filename=`echo ${output_filename##*/}`
  output_filename="${output_path}/${output_filename}"
  echo "Converting ${i} to ${output_filename} ..."
  ./convert_dark_to_light.sh ${i} ${output_filename}
done