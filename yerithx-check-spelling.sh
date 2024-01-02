#!/bin/bash
# @author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU
# Script to check the spelling of a text written in file
# passed as first argument, to, this, bash-shell script.
# Usage: ./thisScript [<-e> | <-f>]

USAGE="Usage: $(basename $0) [-s] [<-e file_written_in_english>  | <-f fichier_redige_francais >]"

if [ $# -lt 2 ]; then
  echo "$USAGE"
  exit 1
fi

CHECKING_PROGRAM="aspell"

simulationFlag=
francaisFlag=
englishFlag=

while getopts 'e:f:s' OPTION
do
  case $OPTION in
    s)	simulationFlag=1
	;;
    f)	francaisFlag=1
      	CURRENT_TEXT="$OPTARG"
	;;
    e)	englishFlag=1
      	CURRENT_TEXT="$OPTARG"
	;;
    ?)	printf "$USAGE" >&2
        exit 2
	;;
  esac
done
shift $(($OPTIND - 1))


if [ $simulationFlag ]; then
	if [ $francaisFlag ]; then
		echo "${CHECKING_PROGRAM} --lang=fr_FR -c "${CURRENT_TEXT}""
	elif [ $englishFlag ]; then
		echo "${CHECKING_PROGRAM} --lang=en_US -c "${CURRENT_TEXT}""
	fi
elif [ ! $simulationFlag ]; then
	if [ $francaisFlag ]; then
		exec ${CHECKING_PROGRAM} --lang=fr_FR -c "${CURRENT_TEXT}"
	elif [ $englishFlag ]; then
		exec ${CHECKING_PROGRAM} --lang=en_US -c "${CURRENT_TEXT}"
	fi
fi

