#/bin/bash

source $(dirname $(readlink -e ${BASH_SOURCE[0]}))/setup.shrc $(basename ${BASH_SOURCE[0]}) N $@

if [[ -n $MODE ]] && [[ -n "$(inValidMode "clean" "$MODE")" ]]
then
	echo "clean mode is not setup."
	exit
fi

if [[ -n "$(inValidMode "only_chroot" "$MODE")" ]] 
then
chroot "$LFS" /usr/bin/env -i \
HOME=/root \
TERM="$TERM" \
PS1='(lfs chroot) \u:\w\$ ' \
PATH=/usr/bin:/usr/sbin \
MAKEFLAGS="-j$(nproc)" \
TESTSUITEFLAGS="-j$(nproc)" \
/bin/bash --login
exit
fi

if [[ -n "$(inValidMode "backup" "$MODE")" ]]
then
mountpoint -q $LFS/dev/shm && umount $LFS/dev/shm
umount $LFS/dev/pts
umount $LFS/{sys,proc,run,dev}

cd $LFS
tar -cJpf $HOME/lfs-temp-tools-12.3.tar.xz .
exit
fi

if [[ -n "$(inValidMode "restore" "$MODE")" ]]
then
cd $LFS
rm -rf ./*
tar -xpf $HOME/lfs-temp-tools-12.3.tar.xz
exit
fi



./stage2a.sh $MODE


if [[ -n "$(inValidMode "no_chroot" "$MODE")" ]] ; then exit ; fi

chroot "$LFS" /usr/bin/env -i \
HOME=/root \
TERM="$TERM" \
PS1='(lfs chroot) \u:\w\$ ' \
PATH=/usr/bin:/usr/sbin \
MAKEFLAGS="-j$(nproc)" \
TESTSUITEFLAGS="-j$(nproc)" \
/bin/bash --login -c "/linux_from_scratch/script/stage2b.sh $MODE"
