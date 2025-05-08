#!/bin/bash
# Script to analyze SVG logo files and show color information
# Copyright © 2025 Frederic Nowak. All Rights Reserved.
# Copyright © 2025 Sligh Games. All Rights Reserved.

# Set script to exit on error
set -e

# Display help information
show_help() {
    echo "Usage: $0 [options] <svg_file>"
    echo "Options:"
    echo "  --help          Show this help message"
    echo "  --output <file> Specify output file (default: /tmp/output.svg)"
    echo ""
    echo "Example:"
    echo "  $0 ../logos/SVG/logo-color.svg"
    echo "  $0 --output analyzed.svg ../logos/SVG/logo-color.svg"
}

# Parse command line arguments
OUTPUT_FILE="/tmp/output.svg"

while [[ $# -gt 0 ]]; do
    case $1 in
        --help)
            show_help
            exit 0
            ;;
        --output)
            OUTPUT_FILE="$2"
            shift 2
            ;;
        *)
            if [ -z "$SVG_FILE" ]; then
                SVG_FILE="$1"
                shift
            else
                echo "Unknown option: $1"
                show_help
                exit 1
            fi
            ;;
    esac
done

# Check if SVG file is provided
if [ -z "$SVG_FILE" ]; then
    echo "Error: No SVG file specified"
    show_help
    exit 1
fi

# Check if the SVG file exists
if [ ! -f "$SVG_FILE" ]; then
    echo "Error: SVG file not found at $SVG_FILE"
    exit 1
fi

# Analyze the SVG file
echo "Analyzing SVG file: $SVG_FILE"
./recolor_svg.py --analyze "$SVG_FILE" "$OUTPUT_FILE"

echo "Analysis complete. Use the color map format shown above with recolor_svg.py to modify colors."
