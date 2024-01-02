#!/bin/bash
# Name of the script: yerithx-rename-ALL-files.sh
#
# @author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU
#
# This script works only in conjunction with the script 'yerithx-filter-cpp-files.awk'

USAGE="Usage: $(basename $0) [-rs] <-o OLD> <-n NEW> <-d FOLDER>"

if [ $# -lt 4 ]; then
  echo "$USAGE"
  exit 1
fi

nflag=
oflag=
dflag=
simflag=

RECURSIVE_OPTION=""

while getopts 'o:n:d:s' OPTION
do
  case $OPTION in
    n)	nflag=1
      	NEW_STRING="$OPTARG"
        #echo new string: ${nval} 
	;;
    o)	oflag=1
      	OLD_STRING="$OPTARG"
        #echo old string: ${oval} 
	;;
    d)	dflag=1
      	FOLDER="$OPTARG"
        #echo folder: ${oval} 
	;;
    s)	simflag=1
        echo "Simulation on"
        ;;
    ?)	printf "$USAGE" >&2
        exit 2
	;;
  esac
done
shift $(($OPTIND - 1))

if [ "" = "$OLD_STRING" ]; then
  echo "You must give a string to search and replace! aborting!"
  exit 1
#else
  #echo "$0 | grep to search for string: "$OLD_STRING""
fi

if [ "" = "$NEW_STRING" ]; then
  echo "You must give a string to replace the string to search! aborting!"
  exit 1
#else
  #echo "$0 | grep to search for string: "$OLD_STRING""
fi

if [ "" = "$FOLDER" ]; then
  #echo "folder to search with grep is empty!"
  FOLDER="$PWD"
fi

echo "$0 | grep to search in folder: "$FOLDER""

MYFILE=".allFiles.bak"

FULL_PATH_DIR_AUXILIARY_SCRIPTS=$(bash yerithx-find-current-bashscript-full-dir-only-path.sh "$0")

if [ $dflag ]; then
    #echo "find . -name 'yerith-erp-3-0-system-daemon*' > "$MYFILE""
    find . -name 'yerith-erp-3-0-system-daemon*' > "$MYFILE"
fi


n=1
while read LINE; do
  echo "Processing file: $LINE"

	CUR_DIR_PATH="$(pwd)"
	DIR_PATH="$(dirname "$LINE")/"
	FILENAME_WITHOUT_DIR_PATH="${LINE##${DIR_PATH}}"

	if [ ! $simflag ]; then 
		cd "${DIR_PATH}"
		"${FULL_PATH_DIR_AUXILIARY_SCRIPTS}"/yerithx-rename-files.sh -o "$OLD_STRING" -n "$NEW_STRING" "${FILENAME_WITHOUT_DIR_PATH}"
		cd "${CUR_DIR_PATH}"
  else
		echo "cd "${DIR_PATH}""
		echo "file ${FILENAME_WITHOUT_DIR_PATH}"
		echo ""${FULL_PATH_DIR_AUXILIARY_SCRIPTS}"/yerithx-rename-files.sh -s -o "$OLD_STRING" -n "$NEW_STRING" "${FILENAME_WITHOUT_DIR_PATH}""
		echo "cd "${CUR_DIR_PATH}""
  fi
  n=$((n+1))
done < "$MYFILE"


