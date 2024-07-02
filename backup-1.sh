#!/bin/bash

if [ ! -d /tmp/backups ] ; 
then
    echo Creating an backups folder in /tmp
    mkdir /tmp/backups
else
    echo Backups folder already there
fi
echo Creating backup
if [ -z $1 ]
then
    echo You need to give a parameter
    exit 0
fi
if [ ! -d /tmp/backups/$1 ] ;
then
    mkdir /tmp/backups/$1
    cp -r ~/* /tmp/backups/$1
else
    echo A backup with this name already exists, 
    exit 0
fi

exit 0