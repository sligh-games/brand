#!/bin/bash
# Master script to generate all logo variants
# Copyright © 2025 Frederic Nowak. All Rights Reserved.
# Copyright © 2025 Sligh Games. All Rights Reserved.

# Set script to exit on error
set -e

# Display help information
show_help() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  --help          Show this help message"
    echo "  --seasonal      Generate only seasonal variants"
    echo "  --standard      Generate only standard variants"
    echo "  --all           Generate all variants (default)"
    echo "  --no-convert    Skip conversion to PNG and PDF"
}

# Parse command line arguments
GENERATE_SEASONAL=true
GENERATE_STANDARD=true
CONVERT_FILES=true

while [[ $# -gt 0 ]]; do
    case $1 in
        --help)
            show_help
            exit 0
            ;;
        --seasonal)
            GENERATE_SEASONAL=true
            GENERATE_STANDARD=false
            shift
            ;;
        --standard)
            GENERATE_SEASONAL=false
            GENERATE_STANDARD=true
            shift
            ;;
        --all)
            GENERATE_SEASONAL=true
            GENERATE_STANDARD=true
            shift
            ;;
        --no-convert)
            CONVERT_FILES=false
            shift
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Check if the source SVGs exist
SOURCE_SVG="$(pwd)/../logos/SVG/logo-color.svg"
SOURCE_NAME_SVG="$(pwd)/../logos/SVG/logo-name-color.svg"

if [ ! -f "$SOURCE_SVG" ]; then
    echo "Error: Source SVG file not found at $SOURCE_SVG"
    exit 1
fi

if [ ! -f "$SOURCE_NAME_SVG" ]; then
    echo "Error: Source SVG file with name not found at $SOURCE_NAME_SVG"
    exit 1
fi

# Create directories if they don't exist
mkdir -p ../logos/SVG/seasonal
mkdir -p ../logos/PNG/seasonal
mkdir -p ../logos/PDF/seasonal

# Generate seasonal variants
generate_seasonal_variants() {
    echo "Generating seasonal variants..."
    
    # Spring - Japanese Cherry Blossom theme
    echo "Creating Spring (Japanese Cherry Blossom) variants..."
    ./recolor_svg.py "$SOURCE_SVG" "../logos/SVG/seasonal/logo-spring.svg" --color-map \
    "water:#4db6ac,\
    sun:#ffab91,\
    leaves-normal:#f06292,\
    leaves-light:#f8bbd0,\
    leaves-dark:#c2185b,\
    trunk:#8d6e63,\
    roots-normal:#78909c,\
    roots-light:#b0bec5,\
    roots-dark:#546e7a"

    ./recolor_svg.py "$SOURCE_NAME_SVG" "../logos/SVG/seasonal/logo-name-spring.svg" --color-map \
    "water:#4db6ac,\
    sun:#ffab91,\
    leaves-normal:#f06292,\
    leaves-light:#f8bbd0,\
    leaves-dark:#c2185b,\
    trunk:#8d6e63,\
    roots-normal:#78909c,\
    roots-light:#b0bec5,\
    roots-dark:#546e7a,\
    name:#546e7a"

    # Summer - African Savanna theme
    echo "Creating Summer (African Savanna) variants..."
    ./recolor_svg.py "$SOURCE_SVG" "../logos/SVG/seasonal/logo-summer.svg" --color-map \
    "water:#00acc1,\
    sun:#ffa000,\
    leaves-normal:#7cb342,\
    leaves-light:#aed581,\
    leaves-dark:#558b2f,\
    trunk:#8d6e63,\
    roots-normal:#a1887f,\
    roots-light:#bcaaa4,\
    roots-dark:#795548"

    ./recolor_svg.py "$SOURCE_NAME_SVG" "../logos/SVG/seasonal/logo-name-summer.svg" --color-map \
    "water:#00acc1,\
    sun:#ffa000,\
    leaves-normal:#7cb342,\
    leaves-light:#aed581,\
    leaves-dark:#558b2f,\
    trunk:#8d6e63,\
    roots-normal:#a1887f,\
    roots-light:#bcaaa4,\
    roots-dark:#795548,\
    name:#795548"

    # Fall - North American Autumn theme
    echo "Creating Fall (North American Autumn) variants..."
    ./recolor_svg.py "$SOURCE_SVG" "../logos/SVG/seasonal/logo-fall.svg" --color-map \
    "water:#607d8b,\
    sun:#ffb300,\
    leaves-normal:#e53935,\
    leaves-light:#ffb74d,\
    leaves-dark:#b71c1c,\
    trunk:#5d4037,\
    roots-normal:#8d6e63,\
    roots-light:#a1887f,\
    roots-dark:#4e342e"

    ./recolor_svg.py "$SOURCE_NAME_SVG" "../logos/SVG/seasonal/logo-name-fall.svg" --color-map \
    "water:#607d8b,\
    sun:#ffb300,\
    leaves-normal:#e53935,\
    leaves-light:#ffb74d,\
    leaves-dark:#b71c1c,\
    trunk:#5d4037,\
    roots-normal:#8d6e63,\
    roots-light:#a1887f,\
    roots-dark:#4e342e,\
    name:#4e342e"

    # Winter - Nordic theme
    echo "Creating Winter (Nordic) variants..."
    ./recolor_svg.py "$SOURCE_SVG" "../logos/SVG/seasonal/logo-winter.svg" --color-map \
    "water:#0d47a1,\
    sun:#fff176,\
    leaves-normal:#4fc3f7,\
    leaves-light:#e1f5fe,\
    leaves-dark:#0277bd,\
    trunk:#757575,\
    roots-normal:#90a4ae,\
    roots-light:#cfd8dc,\
    roots-dark:#455a64"

    ./recolor_svg.py "$SOURCE_NAME_SVG" "../logos/SVG/seasonal/logo-name-winter.svg" --color-map \
    "water:#0d47a1,\
    sun:#fff176,\
    leaves-normal:#4fc3f7,\
    leaves-light:#e1f5fe,\
    leaves-dark:#0277bd,\
    trunk:#757575,\
    roots-normal:#90a4ae,\
    roots-light:#cfd8dc,\
    roots-dark:#455a64,\
    name:#455a64"

    echo "All seasonal variants created in ../logos/SVG/seasonal/"
}

