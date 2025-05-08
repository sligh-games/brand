# Sligh Games Logo Assets

This repository contains the official logo assets for Sligh Games in various formats and styles.

## Directory Structure

- **logos/** - Main directory containing all logo assets
  - **logos/SVG/** - Vector source files in SVG format
  - **logos/PNG/** - Raster exports in PNG format (300 DPI)
  - **logos/PDF/** - Vector exports in PDF format
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

## Color Palette

### Standard Logo Colors

| Element | Color | Hex Code |
|---------|-------|----------|
| Water | Deep Blue | `#2f5c7e` |
| Sun | Yellow | `#ffe66d` |
| Leaves (Normal) | Green | `#436e4f` |
| Leaves (Light) | Light Green | `#689f7c` |
| Leaves (Dark) | Dark Green | `#2a443a` |
| Trunk | Brown | `#8b6f5a` |
| Roots (Normal) | Light Brown | `#a39b94` |
| Roots (Light) | Very Light Brown | `#d5cec8` |
| Roots (Dark) | Dark Brown | `#7d756f` |
| Name | Dark Brown | `#7d756f` |

## Usage Guidelines

- Use the SVG files for print and high-quality digital materials
- Use the PNG files for web and digital applications
- Use the PDF files for professional printing and publications
- Always maintain the proportions of the logos when resizing
- Ensure adequate spacing around the logo (at least the height of the "S" in the logo)
- Do not alter the colors or modify the logo design
- Use the exact color codes provided in the color palette for all official materials
- For print materials, use the CMYK equivalents of these colors
- For web and digital applications, use the RGB/HEX values

## Tools and Scripts

This repository includes several scripts to manage and generate logo assets:

### Main Scripts

#### generate_logos.sh

The primary script for generating all logo variants and converting them to different formats.

```bash
# Generate all standard variants and convert to PNG/PDF
./scripts/generate_logos.sh

# Generate only standard variants (black, white, etc.)
./scripts/generate_logos.sh --standard

# Generate all variants but skip conversion to PNG/PDF
./scripts/generate_logos.sh --no-convert

# Show help information
./scripts/generate_logos.sh --help
```

#### analyze_logo.sh

A utility script to analyze SVG logo files and show color information.

```bash
# Analyze the standard color logo
./scripts/analyze_logo.sh ../logos/SVG/logo-color.svg

# Analyze a logo and save output to a specific file
./scripts/analyze_logo.sh --output analyzed.svg ../logos/SVG/logo-color.svg
```

### Utility Scripts

#### svg_to_png.sh

Converts SVG files to PNG format with specified DPI.

```bash
# Convert all SVGs in a directory with default 300 DPI
./scripts/svg_to_png.sh 300 ../logos/SVG ../logos/PNG

# Convert with custom DPI
./scripts/svg_to_png.sh 600 ../logos/SVG ../logos/PNG
```

#### svg_to_pdf.sh

Converts SVG files to PDF format.

```bash
# Convert all SVGs in a directory
./scripts/svg_to_pdf.sh ../logos/SVG ../logos/PDF
```

#### recolor_svg.py

Python script for analyzing and recoloring SVG files based on group IDs.

```bash
# Analyze an SVG file
./scripts/recolor_svg.py --analyze input.svg output.svg

# Recolor an SVG file based on group IDs
./scripts/recolor_svg.py input.svg output.svg --color-map "water:#0000FF,sun:#FFFF00"
```

#### clean_svg_paths.py

Cleans SVG files by removing unnecessary attributes from path nodes.

```bash
# Clean an SVG file
./scripts/clean_svg_paths.py input.svg output.svg
```

#### add_copyright_to_svg.py

Adds copyright information to SVG files.

```bash
# Add copyright to an SVG file
./scripts/add_copyright_to_svg.py input.svg output.svg "Copyright © 2025 Sligh Games"
```

## Requirements

- Inkscape (for SVG to PNG and SVG to PDF conversion)
- Python 3 (for Python scripts)

## License

Copyright © 2025 Frederic Nowak. All Rights Reserved.  

Copyright © 2025 Sligh Games. All Rights Reserved.

All logo assets are jointly owned by Frederic Nowak and Sligh Games.

For licensing inquiries: frederic.nowak@sligh.games

For detailed licensing information, please see the [LICENSE](./LICENSE) and [COPYRIGHT](./COPYRIGHT.txt) files.
