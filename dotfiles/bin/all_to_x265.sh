#! /usr/bin/env bash

for f in ./*; do
   echo $f;
   filename=$(basename -- "$f")
   extension="${filename##*.}"
   filename="${filename%.*}"
   ffmpeg -i "$f" -c:v libx265 -vtag hvc1 "${filename}_X265.mp4"
done
