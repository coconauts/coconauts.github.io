#!/bin/bash
# Script to find and remove GPS/location EXIF data from images

IMAGE_DIR="images/posts"

if [ "$1" == "--list" ]; then
    echo "Scanning images for GPS data..."
    echo ""

    # Find images with GPS data
    find "$IMAGE_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec sh -c '
        gps_data=$(exiftool -GPS* "$1" 2>/dev/null | grep -i "GPS")
        if [ -n "$gps_data" ]; then
            echo "📍 $1"
            echo "$gps_data" | sed "s/^/   /"
            echo ""
        fi
    ' _ {} \;

elif [ "$1" == "--remove" ]; then
    echo "Finding images with GPS data..."
    echo ""

    # Find and list images with GPS data
    images=$(find "$IMAGE_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec sh -c '
        gps_data=$(exiftool -GPS* "$1" 2>/dev/null | grep -i "GPS")
        if [ -n "$gps_data" ]; then
            echo "$1"
        fi
    ' _ {} \;)

    if [ -z "$images" ]; then
        echo "✓ No images found with GPS location data!"
        exit 0
    fi

    count=$(echo "$images" | wc -l)
    echo "Found $count image(s) with GPS location data:"
    echo "$images" | sed 's/^/  /'
    echo ""

    # Ask for confirmation
    read -p "Remove GPS data from these $count image(s)? [y/N]: " -n 1 -r
    echo ""

    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi

    echo ""
    echo "Removing GPS data..."

    # Remove GPS data from each image
    echo "$images" | while read -r img; do
        exiftool -GPS*= -overwrite_original "$img" 2>/dev/null
        echo "✓ Cleaned: $img"
    done

    echo ""
    echo "✓ Done! Removed GPS data from $count image(s)."

else
    echo "Usage:"
    echo "  $0 --list    # List images with GPS data"
    echo "  $0 --remove  # Remove GPS data from images"
    exit 1
fi
