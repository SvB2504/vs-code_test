#!/bin/bash

# Set default values
USER=$(whoami)
SOURCE=$PWD
DEST="/tmp/backups"
homefolder="/home/${USER}"
timestamp=$(date +%Y%m%d%H%M%S)

# Get backup name
echo "Enter a name for the backup:"
read -p "==> " backup
echo

if [ -z "$backup" ]; then
    echo "You need to give a name."
    exit 1
fi

# Get source directory
echo "Enter the directory to backup (default: current directory):"
read -p "==> " source
echo

if [ -z "$source" ]; then
    source=$SOURCE
else
    if [ ${source:0:1} = "~" ]
    then
        source=${homefolder}${source:1}
    fi
    if [ ! -d "$source" ]; then
        echo "This folder does not exist"
        exit 1
    fi
fi

# Get destination directory
echo "Enter the destination directory (default: /tmp/backups):"
read -p "==> " dest
echo

if [ -z "$dest" ]; then
    dest=$DEST
fi

if [ ! -d "$dest" ]; then
    mkdir -p $dest
fi

# Create backup filename
backup="${backup}-${timestamp}"

# Moving to source folder
cd $source

# Creating backup
echo "Creating backup..."
tar -czf "$dest/$backup.tar.gz" *