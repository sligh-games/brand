#!/usr/bin/env python3
"""
Script to remove 'id' and 'style' attributes from path nodes in SVG files.
Copyright © 2025 Frederic Nowak. All Rights Reserved.
Copyright © 2025 Sligh Games. All Rights Reserved.
"""

import os
import re
import glob
from xml.etree import ElementTree as ET

# Register the SVG namespace
ET.register_namespace("", "http://www.w3.org/2000/svg")

def clean_svg_file(file_path):
    """Remove id and style attributes from path nodes in an SVG file."""
    try:
        # Parse the SVG file
        tree = ET.parse(file_path)
        root = tree.getroot()
        
        # Find all path elements
        svg_namespace = {"svg": "http://www.w3.org/2000/svg"}
        paths = root.findall(".//svg:path", svg_namespace)
        
        changes_made = False
        for path in paths:
            # Remove id attribute if it exists
            if 'id' in path.attrib:
                del path.attrib['id']
                changes_made = True
            
            # Remove style attribute if it exists
            if 'style' in path.attrib:
                del path.attrib['style']
                changes_made = True
        
        if changes_made:
            # Write the modified SVG back to the file
            tree.write(file_path, encoding='utf-8', xml_declaration=True)
            print(f"Cleaned {file_path}")
        else:
            print(f"No changes needed for {file_path}")
            
    except Exception as e:
        print(f"Error processing {file_path}: {e}")

def main():
    """Find all SVG files in the current directory and clean them."""
    svg_files = glob.glob("*.svg")
    
    if not svg_files:
        print("No SVG files found in the current directory.")
        return
    
    print(f"Found {len(svg_files)} SVG files.")
    
    for svg_file in svg_files:
        clean_svg_file(svg_file)
    
    print("Processing complete.")

if __name__ == "__main__":
    main()
