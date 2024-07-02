#!/bin/bash

# Set default values
USER=$ID -u -n
HOMEFOLDER="/home/${USER}"
SOURCE=$PWD
DEST="/tmp/backups"

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
        source=${HOMEFOLDER}${source:1}
    fi
    if [ ! -d "$source" ]; then
        echo "This folder does not exist"
        exit 1
    fi
fi

# Add trailing slash to source directory
source+="/*"

# Get destination directory
echo "Enter the destination directory (default: /tmp/backups):"
read -p "==> " dest
echo

if [ -z $dest ]; then
    dest=$DEST
fi

if [ ! -d $dest ]; then
    mkdir -p $dest
fi

# Create backup directory
dest="${dest}/${backup}"
if [ -d "$dest" ]; then
    echo "A backup with this name already exists."
    exit 1
fi

mkdir $dest
echo "Creating backup..."
cp -r $source $dest