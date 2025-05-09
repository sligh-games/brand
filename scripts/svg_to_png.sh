#!/bin/bash
# Convert SVG files to PNG format
# Copyright © 2025 Sligh Games. All Rights Reserved.

# Check if Inkscape is installed
if ! command -v inkscape &> /dev/null; then
    echo "Error: Inkscape is required but not installed."
    exit 1
fi

# Default DPI if not provided
DPI=${1:-300}
SVG_DIR=${2:-"../public/logos/SVG"}
PNG_DIR=${3:-"../public/logos/PNG"}

# Create PNG directory if it doesn't exist
mkdir -p "$PNG_DIR"

echo "Converting SVG files to PNG with $DPI DPI..."

# Process each SVG file
for svg_file in "$SVG_DIR"/*.svg; do
    # Skip if not a file
    [ -f "$svg_file" ] || continue
    
    # Skip .DS_Store files
    if [[ "$(basename "$svg_file")" == ".DS_Store" ]]; then
        continue
    fi
    
    # Get the base filename
    filename=$(basename "$svg_file")
    png_filename="${filename%.svg}.png"
    png_path="$PNG_DIR/$png_filename"
    
    echo "Converting $filename to $png_filename..."
    
    # Convert SVG to PNG using Inkscape
    inkscape --export-filename="$png_path" --export-dpi=$DPI "$svg_file"
    
    if [ $? -eq 0 ]; then
        echo "  Success: Created $png_filename"
    else
        echo "  Error: Failed to convert $filename"
    fi
done

echo "PNG conversion complete!"
