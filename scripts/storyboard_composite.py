#!/usr/bin/env python3
"""
Storyboard Composite Generator
Composites N portrait images into a single labeled storyboard grid.

Usage:
    python storyboard_composite.py <image1> <image2> ... [--title "TITLE"] [--subs "SUB1,SUB2,..."] [--output path.png]
    python storyboard_composite.py --batch-dir /path/to/images/ [--title "TITLE"]

Defaults:
    - Layout: 5 rows × 2 cols (for 10 images), auto-adjusts for other counts
    - Cell size: 480×720 (portrait)
    - Background: #0C0C0F
    - Output: ./storyboard-composite.png

Requirements: PIL/Pillow (pip install Pillow)
"""

import sys
import os
import argparse
from PIL import Image, ImageDraw, ImageFont

def find_font(size, bold=False):
    """Try common font paths across platforms."""
    paths = [
        "/usr/share/fonts/truetype/dejavu/DejaVuSans-{}.ttf",
        "/usr/share/fonts/truetype/liberation/LiberationSans-{}.ttf",
        "/Library/Fonts/Arial {}.ttf",
        "C:\\Windows\\Fonts\\arial{}.ttf",
    ]
    style = "Bold" if bold else "Regular"
    for tmpl in paths:
        p = tmpl.format(style)
        if os.path.exists(p):
            return ImageFont.truetype(p, size)
    # macOS variant
    for p in ["/System/Library/Fonts/Helvetica.ttc", "/System/Library/Fonts/Supplemental/Arial Bold.ttf"]:
        if os.path.exists(p):
            return ImageFont.truetype(p, size)
    return ImageFont.load_default()

def composite_images(image_paths, titles=None, subtitles=None, title="STORYBOARD", subtitle="", output_path="storyboard-composite.png"):
    n = len(image_paths)
    if n == 0:
        print("ERROR: No images provided")
        return

    # Auto-layout: 2 columns for ≤10, 3 columns for >10
    COLS = 2 if n <= 10 else 3
    ROWS = (n + COLS - 1) // COLS

    CELL_W, CELL_H = 480, 720
    LABEL_H = 55
    GAP = 12
    MARGIN = 30
    TITLE_H = 70 if title else 0

    W = MARGIN * 2 + COLS * CELL_W + (COLS - 1) * GAP
    H = MARGIN * 2 + TITLE_H + ROWS * (CELL_H + LABEL_H) + (ROWS - 1) * GAP

    canvas = Image.new("RGB", (W, H), (12, 12, 15))
    draw = ImageDraw.Draw(canvas)

    font_title = find_font(28, bold=True)
    font_label = find_font(16, bold=True)
    font_sub = find_font(13, bold=False)

    # Title bar
    if title:
        draw.text((MARGIN, MARGIN + 10), title, fill=(230, 230, 235), font=font_title)
        if subtitle:
            draw.text((MARGIN, MARGIN + 42), subtitle, fill=(140, 140, 150), font=font_sub)

    if titles is None:
        titles = [os.path.splitext(os.path.basename(p))[0] for p in image_paths]
    if subtitles is None:
        subtitles = [""] * n

    for idx, path in enumerate(image_paths):
        row = idx // COLS
        col = idx % COLS
        x = MARGIN + col * (CELL_W + GAP)
        y = MARGIN + TITLE_H + row * (CELL_H + LABEL_H + GAP)

        try:
            img = Image.open(path).convert("RGB")
            img = img.resize((CELL_W, CELL_H), Image.LANCZOS)
            canvas.paste(img, (x, y))
        except Exception as e:
            draw.rectangle([x, y, x + CELL_W, y + CELL_H], fill=(30, 30, 35))
            draw.text((x + 10, y + 10), f"[ERROR: {e}]", fill=(200, 100, 100), font=font_sub)

        label_y = y + CELL_H + 5
        draw.text((x + 5, label_y), titles[idx], fill=(220, 220, 225), font=font_label)
        if subtitles[idx]:
            draw.text((x + 5, label_y + 22), subtitles[idx], fill=(130, 130, 140), font=font_sub)

    canvas.save(output_path, "PNG", quality=95)
    fsize = os.path.getsize(output_path) / 1024
    print(f"DONE: {output_path}")
    print(f"Size: {canvas.size[0]}x{canvas.size[1]}, {fsize:.0f}KB")
    return output_path


def main():
    parser = argparse.ArgumentParser(description="Composite N images into a storyboard grid")
    parser.add_argument("images", nargs="*", help="Image file paths")
    parser.add_argument("--batch-dir", help="Directory of images (sorted by name)")
    parser.add_argument("--title", default="STORYBOARD", help="Title text")
    parser.add_argument("--subtitle", default="", help="Subtitle text")
    parser.add_argument("--titles", help="Comma-separated labels for each image")
    parser.add_argument("--subs", help="Comma-separated sub-labels for each image")
    parser.add_argument("--output", default="storyboard-composite.png", help="Output path")
    args = parser.parse_args()

    if args.batch_dir:
        exts = {".png", ".jpg", ".jpeg", ".webp"}
        images = sorted([
            os.path.join(args.batch_dir, f)
            for f in os.listdir(args.batch_dir)
            if os.path.splitext(f)[1].lower() in exts
        ])
    else:
        images = args.images

    if not images:
        parser.error("No images provided. Pass file paths or --batch-dir")

    titles = args.titles.split(",") if args.titles else None
    subs = args.subs.split(",") if args.subs else None

    composite_images(images, titles=titles, subtitles=subs, title=args.title, subtitle=args.subtitle, output_path=args.output)


if __name__ == "__main__":
    main()
