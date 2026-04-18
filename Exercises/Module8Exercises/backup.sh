#!/bin/bash
# Backup files within a project directory

mkdir $1_$2
cp -R $1 $1_$2
echo Backup of $1 is now complete.
