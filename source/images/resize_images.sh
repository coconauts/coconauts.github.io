max_width=1000
path="./posts"

for file in `find "$path" -type f`; do
  #echo "Checking  image $file"

  #Using identify from imagemagick
  size=`identify "$file"`  #email.png PNG 48x48 48x48+0+0 8-bit DirectClass 2.57KB 0.000u 0:00.000
  width=`echo "$size" | head -1 | cut -d' ' -f3 | cut -d'x' -f1` #head is required for gifs (returns multiple lines)

  #Using exiv2 (another dependency)
  #size=`exiv2 $file | grep "Image size"` #Image size      : 585 x 347
  #width=`echo "$size" | cut -d':' -f2 | cut -d' ' -f2`

  if [ "$width" -gt "$max_width" ];then
    echo "Resizing image $file with width $width to $max_width"
    #with \> the image won't be resized to bigger size (donwscale only)
    convert $file -resize $max_width\> $file
  #else
    #echo "Skipping resize of image $file with width $width"
  fi

done

echo "Done"
