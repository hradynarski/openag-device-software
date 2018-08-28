#!/bin/bash

# This script copies all the files we will install in our debian package.

# Save the path to THIS script (before we go changing dirs)
TOPDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# The top of our source tree is the parent of this scripts dir
TOPDIR+=/..

if [ $# -lt 1 ]; then
    echo "Error: missing mandatory command line arg."
    echo "Usage: <destination path to copy files to>"
    echo "Example: test_dir"
    exit 1
fi

DEST=$1
echo "Destination dir: $DEST"
mkdir -p $DEST

# Remove all __pycache__ dirs from current source dir:
echo "Cleaning up __pycache__ dirs..."
sudo sh -c 'find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf'

echo "Copying files..."
# Copy the app source dirs:
cp -R app/ \
  config/ \
  connect/ \
  data/ \
  device/ \
  docs/ \
  iot/ \
  registration/ \
  resource/ \
  scripts/ \
  tests/ \
  venv/ \
  $DEST

# Copy some individual files that are in the top level dir:
cp __init__.py \
  install.sh \
  LICENSE \
  manage.py \
  README.md \
  requirements.txt \
  run.sh \
  setup_python.sh \
  simulate.sh \
  upgrade.sh \
  $DEST

# Make some empty directories we will use:
mkdir -p $DEST/images
mkdir -p $DEST/logs/peripherals

# Clean up any files that might be in a working / configured install that we 
# don't want in the package:
cd $DEST
rm -fr config/device.txt \
  registration/data

# Provide a default device config (should be an EDU?)
echo "unspecified" > config/device.txt




