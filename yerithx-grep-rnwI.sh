#!/bin/bash
# @author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU
#
# Script to search a folder and all its
# subfolder recursively with tool 'GREP',
# supplied with standard options:
# 1. 'r': for recursively
# 2. 'n': for giving out a line number of a matched occurence string
# 3. 'w': for matching the exact supplied string (WITH CASE SENSITIVITY)
# 4. 'I': for handling binary files as if they don't exist. 
#
# Usage: ./thisScript <-w word-to-search-for> <-d folder-to-search-within> 
#

USAGE="Usage: $(basename $0) <-w word-to-search-for> <-d folder-to-search-within>"

if [ $# -lt 2 ]; then
  echo "$USAGE"
  exit 1
fi

GREP_COMMAND_FULL_PATH="/bin/grep"

while getopts 'w:d:' OPTION
do
  case $OPTION in
    w)	EXACT_WORD_TO_SEARCH_FOR="$OPTARG"
	;;
    d)  FOLDER_TO_SEARCH_WITHIN="$OPTARG"
	;;
    ?)	printf "$USAGE" >&2
        exit 2
	;;
  esac
done
shift $(($OPTIND - 1))


clear

#echo " ... searching for exact word: ${EXACT_WORD_TO_SEARCH_FOR}"
#echo " ... searching folder: ${FOLDER_TO_SEARCH_WITHIN}"

${GREP_COMMAND_FULL_PATH} -rnwI ${EXACT_WORD_TO_SEARCH_FOR} ${FOLDER_TO_SEARCH_WITHIN}

