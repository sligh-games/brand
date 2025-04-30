#!/bin/bash
# Build script to generate all seasonal logo variants in SVG, PNG, and PDF formats
# Copyright © 2025 Frederic Nowak. All Rights Reserved.
# Copyright © 2025 Sligh Games. All Rights Reserved.

# Set script to exit on error
set -e

# Define colors for terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Sligh Games Logo Asset Builder ===${NC}"
echo -e "${BLUE}=== Copyright © 2025 Frederic Nowak and Sligh Games ===${NC}\n"

# Check if scripts directory exists
if [ ! -d "./scripts" ]; then
    echo -e "${YELLOW}Error: Scripts directory not found${NC}"
    exit 1
fi

# Step 1: Generate seasonal SVG variants
echo -e "\n${GREEN}Step 1: Generating seasonal SVG variants...${NC}"
cd scripts
./seasonal_colors.sh
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}Error: Failed to generate seasonal SVG variants${NC}"
    cd ..
    exit 1
fi
cd ..

# Step 2: Add copyright notices to all SVG files
echo -e "\n${GREEN}Step 2: Adding copyright notices to SVG files...${NC}"
cd scripts
./add_copyright_to_svg.py ../logos/SVG
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}Error: Failed to add copyright notices to SVG files${NC}"
    cd ..
    exit 1
fi
cd ..

# Step 3: Create PNG directory structure if it doesn't exist
echo -e "\n${GREEN}Step 3: Setting up PNG directory structure...${NC}"
mkdir -p ./logos/PNG/seasonal

# Step 4: Generate PNG files from seasonal SVG files
echo -e "\n${GREEN}Step 4: Generating PNG files from seasonal SVG variants...${NC}"
cd scripts
./svg_to_png.sh 300 ../logos/SVG/seasonal ../logos/PNG/seasonal
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}Error: Failed to generate PNG files${NC}"
    cd ..
    exit 1
fi
cd ..

# Step 5: Create PDF directory structure if it doesn't exist
echo -e "\n${GREEN}Step 5: Setting up PDF directory structure...${NC}"
mkdir -p ./logos/PDF/seasonal

# Step 6: Generate PDF files from seasonal SVG files
echo -e "\n${GREEN}Step 6: Generating PDF files from seasonal SVG variants...${NC}"
cd scripts
./svg_to_pdf.sh ../logos/SVG/seasonal ../logos/PDF/seasonal
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}Error: Failed to generate PDF files${NC}"
    cd ..
    exit 1
fi
cd ..

# Step 7: Generate standard variants if they don't exist
echo -e "\n${GREEN}Step 7: Checking for standard variants...${NC}"

# Check if standard PNG files exist, if not generate them
if [ ! -f "./logos/PNG/logo-color.png" ]; then
    echo "Generating standard PNG variants..."
    cd scripts
    ./svg_to_png.sh 300 ../logos/SVG ../logos/PNG
    cd ..
fi

# Check if standard PDF files exist, if not generate them
if [ ! -f "./logos/PDF/logo-color.pdf" ]; then
    echo "Generating standard PDF variants..."
    cd scripts
    ./svg_to_pdf.sh ../logos/SVG ../logos/PDF
    cd ..
fi

# Step 8: Summary
echo -e "\n${GREEN}=== Build Complete ===${NC}"
echo -e "The following assets have been generated:"
echo -e "  - Seasonal SVG variants in ${BLUE}./logos/SVG/seasonal/${NC} (with copyright notices)"
echo -e "  - Seasonal PNG variants in ${BLUE}./logos/PNG/seasonal/${NC}"
echo -e "  - Seasonal PDF variants in ${BLUE}./logos/PDF/seasonal/${NC}"
echo -e "\nAll logo assets are now ready for use."
