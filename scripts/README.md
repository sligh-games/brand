# Sligh Games Logo Scripts

This directory contains utility scripts for managing and generating Sligh Games logo assets.

## Main Scripts

### generate_logos.sh

The primary script for generating all logo variants. This script can generate both standard and seasonal variants and convert them to PNG and PDF formats.

```bash
# Generate all logo variants (standard and seasonal) and convert to PNG/PDF
./generate_logos.sh

# Generate only seasonal variants
./generate_logos.sh --seasonal

# Generate only standard variants (black, white, etc.)
./generate_logos.sh --standard

# Generate all variants but skip conversion to PNG/PDF
./generate_logos.sh --no-convert

# Show help information
./generate_logos.sh --help
```

### analyze_logo.sh

A utility script to analyze SVG logo files and show color information.

```bash
# Analyze the standard color logo
./analyze_logo.sh ../logos/SVG/logo-color.svg

# Analyze a seasonal variant and save output to a specific file
./analyze_logo.sh --output analyzed.svg ../logos/SVG/seasonal/logo-fall.svg
```

## Utility Scripts

### svg_to_png.sh

Converts SVG files to PNG format with specified DPI.

```bash
# Convert all SVGs in a directory with default 300 DPI
./svg_to_png.sh 300 ../logos/SVG ../logos/PNG

# Convert with custom DPI
./svg_to_png.sh 600 ../logos/SVG ../logos/PNG
```

### svg_to_pdf.sh

Converts SVG files to PDF format.

```bash
# Convert all SVGs in a directory
./svg_to_pdf.sh ../logos/SVG ../logos/PDF
```

### recolor_svg.py

Python script for analyzing and recoloring SVG files based on group IDs.

```bash
# Analyze an SVG file
./recolor_svg.py --analyze input.svg output.svg

# Recolor an SVG file based on group IDs
./recolor_svg.py input.svg output.svg --color-map "water:#0000FF,sun:#FFFF00"
```

### clean_svg_paths.py

Cleans SVG files by removing unnecessary attributes from path nodes.

```bash
# Clean an SVG file
./clean_svg_paths.py input.svg output.svg
```

### add_copyright_to_svg.py

Adds copyright information to SVG files.

```bash
# Add copyright to an SVG file
./add_copyright_to_svg.py input.svg output.svg "Copyright © 2025 Sligh Games"
```

## Requirements

- Inkscape (for SVG to PNG and SVG to PDF conversion)
- Python 3 (for Python scripts)

## Copyright

Copyright © 2025 Frederic Nowak. All Rights Reserved.  
Copyright © 2025 Sligh Games. All Rights Reserved.
