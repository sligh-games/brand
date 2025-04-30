# Sligh Games Logo Assets

This repository contains the official logo assets for Sligh Games in various formats and styles.

## Directory Structure

- **SVG/** - Vector source files in SVG format
- **PNG/** - Raster exports in PNG format (300 DPI)

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

## Usage Guidelines

- Use the SVG files for print and high-quality digital materials
- Use the PNG files for web and digital applications
- Always maintain the proportions of the logos when resizing
- Ensure adequate spacing around the logo (at least the height of the "S" in the logo)
- Do not alter the colors or modify the logo design

## Tools

This repository includes a script to convert SVG files to PNG:

```bash
# Convert all SVGs in the SVG directory to PNGs in the PNG directory
./svg_to_png.sh

# Specify custom DPI (default is 300)
./svg_to_png.sh 600

# Specify custom input and output directories
./svg_to_png.sh 300 custom_svg_dir custom_png_dir
```

## Requirements

- Inkscape (for SVG to PNG conversion)

## License

All logo assets are copyright © Sligh Games. All rights reserved.