# Generate standard variants (black, white, etc.)
generate_standard_variants() {
    echo "Generating standard variants..."
    
    # Black variant
    echo "Creating black variant..."
    ./recolor_svg.py "$SOURCE_SVG" "../logos/SVG/logo-black.svg" --color-map \
    "water:#000000,\
    sun:#000000,\
    leaves-normal:#000000,\
    leaves-light:#000000,\
    leaves-dark:#000000,\
    trunk:#000000,\
    roots-normal:#000000,\
    roots-light:#000000,\
    roots-dark:#000000"

    ./recolor_svg.py "$SOURCE_NAME_SVG" "../logos/SVG/logo-name-black.svg" --color-map \
    "water:#000000,\
    sun:#000000,\
    leaves-normal:#000000,\
    leaves-light:#000000,\
    leaves-dark:#000000,\
    trunk:#000000,\
    roots-normal:#000000,\
    roots-light:#000000,\
    roots-dark:#000000,\
    name:#000000"

    # White variant
    echo "Creating white variant..."
    ./recolor_svg.py "$SOURCE_SVG" "../logos/SVG/logo-white.svg" --color-map \
    "water:#ffffff,\
    sun:#ffffff,\
    leaves-normal:#ffffff,\
    leaves-light:#ffffff,\
    leaves-dark:#ffffff,\
    trunk:#ffffff,\
    roots-normal:#ffffff,\
    roots-light:#ffffff,\
    roots-dark:#ffffff"

    ./recolor_svg.py "$SOURCE_NAME_SVG" "../logos/SVG/logo-name-white.svg" --color-map \
    "water:#ffffff,\
    sun:#ffffff,\
    leaves-normal:#ffffff,\
    leaves-light:#ffffff,\
    leaves-dark:#ffffff,\
    trunk:#ffffff,\
    roots-normal:#ffffff,\
    roots-light:#ffffff,\
    roots-dark:#ffffff,\
    name:#ffffff"

    echo "All standard variants created in ../logos/SVG/"
}

# Convert SVG files to PNG and PDF
convert_files() {
    echo "Converting files to PNG and PDF formats..."
    
    if [ "$GENERATE_SEASONAL" = true ]; then
        echo "Converting seasonal variants..."
        ./svg_to_png.sh 300 ../logos/SVG/seasonal ../logos/PNG/seasonal
        ./svg_to_pdf.sh ../logos/SVG/seasonal ../logos/PDF/seasonal
    fi
    
    if [ "$GENERATE_STANDARD" = true ]; then
        echo "Converting standard variants..."
        ./svg_to_png.sh 300 ../logos/SVG ../logos/PNG
        ./svg_to_pdf.sh ../logos/SVG ../logos/PDF
    fi
}

# Main execution
if [ "$GENERATE_SEASONAL" = true ]; then
    generate_seasonal_variants
fi

if [ "$GENERATE_STANDARD" = true ]; then
    generate_standard_variants
fi

if [ "$CONVERT_FILES" = true ]; then
    convert_files
fi

echo "Logo generation complete!"
