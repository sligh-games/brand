# Sligh Games Logo Assets

This repository contains the official logo assets for Sligh Games in various formats and styles.

## Directory Structure

- **logos/** - Main directory containing all logo assets
  - **logos/SVG/** - Vector source files in SVG format
    - **logos/SVG/seasonal/** - Seasonal variants in SVG format
  - **logos/PNG/** - Raster exports in PNG format (300 DPI)
    - **logos/PNG/seasonal/** - Seasonal variants in PNG format
  - **logos/PDF/** - Vector exports in PDF format
    - **logos/PDF/seasonal/** - Seasonal variants in PDF format
- **scripts/** - Utility scripts for managing and converting logo files

## Available Variants

All logos are available in the following variants:

- **Full Logo with Name (Horizontal)** - Logo and name side by side
- **Full Logo with Name (Vertical)** - Logo with name underneath
- **Logo Only** - Just the logo mark without text
- **Name Only** - Just the text without the logo mark

Each variant is available in these color options:
- Color (primary brand colors)
- Black (for dark backgrounds)
- White (for light backgrounds)

### Seasonal Variants

The logo is also available in seasonal color themes:
- **Spring** - Japanese Cherry Blossom theme with pink leaves
- **Summer** - African Savanna theme with vibrant green leaves
- **Fall** - North American Autumn theme with orange leaves
- **Winter** - Nordic theme with blue leaves

All seasonal variants are available in SVG, PNG, and PDF formats.

## Usage Guidelines

- Use the SVG files for print and high-quality digital materials
- Use the PNG files for web and digital applications
- Use the PDF files for professional printing and publications
- Always maintain the proportions of the logos when resizing
- Ensure adequate spacing around the logo (at least the height of the "S" in the logo)
- Do not alter the colors or modify the logo design

## Tools

This repository includes scripts to convert and modify SVG files:

```bash
# Build all logo variants (SVG, PNG, PDF) including seasonal variants
./build.sh

# Convert all SVGs in the logos/SVG directory to PNGs in the logos/PNG directory
./scripts/svg_to_png.sh

# Specify custom DPI (default is 300)
./scripts/svg_to_png.sh 600

# Specify custom input and output directories
./scripts/svg_to_png.sh 300 custom_svg_dir custom_png_dir

# Convert all SVGs in the logos/SVG directory to PDFs in the logos/PDF directory
./scripts/svg_to_pdf.sh

# Specify custom input and output directories
./scripts/svg_to_pdf.sh custom_svg_dir custom_pdf_dir

# Analyze an SVG file to see group IDs and their colors
./scripts/recolor_svg.py --analyze input.svg output.svg

# Recolor an SVG file based on group IDs
./scripts/recolor_svg.py input.svg output.svg --color-map "water:#0000FF,sun:#FFFF00"

# Generate all seasonal variants from the base logo
./scripts/seasonal_colors.sh

# Clean SVG files by removing id and style attributes from path nodes
./scripts/clean_svg_paths.py
```

## Requirements

- Inkscape (for SVG to PNG and SVG to PDF conversion)
- Python 3 (for the recolor_svg.py script)

## License

Copyright © 2025 Frederic Nowak. All Rights Reserved.
Copyright © 2025 Sligh Games. All Rights Reserved.

All logo assets are jointly owned by Frederic Nowak and Sligh Games.
