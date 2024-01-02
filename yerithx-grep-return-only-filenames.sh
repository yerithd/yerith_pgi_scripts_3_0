#!/bin/bash
# @author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU
#
# Works only in conjunction with the script 'yerithx-filter-cpp-files.awk'
#

STRING="$1"
FOLDER="$2"

if [ "" = "$STRING" ]; then
  #echo "search string is empty! aborting!"
  exit 1
#else
  #echo "$0 | grep to search for string: "$STRING""
fi

if [ "" = "$FOLDER" ]; then
  #echo "folder to search with grep is empty! aborting!"
  FOLDER="$PWD"
#else
  #echo "$0 | grep to search in folder: "$FOLDER""
fi

grep -r -n $STRING $FOLDER | awk -f $HOME/bin/yerithx-filter-cpp-files.awk | uniq
