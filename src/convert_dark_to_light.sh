#!/bin/bash

AWK=`which awk`

DARK_COLOR="11152C"
LIGHT_COLOR="DBDDE4"

INPUT_FILE=$1
OUTPUT_FILE=$2

if [ "x${OUTPUT_FILE}" == "x" ] || [ "x${INPUT_FILE}" == "x" ]; then
  echo "Usage: "
  echo "$0 [input_file] [output_file]"
  exit 1;
fi

${AWK} "{gsub(\"${DARK_COLOR}\",\"${LIGHT_COLOR}\")}1" $1 > $2
