# Sligh Games Logo Assets

This repository contains the official logo assets for Sligh Games in various formats and styles.

## Directory Structure

- **SVG/** - Vector source files in SVG format
  - **SVG/seasonal/** - Seasonal variants in SVG format
- **PNG/** - Raster exports in PNG format (300 DPI)
  - **PNG/seasonal/** - Seasonal variants in PNG format
- **PDF/** - Vector exports in PDF format
  - **PDF/seasonal/** - Seasonal variants in PDF format

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
# Convert all SVGs in the SVG directory to PNGs in the PNG directory
./svg_to_png.sh

# Specify custom DPI (default is 300)
./svg_to_png.sh 600

# Specify custom input and output directories
./svg_to_png.sh 300 custom_svg_dir custom_png_dir

# Convert all SVGs in the SVG directory to PDFs in the PDF directory
./svg_to_pdf.sh

# Specify custom input and output directories
./svg_to_pdf.sh custom_svg_dir custom_pdf_dir

# Analyze an SVG file to see group IDs and their colors
./recolor_svg.py --analyze input.svg output.svg

# Recolor an SVG file based on group IDs
./recolor_svg.py input.svg output.svg --color-map "water:#0000FF,sun:#FFFF00"

# Generate all seasonal variants from the base logo
./seasonal_colors.sh
```

## Requirements

- Inkscape (for SVG to PNG and SVG to PDF conversion)
- Python 3 (for the recolor_svg.py script)

## License

All logo assets are copyright © Sligh Games. All rights reserved.
