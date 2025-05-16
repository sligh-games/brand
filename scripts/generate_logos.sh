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
    echo "  --no-convert    Skip conversion to PDF, PNG, and JPG"
    echo "  --no-bg         Don't add black background to white logos in JPG format"
}

# Default options
GENERATE_STANDARD=true
CONVERT_FILES=true
ADD_BACKGROUND=true

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
        --no-bg)
            ADD_BACKGROUND=false
            shift
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Set correct paths for the source SVGs
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SOURCE_SVG="$PROJECT_ROOT/public/logos/SVG/sligh-games-logo-color.svg"
SOURCE_NAME_SVG="$PROJECT_ROOT/public/logos/SVG/sligh-games-logo-name-color.svg"

if [ ! -f "$SOURCE_SVG" ]; then
    echo "Error: Source SVG file not found at $SOURCE_SVG"
    exit 1
fi

if [ ! -f "$SOURCE_NAME_SVG" ]; then
    echo "Error: Source name SVG file not found at $SOURCE_NAME_SVG"
    exit 1
fi

# Generate standard variants (black, white, etc.)
generate_standard_variants() {
    echo "Generating standard variants..."

    # Black variant
    echo "Creating black variant..."
    python3 "$SCRIPT_DIR/recolor_svg.py" "$SOURCE_SVG" "$PROJECT_ROOT/public/logos/SVG/sligh-games-logo-black.svg" --color-map \
    "water:#000000,\
    sun:#000000,\
    leaves-normal:#000000,\
    leaves-light:#000000,\
    leaves-dark:#000000,\
    trunk:#000000,\
    roots-normal:#000000,\
    roots-light:#000000,\
    roots-dark:#000000"

    python3 "$SCRIPT_DIR/recolor_svg.py" "$SOURCE_NAME_SVG" "$PROJECT_ROOT/public/logos/SVG/sligh-games-logo-name-black.svg" --color-map \
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
    python3 "$SCRIPT_DIR/recolor_svg.py" "$SOURCE_SVG" "$PROJECT_ROOT/public/logos/SVG/sligh-games-logo-white.svg" --color-map \
    "water:#ffffff,\
    sun:#ffffff,\
    leaves-normal:#ffffff,\
    leaves-light:#ffffff,\
    leaves-dark:#ffffff,\
    trunk:#ffffff,\
    roots-normal:#ffffff,\
    roots-light:#ffffff,\
    roots-dark:#ffffff"

    python3 "$SCRIPT_DIR/recolor_svg.py" "$SOURCE_NAME_SVG" "$PROJECT_ROOT/public/logos/SVG/sligh-games-logo-name-white.svg" --color-map \
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

    echo "All standard variants created in $PROJECT_ROOT/public/logos/SVG/"
}

# Generate multiple DPI variants
generate_dpi_variants() {
    if [ "$GENERATE_STANDARD" = true ]; then
        echo "Converting standard variants at multiple DPIs..."
        
        # Create output directories if they don't exist
        mkdir -p "$PROJECT_ROOT/public/logos/PDF"
        mkdir -p "$PROJECT_ROOT/public/logos/PNG"
        mkdir -p "$PROJECT_ROOT/public/logos/JPG"
        
        # Define an array of DPI values
        DPI_VALUES=(300 150 100 75 50 25)
        
        # Set background color for JPG white logos if enabled
        JPG_BG_COLOR="none"
        if [ "$ADD_BACKGROUND" = true ]; then
            JPG_BG_COLOR="black"
        fi
        
        # Convert SVGs to PDFs (first as it's vector format)
        echo "Converting to PDF..."
        "$SCRIPT_DIR/export_svg.sh" pdf "$PROJECT_ROOT/public/logos/SVG" "$PROJECT_ROOT/public/logos/PDF" 300 90 "none"
        
        # Loop through each DPI value for PNG (always with transparency)
        for dpi in "${DPI_VALUES[@]}"; do
            echo "Converting to PNG at $dpi DPI (with transparency)..."
            
            # Create directory for this DPI if it doesn't exist
            mkdir -p "$PROJECT_ROOT/public/logos/PNG/$dpi"
            
            # Convert SVGs to PNGs at this DPI (always with transparency)
            "$SCRIPT_DIR/export_svg.sh" png "$PROJECT_ROOT/public/logos/SVG" "$PROJECT_ROOT/public/logos/PNG/$dpi" $dpi 90 "none"
        done
        
        # Loop through each DPI value for JPG
        for dpi in "${DPI_VALUES[@]}"; do
            echo "Converting to JPG at $dpi DPI..."
            
            # Create directory for this DPI if it doesn't exist
            mkdir -p "$PROJECT_ROOT/public/logos/JPG/$dpi"
            
            # Convert SVGs to JPGs at this DPI with 90% quality and background for white logos
            "$SCRIPT_DIR/export_svg.sh" jpg "$PROJECT_ROOT/public/logos/SVG" "$PROJECT_ROOT/public/logos/JPG/$dpi" $dpi 90 "$JPG_BG_COLOR"
        done
    fi
}

# Main execution
if [ "$GENERATE_STANDARD" = true ]; then
    generate_standard_variants
fi

if [ "$CONVERT_FILES" = true ]; then
    generate_dpi_variants
fi

echo "Logo generation complete."
