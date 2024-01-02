#!/bin/bash

ISO_ROOT_DIR=/mnt-iso-i386


MNT_ISO_1=/mnt/iso_1
MNT_ISO_2=/mnt/iso_2
MNT_ISO_3=/mnt/iso_3

rmdir ${MNT_ISO_1}
rmdir ${MNT_ISO_2}
rmdir ${MNT_ISO_3}

mkdir -p ${MNT_ISO_1}
mkdir -p ${MNT_ISO_2}
mkdir -p ${MNT_ISO_3}

mount -o loop=/dev/loop5 ${ISO_ROOT_DIR}/debian-10.0.0-i386-DVD-1.iso ${MNT_ISO_1}
mount -o loop=/dev/loop6 ${ISO_ROOT_DIR}/debian-10.0.0-i386-DVD-2.iso ${MNT_ISO_2}
mount -o loop=/dev/loop7 ${ISO_ROOT_DIR}/debian-10.0.0-i386-DVD-3.iso ${MNT_ISO_3}						
