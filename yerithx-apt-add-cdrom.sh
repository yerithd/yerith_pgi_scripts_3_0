#!/bin/bash
#
# @author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU
#
ISO_FILE_PATH="$1"

mount -o loop -t iso9660 "${ISO_FILE_PATH}" /media/cdrom && \
  apt-cdrom -m add

