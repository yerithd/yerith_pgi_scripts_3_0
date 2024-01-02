#!/bin/bash
# @author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU
# Usage: ./thisScript [-s] 

USAGE="Usage: $(basename $0) [-s]"

indentationFlag=
simulationFlag=

while getopts 'is' OPTION
do
  case $OPTION in
		i)	indentationFlag=1
	;;
		s)	simulationFlag=1
	;;
    ?)	printf "$USAGE" >&2
        exit 2
	;;
  esac
done
shift $(($OPTIND - 1))


ROOT_FOLDER_FULL_PATH="$(pwd)"

FOLDER_BASENAME="$(basename $(pwd))"

ZIP_FOLDER_FILE="${FOLDER_BASENAME}.zip"

ZIP_FILE_FULL_PATH="${HOME}/${ZIP_FOLDER_FILE}"

rm -f "${ZIP_FILE_FULL_PATH}"

if [ $simulationFlag ]; then
	echo "git archive --format=zip -o "${ZIP_FILE_FULL_PATH}" master"
	exit 0
fi

git archive --format=zip -o "${ZIP_FILE_FULL_PATH}" master

if [ ! $? ]; then
	echo "$0 command failed with error code: ($?)"
	exit 2	
fi

cd "${HOME}"

backup_folder="_JH_NISSI_"${FOLDER_BASENAME}""

rm -rf "${backup_folder}" 

mv "${FOLDER_BASENAME}" "${backup_folder}"

unzip -d "${FOLDER_BASENAME}" "${ZIP_FILE_FULL_PATH}"

cd "${FOLDER_BASENAME}"

INDENT="indent"

MYFILE=".allFiles_indent.bak"

find . -name '*.h' > "$MYFILE"
find . -name '*.hpp' >> "$MYFILE"
find . -name '*.hxx' >> "$MYFILE"
find . -name '*.c' >> "$MYFILE"
find . -name '*.cxx' >> "$MYFILE"
find . -name '*.cpp' >> "$MYFILE"

a_prefix="./"

if [ $indentationFlag ]; then
	n=1
	
	while read LINE; do
		LINE_PREFIX=${LINE##${a_prefix}}
		
		echo "${INDENT} "${LINE_PREFIX}""
		
		$("${INDENT}" "${LINE_PREFIX}")
		
		rm -f "${LINE_PREFIX}~"
		
		n=$((n+1))
	done < "$MYFILE"
fi

rm -f ".gitignore"

rm -f "${MYFILE}"

cd "${HOME}"

rm -f "${ZIP_FILE_FULL_PATH}"

zip -r "${ZIP_FILE_FULL_PATH}" "${FOLDER_BASENAME}"

rm -rf "${FOLDER_BASENAME}"

mv "${backup_folder}" "${FOLDER_BASENAME}"

