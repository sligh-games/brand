#!/bin/bash
# Script to convert SVG files to PDF using Inkscape
# Copyright © 2025 Frederic Nowak. All Rights Reserved.
# Copyright © 2025 Sligh Games. All Rights Reserved.
# Usage: ./svg_to_pdf.sh [input_directory] [output_directory]

# Default values
INPUT_DIR=${1:-"../logos/SVG"}   # Default input directory is "../logos/SVG" if not specified
OUTPUT_DIR=${2:-"../logos/PDF"}  # Default output directory is "../logos/PDF" if not specified

# Check if input directory exists
if [ ! -d "$INPUT_DIR" ]; then
    echo "Input directory '$INPUT_DIR' does not exist."
    echo "Please create the directory and place your SVG files there."
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Check if Inkscape is installed
if ! command -v inkscape &> /dev/null; then
    echo "Error: Inkscape is not installed or not in PATH"
    echo "Please install Inkscape first:"
    echo "  macOS: brew install inkscape"
    echo "  Linux: sudo apt-get install inkscape"
    exit 1
fi

# Count SVG files in the input directory
SVG_FILES=("$INPUT_DIR"/*.svg)
SVG_COUNT=${#SVG_FILES[@]}

# Check if the pattern didn't match any files
if [ ! -e "${SVG_FILES[0]}" ]; then
    echo "No SVG files found in the '$INPUT_DIR' directory."
    exit 1
fi

echo "Found $SVG_COUNT SVG files in '$INPUT_DIR'. Converting to PDF..."

# Process each SVG file
for SVG_FILE in "$INPUT_DIR"/*.svg; do
    # Get filename without extension
    FILENAME=$(basename "$SVG_FILE" .svg)
    
    echo "Converting $(basename "$SVG_FILE") to PDF..."
    
    # Use Inkscape to export SVG to PDF
    inkscape --export-filename="$OUTPUT_DIR/$FILENAME.pdf" \
             --export-type=pdf \
             "$SVG_FILE"
    
    # Check if conversion was successful
    if [ $? -eq 0 ]; then
        echo "  ✓ Successfully created $OUTPUT_DIR/$FILENAME.pdf"
    else
        echo "  ✗ Failed to convert $SVG_FILE"
    fi
done

echo "Conversion complete. PDF files are in the '$OUTPUT_DIR' directory."
