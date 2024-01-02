#!/bin/bash

# check for root access
if [ $(id -u) -ne 0 ];then
		echo 'run this scripts as root user or use sudo'
		exit 1
fi


ISO_ROOT_DIR=/root


MNT_ISO_1=/mnt/iso_1
MNT_ISO_2=/mnt/iso_2
MNT_ISO_3=/mnt/iso_3


mkdir -p ${MNT_ISO_1}
mkdir -p ${MNT_ISO_2}
mkdir -p ${MNT_ISO_3}


case "$1" in
		mount)
				if  $(mountpoint -q ${MNT_ISO_1});then
						echo 'ISO file already mounted'
				else
						echo 'mounting ISO file 1'
						mount -o loop ${ISO_ROOT_DIR}/debian-10.0.0-amd64-DVD-1.iso ${MNT_ISO_1}/
				fi

				if  $(mountpoint -q ${MNT_ISO_2});then
						echo 'ISO file already mounted'
				else
						echo 'mounting ISO file 2'
						mount -o loop ${ISO_ROOT_DIR}/debian-10.0.0-amd64-DVD-2.iso ${MNT_ISO_2}/
				fi

				if  $(mountpoint -q ${MNT_ISO_3});then
						echo 'ISO file already mounted'
				else
						echo 'mounting ISO file 3'
						mount -o loop ${ISO_ROOT_DIR}/debian-10.0.0-amd64-DVD-3.iso ${MNT_ISO_3}/
				fi
				;;

		umount)

				# unmount ISO images

				if ! $(mountpoint  -q ${MNT_ISO_1}/);then
						echo 'repo 1 not mounted'
				else umount ${MNT_ISO_1}
				fi

				if ! $(mountpoint  -q ${MNT_ISO_2}/);then
						echo 'repo 2 not mounted'
				else umount ${MNT_ISO_2}
				fi

				if ! $(mountpoint  -q ${MNT_ISO_3}/);then
						echo 'repo 3 not mounted'
				else umount ${MNT_ISO_3}
				fi
				;;	
		*)
				echo 'use sudo mount_CD_repo mount/umount to mount or unmount ISO files'
				;;

		esac
