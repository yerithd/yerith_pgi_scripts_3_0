#!/bin/bash
#@author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU

CURRENT_EXECUTING_SCRIPT_FULL_PATH=$(dirname "$1")

CURRENT_EXECUTING_SCRIPT_FULL_PATH=$(cd "${CURRENT_EXECUTING_SCRIPT_FULL_PATH}" && pwd)

if [ -z "${CURRENT_EXECUTING_SCRIPT_FULL_PATH}" ]; then
  echo "$CURRENT_EXECUTING_SCRIPT_FULL_PATH is for some reasons not accessible!"
  exit 1
fi

echo "${CURRENT_EXECUTING_SCRIPT_FULL_PATH}"
