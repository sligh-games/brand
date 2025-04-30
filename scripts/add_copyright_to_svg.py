#!/usr/bin/env python3
"""
Script to add copyright information to SVG files.
Copyright © 2025 Frederic Nowak. All Rights Reserved.
Copyright © 2025 Sligh Games. All Rights Reserved.
"""

import os
import sys
import re
from xml.etree import ElementTree as ET
import xml.dom.minidom as minidom

def add_copyright_to_svg(svg_file):
    """Add copyright comment to an SVG file."""
    
    # Read the SVG file content
    with open(svg_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Check if copyright is already present
    if "Copyright © 2025 Frederic Nowak" in content:
        print(f"Copyright already exists in {svg_file}")
        return False
    
    # Copyright text
    copyright_text = """<!--
Copyright © 2025 Frederic Nowak. All Rights Reserved.
Copyright © 2025 Sligh Games. All Rights Reserved.
-->"""
    
    # Insert copyright after XML declaration
    if content.startswith('<?xml'):
        xml_end = content.find('?>') + 2
        new_content = content[:xml_end] + '\n' + copyright_text + content[xml_end:]
    else:
        new_content = copyright_text + '\n' + content
    
    # Write the modified content back to the file
    with open(svg_file, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"Added copyright to {svg_file}")
    return True

def process_directory(directory):
    """Process all SVG files in a directory and its subdirectories."""
    modified_count = 0
    
    for root, _, files in os.walk(directory):
        for file in files:
            if file.lower().endswith('.svg'):
                svg_file = os.path.join(root, file)
                if add_copyright_to_svg(svg_file):
                    modified_count += 1
    
    return modified_count

def main():
    """Main function."""
    if len(sys.argv) < 2:
        print("Usage: python add_copyright_to_svg.py <svg_directory>")
        return 1
    
    directory = sys.argv[1]
    if not os.path.isdir(directory):
        print(f"Error: {directory} is not a valid directory")
        return 1
    
    modified_count = process_directory(directory)
    print(f"Added copyright to {modified_count} SVG files")
    
    return 0

if __name__ == "__main__":
    sys.exit(main())
