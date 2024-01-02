#!/bin/bash

SCRIPTBASENAME=$(basename $0)

set +x

YERITH_ERP_3_0_CHROOT_OUTSIDE_EXCHANGE_FILE_FOLDER=/mnt

DEBIAN_i386_ISO_FILE_MOUNT_POINT=/mnt/iso_4

DEBIAN_i386_ISO_FILE_FULL_PATH=/mnt-iso-i386/debian-10.0.0-i386-DVD-1.iso 

YERITH_ERP_3_0_CHROOT=

YERITH_ERP_3_0_CHROOT_YERITH_BIN=${YERITH_ERP_3_0_CHROOT}/root/yerith-bin


. ${YERITH_ERP_3_0_CHROOT}/root/.bashrc

chmod +x ${YERITH_ERP_3_0_CHROOT_YERITH_BIN}/yerithx-offline-mount-i386-repo.sh

chmod +x ${YERITH_ERP_3_0_CHROOT_YERITH_BIN}/yerithx-install-all-packages.sh

${YERITH_ERP_3_0_CHROOT_YERITH_BIN}/yerithx-offline-mount-i386-repo.sh mount

apt update

echo "[${SCRIPTBASENAME}] | I HAVE NOW UPDATED SOURCE PACKAGE LIST !"

echo "[${SCRIPTBASENAME}] | I NOW INSTALL PROGRAMS FOR YERITH-ERP-3.0 INSTALLATION !"

${YERITH_ERP_3_0_CHROOT_YERITH_BIN}/yerithx-install-all-packages.sh

echo "[${SCRIPTBASENAME}] | I HAVE FINISHED INSTALLATION."

sleep 1

[ ! -z ${YERITH_ERP_3_0_CHROOT} ] && echo "[$SCRIPTBASENAME] | YERITH_ERP_3_0_CHROOT: ${YERITH_ERP_3_0_CHROOT}"
[ ! -z ${YERITH_ERP_3_0_CHROOT} ] && umount ${YERITH_ERP_3_0_CHROOT}/proc
[ ! -z ${YERITH_ERP_3_0_CHROOT} ] && umount ${YERITH_ERP_3_0_CHROOT}/dev/pts
[ ! -z ${YERITH_ERP_3_0_CHROOT} ] && umount ${YERITH_ERP_3_0_CHROOT}/dev

        
[ ! -z ${YERITH_ERP_3_0_CHROOT} ] && umount ${YERITH_ERP_3_0_CHROOT}/sys
[ ! -z ${YERITH_ERP_3_0_CHROOT} ] && umount ${YERITH_ERP_3_0_CHROOT}/run
