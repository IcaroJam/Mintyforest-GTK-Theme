#!/usr/bin/bash

DEST="./Mintyforest-GTK-Theme"

curdir=$(pwd)

echo "Updating Gtk4 assets"
cd "gtk-4.0/"
sassc ./sass/gtk.scss gtk.css
./render-assets.sh
echo "Gtk4 assets updated\n"

cd $curdir

echo "Updating Gtk3 assets"
cd "gtk-3.0/"
sassc ./sass/gtk.scss gtk.css
./render-assets.sh
echo "Gtk3 assets updated\n"

cd $curdir

echo "Updating Gtk2 assets"
cd "gtk-2.0/"
./render-assets.sh
echo "Gtk2 assets updated\n"

cd $curdir

echo "Updating Cinnamon assets"
cd "cinnamon/"
sassc ./sass/cinnamon.scss cinnamon.css
echo "Cinnamon assets updated\n"

cd $curdir

echo "Updating Xfwm4 assets"
cd "xfwm4/"
./render-assets.sh

cd $curdir

mkdir -p DEST
echo "Building Mintyforest..."
# Gtk2
version_folder="${DEST}/gtk-2.0"
mkdir -p $version_folder
cp -R "gtk-2.0/assets" $version_folder
cp "gtk-2.0/"*.rc $version_folder
cp "gtk-2.0/gtkrc" $version_folder
# Gtk3
version_folder="${DEST}/gtk-3.0"
mkdir -p $version_folder
cp -R "gtk-3.0/assets" $version_folder
cp "gtk-3.0/gtk.css" $version_folder
cp "gtk-3.0/thumbnail.png" $version_folder
# Gtk4
version_folder="${DEST}/gtk-4.0"
mkdir -p $version_folder
cp -R "gtk-4.0/assets" $version_folder
cp "gtk-4.0/gtk.css" $version_folder
# Metacity
cp -R metacity-1 "${DEST}/"
# Cinnamon
version_folder="${DEST}/cinnamon"
mkdir -p $version_folder
cp -R "cinnamon/common-assets" $version_folder
cp -R "cinnamon/light-assets" $version_folder
cp "cinnamon/mint-y-thumbnail.png" "${version_folder}/thumbnail.png"
cp "cinnamon/cinnamon.css" $version_folder
# XFWM
version_folder="${DEST}/xfwm4"
mkdir -p $version_folder
cp -R "xfwm4/"*.png $version_folder
cp -R "xfwm4/themerc" $version_folder
