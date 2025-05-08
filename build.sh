#!/bin/bash
# Main build script for generating all Sligh Games logo assets
# Copyright © 2025 Frederic Nowak. All Rights Reserved.
# Copyright © 2025 Sligh Games. All Rights Reserved.

# Set script to exit on error
set -e

# Display help information
show_help() {
    echo "Sligh Games Logo Asset Builder"
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  --help          Show this help message"
    echo "  --seasonal      Generate only seasonal variants"
    echo "  --standard      Generate only standard variants"
    echo "  --all           Generate all variants (default)"
    echo "  --no-convert    Skip conversion to PNG and PDF"
}

# Parse command line arguments
ARGS=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --help)
            show_help
            exit 0
            ;;
        --seasonal|--standard|--all|--no-convert)
            ARGS="$ARGS $1"
            shift
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Check if scripts directory exists
if [ ! -d "scripts" ]; then
    echo "Error: scripts directory not found"
    exit 1
fi

# Run the generate_logos.sh script with the provided arguments
cd scripts && ./generate_logos.sh $ARGS

echo "Build complete! Logo assets have been generated."
