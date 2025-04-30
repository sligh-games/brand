#!/bin/bash
# Script to convert SVG files to PNG using Inkscape
# Usage: ./svg_to_png.sh [dpi] [input_directory] [output_directory]

# Default values
DPI=${1:-300}           # Default DPI is 300 if not specified
INPUT_DIR=${2:-"svg"}   # Default input directory is "svg" if not specified
OUTPUT_DIR=${3:-"png"}  # Default output directory is "png" if not specified

# Check if input directory exists
if [ ! -d "$INPUT_DIR" ]; then
    echo "Input directory '$INPUT_DIR' does not exist. Creating it..."
    mkdir -p "$INPUT_DIR"
    echo "Please place your SVG files in the '$INPUT_DIR' directory and run this script again."
    exit 0
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

echo "Found $SVG_COUNT SVG files in '$INPUT_DIR'. Converting to PNG with $DPI DPI..."

# Process each SVG file
for SVG_FILE in "$INPUT_DIR"/*.svg; do
    # Get filename without extension
    FILENAME=$(basename "$SVG_FILE" .svg)
    
    echo "Converting $(basename "$SVG_FILE") to PNG..."
    
    # Use Inkscape to export SVG to PNG
    inkscape --export-filename="$OUTPUT_DIR/$FILENAME.png" \
             --export-dpi=$DPI \
             "$SVG_FILE"
    
    # Check if conversion was successful
    if [ $? -eq 0 ]; then
        echo "  ✓ Successfully created $OUTPUT_DIR/$FILENAME.png"
    else
        echo "  ✗ Failed to convert $SVG_FILE"
    fi
done

echo "Conversion complete. PNG files are in the '$OUTPUT_DIR' directory."
