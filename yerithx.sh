#!/bin/bash

ALL_PACKAGES="$1"

while read LINE; do
    yerithx-replace-string-all-files.sh -o "yerithERPWindows->${LINE}" -n "YerothDatabase::${LINE}" -d src
    yerithx-replace-string-all-files.sh -o "YERITH_TABLE_VIEW_ALL_WINDOWS_POINTER->${LINE}" -n "YerothDatabase::${LINE}" -d src
    yerithx-replace-string-all-files.sh -o "YerothUtils::getAllWindows()->${LINE}" -n "YerothDatabase::${LINE}" -d src
    yerithx-replace-string-all-files.sh -o "_allWindows->${LINE}" -n "YerothDatabase::${LINE}" -d src
    yerithx-replace-string-all-files.sh -o "YerothERPWindows::${LINE}" -n "YerothDatabase::${LINE}" -d src
done < "$ALL_PACKAGES"
