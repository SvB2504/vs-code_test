#!/bin/bash

#name of the backup
echo Name of Backup
read -p "==> " backup
echo
if [ -z  $backup ] ;
then 
    echo you need to give a name.
    exit 0
fi

#source
echo Which directory should be backupped?
echo If none is given your current directory is chosen.
read -p "==> "  source
if [ -z  $source ] ;
then 
    source=$PWD
fi
if [ ! -d $source ] ;
then 
    echo This folder does not exist
    exit 0
fi
echo $source
echo
source+="/*"
#destination
echo Which directory should i backup to?
echo If none is given, it will backup to "/tmp/backups".
read -p "==> " dest
if [ -z $dest ] ;
then
    dest=$"/tmp/backups"
fi
if [ ! -d $dest ] ;
then
    mkdir $dest
fi
dest="${dest}/${backup}"
echo $dest
echo
if [ ! -d $dest ] ;
then
    mkdir $dest
    echo Creating backup
    cp -r $source $dest
else
    echo A backup with this name already exists, 
    exit 0
fi