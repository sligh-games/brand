#!/bin/bash
# Script to create seasonal variants of the logo using recolor_svg.py

# Check if the source SVG exists
SOURCE_SVG="./SVG/logo-color.svg"
if [ ! -f "$SOURCE_SVG" ]; then
    echo "Error: Source SVG file not found at $SOURCE_SVG"
    exit 1
fi

# Create seasonal directory if it doesn't exist
mkdir -p ./SVG/seasonal

# Spring - Japanese Cherry Blossom theme
echo "Creating Spring (Japanese Cherry Blossom) variant..."
./recolor_svg.py "$SOURCE_SVG" "./SVG/seasonal/logo-spring.svg" --color-map \
"water:#88c1e5,\
sun:#ffe66d,\
leaves-normal:#f8b7d3,\
leaves-light:#ffd1e8,\
leaves-dark:#d4809b,\
trunk:#8b6f5a,\
roots-normal:#f0e8e2,\
roots-light:#d5cec8,\
roots-dark:#a39b94"

# Summer - African Savanna theme
echo "Creating Summer (African Savanna) variant..."
./recolor_svg.py "$SOURCE_SVG" "./SVG/seasonal/logo-summer.svg" --color-map \
"water:#4a9bd1,\
sun:#ffcc33,\
leaves-normal:#4a7c3d,\
leaves-light:#6ba359,\
leaves-dark:#2e5024,\
trunk:#a67c52,\
roots-normal:#e8d9b5,\
roots-light:#d5c28e,\
roots-dark:#b29e6b"

# Fall - North American Autumn theme
echo "Creating Fall (North American Autumn) variant..."
./recolor_svg.py "$SOURCE_SVG" "./SVG/seasonal/logo-fall.svg" --color-map \
"water:#5e8ca7,\
sun:#f9a825,\
leaves-normal:#e67e22,\
leaves-light:#f39c12,\
leaves-dark:#c0392b,\
trunk:#6d4c41,\
roots-normal:#d7ccc8,\
roots-light:#bcaaa4,\
roots-dark:#8d6e63"

# Winter - Nordic theme
echo "Creating Winter (Nordic) variant..."
./recolor_svg.py "$SOURCE_SVG" "./SVG/seasonal/logo-winter.svg" --color-map \
"water:#2c3e50,\
sun:#ecf0f1,\
leaves-normal:#5d8ca8,\
leaves-light:#89c4e1,\
leaves-dark:#34495e,\
trunk:#6d4c41,\
roots-normal:#e0e0e0,\
roots-light:#bdbdbd,\
roots-dark:#757575"

echo "All seasonal variants created in ./SVG/seasonal/"
echo "You can convert them to PNG with:"
echo "./svg_to_png.sh 300 ./SVG/seasonal ./PNG/seasonal"
