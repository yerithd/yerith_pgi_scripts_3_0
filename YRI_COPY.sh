#!/bin/bash

#set -x

USAGE="Usage: $(basename $0) [<-d destination_folder>"

if [ $# -lt 2 ]; then
  echo "$USAGE"
  exit 1
fi


BASE_NAME="$(basename $0)"

PREFIX_BASE_DIR="${0%%/${BASE_NAME}}"

DEST_DIR=
ALL_PACKAGES="${PREFIX_BASE_DIR}/YRI.REPOSITORIES.TXT"

destinationFolderFlag=


while getopts 'd:' OPTION
do
  case $OPTION in
    d)	destinationFolderFlag=1
      	DEST_DIR="$OPTARG"
				mkdir -p ${DEST_DIR}
	;;
    ?)	printf "$USAGE" >&2
        exit 2
	;;
  esac
done
shift $(($OPTIND - 1))


if [ ! $destinationFolderFlag ]; then
  echo "$USAGE"
  exit 1
else
  echo "destination folder of the .tar.gz files: ${DEST_DIR}"
fi


while read LINE; do
  TARGET_FILE="${LINE}.tar.gz"
	if [ -d "${LINE}" ]; then
		tar czvf "${TARGET_FILE}" "${LINE}"
		mv "${TARGET_FILE}" "${DEST_DIR}"
	fi
done < "${ALL_PACKAGES}"


