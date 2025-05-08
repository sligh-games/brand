#!/bin/bash
# Convert SVG files to PDF format
# Copyright © 2025 Sligh Games. All Rights Reserved.

# Check if Inkscape is installed
if ! command -v inkscape &> /dev/null; then
    echo "Error: Inkscape is required but not installed."
    exit 1
fi

SVG_DIR=${1:-"../logos/SVG"}
PDF_DIR=${2:-"../logos/PDF"}

# Create PDF directory if it doesn't exist
mkdir -p "$PDF_DIR"

echo "Converting SVG files to PDF..."

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
    pdf_filename="${filename%.svg}.pdf"
    pdf_path="$PDF_DIR/$pdf_filename"
    
    echo "Converting $filename to $pdf_filename..."
    
    # Convert SVG to PDF using Inkscape
    inkscape --export-filename="$pdf_path" --export-type=pdf "$svg_file"
    
    if [ $? -eq 0 ]; then
        echo "  Success: Created $pdf_filename"
    else
        echo "  Error: Failed to convert $filename"
    fi
done

echo "PDF conversion complete!"
