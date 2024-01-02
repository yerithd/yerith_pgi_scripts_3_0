#!/bin/bash
# @author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU


set -x

echo "$0 | compilation des Makefile dans les repertoires suivant: "${@}""

CUR_DIR="$(pwd)"

for f in "${@}"; do
		if [ -d "$f" ]; then
				echo "$0 | compilation actuelle | "$(readlink -f $f/Makefile)""
				cd "$f" && yri_compile_j8.sh > /dev/null 2> /dev/null && cd ${CUR_DIR}
		fi
done
