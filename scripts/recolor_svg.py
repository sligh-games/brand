#!/usr/bin/env python3
"""
Script to recolor SVG files by applying a new color palette based on group IDs.
Copyright © 2025 Frederic Nowak. All Rights Reserved.
Copyright © 2025 Sligh Games. All Rights Reserved.
"""

import os
import sys
import re
import argparse
from xml.etree import ElementTree as ET

# Register the SVG namespace
ET.register_namespace("", "http://www.w3.org/2000/svg")
SVG_NS = {"svg": "http://www.w3.org/2000/svg"}

def parse_color_map(color_map_str):
    """Parse color mapping string into a dictionary."""
    color_map = {}
    pairs = color_map_str.split(',')
    for pair in pairs:
        if ':' in pair:
            group_id, target_color = pair.split(':')
            group_id = group_id.strip()
            target_color = target_color.strip()
            if target_color.startswith('#'):
                color_map[group_id] = target_color.lower()
    return color_map

def analyze_svg_groups(svg_root):
    """Find all group IDs and their colors in the SVG file."""
    groups = {}
    
    # Find all group elements
    for group in svg_root.findall(".//svg:g", SVG_NS):
        if 'id' in group.attrib:
            group_id = group.attrib['id']
            colors = set()
            
            # Check style attribute in the group and its children
            for element in [group] + list(group.findall(".//*")):
                if 'style' in element.attrib:
                    style = element.attrib['style']
                    fill_match = re.search(r'fill:\s*(#[0-9a-fA-F]{6})', style)
                    if fill_match:
                        colors.add(fill_match.group(1).lower())
                    
                    stroke_match = re.search(r'stroke:\s*(#[0-9a-fA-F]{6})', style)
                    if stroke_match:
                        colors.add(stroke_match.group(1).lower())
                
                # Check fill and stroke attributes
                if 'fill' in element.attrib and element.attrib['fill'].startswith('#'):
                    colors.add(element.attrib['fill'].lower())
                
                if 'stroke' in element.attrib and element.attrib['stroke'].startswith('#'):
                    colors.add(element.attrib['stroke'].lower())
            
            if colors:
                groups[group_id] = list(colors)
    
    return groups

def recolor_svg_by_group(input_file, output_file, color_map):
    """Recolor an SVG file using the provided group ID to color map."""
    try:
        # Parse the SVG file
        tree = ET.parse(input_file)
        root = tree.getroot()
        
        # Process each group with an ID that matches our color map
        for group in root.findall(".//svg:g", SVG_NS):
            if 'id' in group.attrib and group.attrib['id'] in color_map:
                group_id = group.attrib['id']
                new_color = color_map[group_id]
                
                # Function to replace colors in style attribute
                def replace_colors_in_style(style):
                    if not style:
                        return style
                    
                    # Replace fill color
                    style = re.sub(
                        r'(fill:\s*)#[0-9a-fA-F]{6}([;\s]|$)', 
                        r'\1' + new_color + r'\2', 
                        style
                    )
                    return style
                
                # Apply new color to the group and all its children
                for element in [group] + list(group.findall(".//*")):
                    # Replace colors in style attribute
                    if 'style' in element.attrib:
                        element.attrib['style'] = replace_colors_in_style(element.attrib['style'])
                    
                    # Replace fill attribute
                    if 'fill' in element.attrib and element.attrib['fill'].startswith('#'):
                        element.attrib['fill'] = new_color
        
        # Write the modified SVG to the output file
        tree.write(output_file, encoding='utf-8', xml_declaration=True)
        return True
    except Exception as e:
        print(f"Error processing {input_file}: {e}")
        return False

def main():
    parser = argparse.ArgumentParser(description='Recolor SVG files based on group IDs.')
    parser.add_argument('input_file', help='Input SVG file')
    parser.add_argument('output_file', help='Output SVG file')
    parser.add_argument('--color-map', '-c', help='Color mapping in format "group_id:#RRGGBB,group_id2:#RRGGBB"')
    parser.add_argument('--analyze', '-a', action='store_true', help='Analyze SVG and list group IDs without recoloring')
    
    args = parser.parse_args()
    
    if not os.path.isfile(args.input_file):
        print(f"Error: Input file '{args.input_file}' does not exist.")
        return 1
    
    # Parse the SVG file
    try:
        tree = ET.parse(args.input_file)
        root = tree.getroot()
    except Exception as e:
        print(f"Error parsing SVG file: {e}")
        return 1
    
    # If analyze mode, just list the group IDs and their colors
    if args.analyze:
        groups = analyze_svg_groups(root)
        if groups:
            print(f"Groups found in {args.input_file}:")
            for group_id, colors in groups.items():
                print(f"  Group ID: {group_id}")
                print(f"    Colors: {', '.join(colors)}")
            
            print("\nExample color map format:")
            color_map_example = ",".join([f"{group_id}:#NEW_COLOR" for group_id in groups.keys()])
            print(f"--color-map \"{color_map_example}\"")
        else:
            print(f"No groups with IDs found in {args.input_file}")
        return 0
    
    # Check if color map is provided
    if not args.color_map:
        print("Error: Color map is required for recoloring. Use --analyze to see group IDs in the SVG.")
        return 1
    
    # Parse color map
    color_map = parse_color_map(args.color_map)
    if not color_map:
        print("Error: Invalid color map format. Use format \"group_id:#RRGGBB,group_id2:#RRGGBB\"")
        return 1
    
    # Recolor the SVG
    success = recolor_svg_by_group(args.input_file, args.output_file, color_map)
    if success:
        print(f"Successfully recolored {args.input_file} and saved as {args.output_file}")
    else:
        print(f"Failed to recolor {args.input_file}")
        return 1
    
    return 0

if __name__ == "__main__":
    sys.exit(main())
