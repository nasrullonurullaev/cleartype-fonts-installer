#!/bin/bash

# Need root
if [[ $EUID -ne 0 ]]; then
    echo "Please run as root (sudo)"
    exit 1
fi

# Base URL for fonts
url="https://lexics.github.io/assets/downloads/fonts/clearTypeFonts/"

# Fonts array
fonts=(
    "calibrib.ttf"
    "calibrii.ttf"
    "calibri.ttf"
    "calibriz.ttf"
    "cambriab.ttf"
    "cambriai.ttf"
    "cambriamath.ttf"
    "cambria.ttf"
    "cambriaz.ttf"
    "candarab.ttf"
    "candarai.ttf"
    "candara.ttf"
    "candaraz.ttf"
    "consolab.ttf"
    "consolai.ttf"
    "consola.ttf"
    "consolaz.ttf"
    "constanb.ttf"
    "constani.ttf"
    "constan.ttf"
    "constanz.ttf"
    "corbelb.ttf"
    "corbeli.ttf"
    "corbel.ttf"
    "corbelz.ttf"
)

# Install directory
install_dir="/usr/share/fonts/truetype/msttcorefonts"

echo "Creating directory: $install_dir"
mkdir -p "$install_dir"

cd "$install_dir"

# Download fonts
for f in "${fonts[@]}"; do
    echo "Downloading $f ..."
    curl -O "${url}${f}"
done

echo "Updating font cache..."
fc-cache -f -v

echo "Installation complete!"
