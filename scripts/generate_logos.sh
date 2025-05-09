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
    echo "  --standard      Generate standard variants (default)"
    echo "  --no-convert    Skip conversion to PNG and PDF"
}

# Parse command line arguments
GENERATE_STANDARD=true
CONVERT_FILES=true

while [[ $# -gt 0 ]]; do
    case $1 in
        --help)
            show_help
            exit 0
            ;;
        --standard)
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
SOURCE_SVG="$(pwd)/../public/logos/SVG/sligh-games-logo-color.svg"
SOURCE_NAME_SVG="$(pwd)/../public/logos/SVG/sligh-games-logo-name-color.svg"

if [ ! -f "$SOURCE_SVG" ]; then
    echo "Error: Source SVG file not found at $SOURCE_SVG"
    exit 1
fi

if [ ! -f "$SOURCE_NAME_SVG" ]; then
    echo "Error: Source SVG file with name not found at $SOURCE_NAME_SVG"
    exit 1
fi

# Generate standard variants (black, white, etc.)
generate_standard_variants() {
    echo "Generating standard variants..."
    
    # Black variant
    echo "Creating black variant..."
    ./recolor_svg.py "$SOURCE_SVG" "../public/logos/SVG/sligh-games-logo-black.svg" --color-map \
    "water:#000000,\
    sun:#000000,\
    leaves-normal:#000000,\
    leaves-light:#000000,\
    leaves-dark:#000000,\
    trunk:#000000,\
    roots-normal:#000000,\
    roots-light:#000000,\
    roots-dark:#000000"

    ./recolor_svg.py "$SOURCE_NAME_SVG" "../public/logos/SVG/sligh-games-logo-name-black.svg" --color-map \
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
    ./recolor_svg.py "$SOURCE_SVG" "../public/logos/SVG/sligh-games-logo-white.svg" --color-map \
    "water:#ffffff,\
    sun:#ffffff,\
    leaves-normal:#ffffff,\
    leaves-light:#ffffff,\
    leaves-dark:#ffffff,\
    trunk:#ffffff,\
    roots-normal:#ffffff,\
    roots-light:#ffffff,\
    roots-dark:#ffffff"

    ./recolor_svg.py "$SOURCE_NAME_SVG" "../public/logos/SVG/sligh-games-logo-name-white.svg" --color-map \
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

    echo "All standard variants created in ../public/logos/SVG/"
}

# Convert SVG files to PNG and PDF
convert_files() {
    echo "Converting files to PNG and PDF formats..."
    
    if [ "$GENERATE_STANDARD" = true ]; then
        echo "Converting standard variants..."
        ./svg_to_png.sh 300 ../public/logos/SVG ../public/logos/PNG
        ./svg_to_pdf.sh ../public/logos/SVG ../public/logos/PDF
    fi
}

# Main execution
if [ "$GENERATE_STANDARD" = true ]; then
    generate_standard_variants
fi

if [ "$CONVERT_FILES" = true ]; then
    convert_files
fi

echo "Logo generation complete!"
