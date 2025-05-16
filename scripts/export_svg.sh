#!/bin/bash
#
# export_svg.sh - Export SVG files to various formats using Inkscape
#
# Usage: ./export_svg.sh [type] [input_dir] [output_dir] [dpi] [quality] [bg_color]
#
# Parameters:
#   type       - Export file type (pdf, png, jpg, eps, etc.) (default: png)
#   input_dir  - Directory containing SVG files (default: ../public/logos/SVG)
#   output_dir - Directory to save exported files (default: ../public/logos/[TYPE])
#   dpi        - Resolution in DPI (default: 300)
#   quality    - Quality for lossy formats like JPG (1-100, default: 90)
#   bg_color   - Background color for white logos (default: none, use "black" for white logos)
#
# Examples:
#   ./export_svg.sh png ../public/logos/SVG ../public/logos/PNG 300 90
#   ./export_svg.sh pdf ../public/logos/SVG ../public/logos/PDF 300 90
#   ./export_svg.sh jpg ../public/logos/SVG ../public/logos/JPG 300 90 black
#
# Copyright © 2025 Sligh Games. All Rights Reserved.

set -e

# Check if Inkscape is installed
if ! command -v inkscape &> /dev/null; then
    echo "Error: Inkscape is required but not installed."
    echo "Please install Inkscape and try again."
    exit 1
fi

# Default parameters
TYPE=${1:-"png"}
INPUT_DIR=${2:-"../public/logos/SVG"}
OUTPUT_DIR=${3:-"../public/logos/${TYPE}"}
DPI=${4:-300}
QUALITY=${5:-90}
BG_COLOR=${6:-"none"}

# Validate DPI parameter
if ! [[ "$DPI" =~ ^[0-9]+$ ]] || [ "$DPI" -lt 1 ]; then
    echo "Error: DPI must be a positive number"
    exit 1
fi

# Validate quality parameter
if ! [[ "$QUALITY" =~ ^[0-9]+$ ]] || [ "$QUALITY" -lt 1 ] || [ "$QUALITY" -gt 100 ]; then
    echo "Error: Quality must be a number between 1 and 100"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Convert TYPE to uppercase for display purposes
TYPE_UPPER=$(echo "$TYPE" | tr '[:lower:]' '[:upper:]')
echo "Converting SVG files to $TYPE_UPPER (DPI: $DPI, Quality: $QUALITY, Background: $BG_COLOR)..."

# Process each SVG file
for svg_file in "$INPUT_DIR"/*.svg; do
    if [ -f "$svg_file" ]; then
        # Get the filename without extension
        filename=$(basename "$svg_file" .svg)
        
        # Check if this is a white logo that needs a background
        needs_bg=false
        if [[ "$BG_COLOR" != "none" && "$filename" == *"-white"* ]]; then
            needs_bg=true
            echo "Converting $filename.svg to $TYPE_UPPER with $BG_COLOR background..."
        else
            echo "Converting $filename.svg to $TYPE_UPPER..."
        fi
        
        # For JPG, we need to export to PNG first and then convert
        if [ "$TYPE" = "jpg" ] || [ "$TYPE" = "jpeg" ]; then
            # Export to PNG first (temporary file)
            temp_png="/tmp/${filename}_temp.png"
            
            if [ "$needs_bg" = true ]; then
                # Export with background color for white logos
                inkscape --export-filename="$temp_png" --export-background="$BG_COLOR" --export-background-opacity=1.0 --export-dpi=$DPI "$svg_file" 2>/dev/null
            else
                # Standard export for other logos
                inkscape --export-filename="$temp_png" --export-dpi=$DPI "$svg_file" 2>/dev/null
            fi
            
            # Convert PNG to JPG using sips (macOS built-in)
            output_file="$OUTPUT_DIR/${filename}.jpg"
            sips -s format jpeg -s formatOptions $QUALITY "$temp_png" --out "$output_file" &>/dev/null
            
            # Remove temporary PNG
            rm "$temp_png"
        else
            output_file="$OUTPUT_DIR/${filename}.${TYPE}"
            
            # For other formats, use Inkscape directly
            EXPORT_OPTIONS="--export-filename=$output_file --export-type=$TYPE --export-dpi=$DPI"
            
            # Add background for white logos if needed
            if [ "$needs_bg" = true ]; then
                EXPORT_OPTIONS="$EXPORT_OPTIONS --export-background=$BG_COLOR --export-background-opacity=1.0"
            fi
            
            # Execute the export command
            inkscape $EXPORT_OPTIONS "$svg_file" 2>/dev/null
        fi
        
        if [ -f "$output_file" ]; then
            echo "  Saved to $output_file"
        else
            echo "  Error: Failed to convert $filename.svg to $TYPE_UPPER"
            exit 1
        fi
    fi
done

echo "Conversion complete. All SVG files have been converted to $TYPE_UPPER format."
