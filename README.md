# Sligh Games Logo Assets

This repository contains the official logo assets for Sligh Games in various formats and styles.

## Directory Structure

- **public/** - Main directory containing all public-facing assets
  - **public/logos/** - Logo assets in various formats
    - **public/logos/SVG/** - Vector source files in SVG format
    - **public/logos/PNG/** - Raster exports in PNG format (300 DPI)
    - **public/logos/PDF/** - Vector exports in PDF format
  - **public/styles/** - Stylesheets for brand consistency
    - **public/styles/css/** - Compiled CSS files
    - **public/styles/scss/** - SCSS source files
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

## Stylesheet Usage

The repository includes CSS and SCSS stylesheets for consistent brand implementation.

### CSS Variables

The stylesheet provides CSS variables that can be used to maintain consistent branding:

```css
/* Colors */
var(--sligh-water)         /* Deep Blue: #2f5c7e */
var(--sligh-sun)           /* Yellow: #ffe66d */
var(--sligh-leaves-normal) /* Green: #436e4f */
var(--sligh-leaves-light)  /* Light Green: #689f7c */
var(--sligh-leaves-dark)   /* Dark Green: #2a443a */
var(--sligh-trunk)         /* Brown: #8b6f5a */
var(--sligh-roots-normal)  /* Light Brown: #a39b94 */
var(--sligh-roots-light)   /* Very Light Brown: #d5cec8 */
var(--sligh-roots-dark)    /* Dark Brown: #7d756f */

/* Semantic Colors */
var(--sligh-primary)        /* Primary brand color */
var(--sligh-secondary)      /* Secondary brand color */
var(--sligh-tertiary)       /* Tertiary brand color */
var(--sligh-accent)         /* Accent color */
var(--sligh-text-primary)   /* Primary text color */
var(--sligh-background-light) /* Light background color */
var(--sligh-background-dark)  /* Dark background color */

/* Spacing */
var(--spacing-xs)  /* 0.25rem (4px) */
var(--spacing-sm)  /* 0.5rem (8px) */
var(--spacing-md)  /* 1rem (16px) */
var(--spacing-lg)  /* 1.5rem (24px) */
var(--spacing-xl)  /* 2rem (32px) */
var(--spacing-xxl) /* 3rem (48px) */
```

### Utility Classes

The stylesheet provides utility classes for common styling needs:

#### Background Colors

```html
<div class="sligh-bg-water">Deep Blue Background</div>
<div class="sligh-bg-sun">Yellow Background</div>
<div class="sligh-bg-leaves">Green Background</div>
<div class="sligh-bg-leaves-light">Light Green Background</div>
<div class="sligh-bg-leaves-dark">Dark Green Background</div>
<div class="sligh-bg-trunk">Brown Background</div>
<div class="sligh-bg-roots">Light Brown Background</div>
<div class="sligh-bg-roots-light">Very Light Brown Background</div>
<div class="sligh-bg-roots-dark">Dark Brown Background</div>
```

#### Text Colors

```html
<p class="sligh-text-water">Deep Blue Text</p>
<p class="sligh-text-sun">Yellow Text</p>
<p class="sligh-text-leaves">Green Text</p>
<p class="sligh-text-leaves-light">Light Green Text</p>
<p class="sligh-text-leaves-dark">Dark Green Text</p>
<p class="sligh-text-trunk">Brown Text</p>
<p class="sligh-text-roots">Light Brown Text</p>
<p class="sligh-text-roots-light">Very Light Brown Text</p>
<p class="sligh-text-roots-dark">Dark Brown Text</p>
```

#### Components

```html
<!-- Buttons -->
<button class="sligh-button">Primary Button</button>
<button class="sligh-button sligh-button-secondary">Secondary Button</button>
<button class="sligh-button sligh-button-tertiary">Tertiary Button</button>
<button class="sligh-button sligh-button-accent">Accent Button</button>

<!-- Cards -->
<div class="sligh-card">
  <div class="sligh-card-header">
    <h3>Card Title</h3>
  </div>
  <div class="sligh-card-body">
    <p>Card content goes here.</p>
  </div>
  <div class="sligh-card-footer">
    <button class="sligh-button">Action</button>
  </div>
</div>

<!-- Grid System -->
<div class="sligh-grid">
  <div>Grid Item 1</div>
  <div>Grid Item 2</div>
  <div>Grid Item 3</div>
  <div>Grid Item 4</div>
</div>

<!-- Logo Display -->
<div class="sligh-logo-display">
  <img src="./logos/PNG/sligh-games-logo-color.png" alt="Sligh Games Logo">
</div>
```

#### Spacing Utilities

```html
<!-- Margins -->
<div class="sligh-m-md">Margin all sides</div>
<div class="sligh-mt-md">Margin top</div>
<div class="sligh-mr-md">Margin right</div>
<div class="sligh-mb-md">Margin bottom</div>
<div class="sligh-ml-md">Margin left</div>
<div class="sligh-mx-md">Margin horizontal</div>
<div class="sligh-my-md">Margin vertical</div>

<!-- Padding -->
<div class="sligh-p-md">Padding all sides</div>
<div class="sligh-pt-md">Padding top</div>
<div class="sligh-pr-md">Padding right</div>
<div class="sligh-pb-md">Padding bottom</div>
<div class="sligh-pl-md">Padding left</div>
<div class="sligh-px-md">Padding horizontal</div>
<div class="sligh-py-md">Padding vertical</div>
```

### Compiling SCSS

To compile the SCSS file to CSS, you can use a SASS compiler:

```bash
# Using npm
npm install -g sass
sass public/styles/scss/sligh-games.scss public/styles/css/sligh-games.css

# Using Dart Sass
sass public/styles/scss/sligh-games.scss public/styles/css/sligh-games.css
```

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
./scripts/analyze_logo.sh ../public/logos/SVG/sligh-games-logo-color.svg

# Analyze a logo and save output to a specific file
./scripts/analyze_logo.sh --output analyzed.svg ../public/logos/SVG/sligh-games-logo-color.svg
```

### Utility Scripts

#### svg_to_png.sh

Converts SVG files to PNG format with specified DPI.

```bash
# Convert all SVGs in a directory with default 300 DPI
./scripts/svg_to_png.sh 300 ../public/logos/SVG ../public/logos/PNG

# Convert with custom DPI
./scripts/svg_to_png.sh 600 ../public/logos/SVG ../public/logos/PNG
```

#### svg_to_pdf.sh

Converts SVG files to PDF format.

```bash
# Convert all SVGs in a directory
./scripts/svg_to_pdf.sh ../public/logos/SVG ../public/logos/PDF
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
- Sass (for SCSS compilation)

## License

Copyright © 2025 Frederic Nowak. All Rights Reserved.  

Copyright © 2025 Sligh Games. All Rights Reserved.

All logo assets are jointly owned by Frederic Nowak and Sligh Games.

For licensing inquiries: legal@sligh.games

For detailed licensing information, please see the [LICENSE](./LICENSE) and [COPYRIGHT](./COPYRIGHT.txt) files.
