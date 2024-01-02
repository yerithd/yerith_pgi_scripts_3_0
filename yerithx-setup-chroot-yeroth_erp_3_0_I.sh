#!/bin/bash

SCRIPTBASENAME=$(basename $0)

set +x

YERITH_ERP_3_0_CHROOT_OUTSIDE_EXCHANGE_FILE_FOLDER=/mnt

DEBIAN_i386_ISO_FILE_MOUNT_POINT=/mnt/iso_4

DEBIAN_i386_ISO_FILE_FULL_PATH=/mnt-iso-i386/debian-10.0.0-i386-DVD-1.iso 

HTTP_DEBIAN_i386_REPO=http://127.0.0.1/debian

VAR_WWW_HTML_DEBIAN_i386_REPO=/var/www/html/debian

YERITH_ERP_3_0_CHROOT=/srv/chroot/yerith_erp_3_0

YERITH_ERP_3_0_BASE_YERITH_BIN=/root/yerith-bin 

YERITH_ERP_3_0_CHROOT_YERITH_BIN=${YERITH_ERP_3_0_CHROOT}/root/yerith-bin

mkdir -p "${YERITH_ERP_3_0_CHROOT}"

mkdir -p "${DEBIAN_i386_ISO_FILE_MOUNT_POINT}"

mount -o loop "${DEBIAN_i386_ISO_FILE_FULL_PATH}" "${DEBIAN_i386_ISO_FILE_MOUNT_POINT}"

rm "${VAR_WWW_HTML_DEBIAN_i386_REPO}"

ln -s "${DEBIAN_i386_ISO_FILE_MOUNT_POINT}" "${VAR_WWW_HTML_DEBIAN_i386_REPO}"

debootstrap --variant=buildd --no-check-gpg --arch i386 buster "${YERITH_ERP_3_0_CHROOT}" "${HTTP_DEBIAN_i386_REPO}"


echo "[${SCRIPTBASENAME}] | I HAVE FINISHED BASE INSTALLATION."


umount "${DEBIAN_i386_ISO_FILE_FULL_PATH}"


cat > ${YERITH_ERP_3_0_CHROOT}/usr/sbin/policy-rc.d <<EOF
#!/bin/sh
exit 101
EOF
chmod a+x ${YERITH_ERP_3_0_CHROOT}/usr/sbin/policy-rc.d


cp -r ${YERITH_ERP_3_0_BASE_YERITH_BIN} ${YERITH_ERP_3_0_CHROOT_YERITH_BIN} 

cp ${YERITH_ERP_3_0_CHROOT}/bin/true ${YERITH_ERP_3_0_CHROOT}/usr/bin/ischroot

mkdir -p ${YERITH_ERP_3_0_CHROOT}/media/cdrom

mkdir -p ${YERITH_ERP_3_0_CHROOT}/mnt-iso-i386

cp /mnt-iso-i386/debian-10.0.0-i386-DVD*.iso ${YERITH_ERP_3_0_CHROOT}/mnt-iso-i386

cp /root/.bashrc  ${YERITH_ERP_3_0_CHROOT}/root/.bashrc

cp /etc/fstab  ${YERITH_ERP_3_0_CHROOT}/etc/fstab

sed -i 's/root\/debian-10.0.0-amd64/mnt-iso-i386\/debian-10.0.0-i386/' ${YERITH_ERP_3_0_CHROOT}/etc/fstab

cp /etc/group  ${YERITH_ERP_3_0_CHROOT}/etc/group

cp /etc/passwd ${YERITH_ERP_3_0_CHROOT}/etc/passwd

cp /etc/hosts  ${YERITH_ERP_3_0_CHROOT}/etc/hosts

cp /etc/resolv.conf ${YERITH_ERP_3_0_CHROOT}/etc/resolv.conf


mkdir -p ${YERITH_ERP_3_0_CHROOT}/mnt-iso-i386


mount --bind /media/cdrom ${YERITH_ERP_3_0_CHROOT}/media/cdrom

mount --bind /dev ${YERITH_ERP_3_0_CHROOT}/dev

mount --bind /dev/pts ${YERITH_ERP_3_0_CHROOT}/dev/pts

mount --bind /proc  ${YERITH_ERP_3_0_CHROOT}/proc

mount --bind /sys  ${YERITH_ERP_3_0_CHROOT}/sys

mount --bind /run  ${YERITH_ERP_3_0_CHROOT}/run


cp ${YERITH_ERP_3_0_BASE_YERITH_BIN}/installation-packages-text-files/yerithx-part-etc-apt-sources-list.txt \
		${YERITH_ERP_3_0_CHROOT}/etc/apt/sources.list


chroot ${YERITH_ERP_3_0_CHROOT}


sleep 12

[ ! -z ${YERITH_ERP_3_0_CHROOT} ] && echo "[$SCRIPTBASENAME] | YERITH_ERP_3_0_CHROOT: ${YERITH_ERP_3_0_CHROOT}"
[ ! -z ${YERITH_ERP_3_0_CHROOT} ] && umount ${YERITH_ERP_3_0_CHROOT}/proc
[ ! -z ${YERITH_ERP_3_0_CHROOT} ] && umount ${YERITH_ERP_3_0_CHROOT}/dev/pts
[ ! -z ${YERITH_ERP_3_0_CHROOT} ] && umount ${YERITH_ERP_3_0_CHROOT}/dev

        
[ ! -z ${YERITH_ERP_3_0_CHROOT} ] && umount ${YERITH_ERP_3_0_CHROOT}/sys
[ ! -z ${YERITH_ERP_3_0_CHROOT} ] && umount ${YERITH_ERP_3_0_CHROOT}/run
