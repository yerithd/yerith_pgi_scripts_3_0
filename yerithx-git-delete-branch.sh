#!/bin/sh
#@author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU

A_BRANCH_TO_DELETE="$1"

git branch -D "${A_BRANCH_TO_DELETE}"

git push origin --delete "${A_BRANCH_TO_DELETE}"
