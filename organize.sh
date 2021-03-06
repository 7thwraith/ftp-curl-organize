#!/bin/bash

echo "Logging into FTP with curl"

## Log into FTP with curl, then find all files with the .mkv extension, and then dump the rsilt into text file called file-list.txt
curl -l  ftp://$FTP_SERVER/$FTP_SUBDIR/ --user  $FTP_USER:$FTP_PASSWORD | grep -oP '.*\.mkv' > file-list.txt


while read filename
do

## Parse the file called file-list.txt, then use regex to extract the series names, then dump the reuslt into a file called series.txt
title=$( echo "$filename" | grep -oP '(?<=] ).*' | grep -oP '.* - ' | grep -oP '.*(?= - )'           )
echo "$title" >> series.txt

## Create folders named after series
echo "attempting to create folder named $title"
curl -l  ftp://$FTP_SERVER/$FTP_SUBDIR/ --user  $FTP_USER:$FTP_PASSWORD -Q "MKD /$FTP_SUBDIR/$title" --ftp-create-dirs

## Move files into their respective series folders
echo "moving files from Series folders to $title"
curl -l  ftp://$FTP_SERVER/$FTP_SUBDIR/ --user  $FTP_USER:$FTP_PASSWORD -Q "-RNFR /$FTP_SUBDIR/$filename" -Q "-RNTO /$FTP_SUBDIR/$title/$filename" --ftp-create-dirs


done < file-list.txt