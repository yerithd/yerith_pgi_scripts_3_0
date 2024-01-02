#!/bin/bash
# @author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU
# Usage: ./thisScript [-s] [<-l> | <-u>] <file_name>

USAGE="Usage: $(basename $0) [-s] [<-l file_to_lower_case>  | <-u file_to_upper_case>]"

if [ $# -lt 2 ]; then
  echo "$USAGE"
  exit 1
fi

TR_PROGRAM="tr"

simulationFlag=
lowerFlag=
upperFlag=

while getopts 'l:u:s' OPTION
do
  case $OPTION in
    s)	simulationFlag=1
	;;
    l)	lowerFlag=1
			  CURRENT_TEXT="$(cat $OPTARG)"
	;;
    u)	upperFlag=1
			  CURRENT_TEXT="$(cat $OPTARG)"
	;;
    ?)	printf "$USAGE" >&2
        exit 2
	;;
  esac
done
shift $(($OPTIND - 1))


if [ $simulationFlag ]; then
	if [ $lowerFlag ]; then
		echo "${TR_PROGRAM} [:upper:] [:lower:] "${CURRENT_TEXT}""
	elif [ $upperFlag ]; then
		echo "${TR_PROGRAM} [:lower:] [:upper:] "${CURRENT_TEXT}""
	fi
elif [ ! $simulationFlag ]; then
	if [ $lowerFlag ]; then
		echo "${CURRENT_TEXT}" | ${TR_PROGRAM} [:upper:] [:lower:] 
	elif [ $upperFlag ]; then
		echo "${CURRENT_TEXT}" | ${TR_PROGRAM} [:lower:] [:upper:]
	fi
fi

