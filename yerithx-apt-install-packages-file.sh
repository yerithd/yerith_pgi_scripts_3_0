#!/bin/bash

ALL_PACKAGES="$1"

while read LINE; do
    apt install --allow-unauthenticated -y "$LINE"
done < "$ALL_PACKAGES"
