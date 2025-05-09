#/bin/bash

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
fi

./build_pre_chroot_bootstrap_tools.sh

chown --from lfs -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
x86_64) chown --from lfs -R root:root $LFS/lib64 ;;
esac

mkdir -pv $LFS/{dev,proc,sys,run}

mount -v --bind /dev $LFS/dev
mount -vt devpts devpts -o gid=5,mode=0620 $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
install -v -d -m 1777 $LFS$(realpath /dev/shm)
else
mount -vt tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
fi

if [[ -n "$(inValidMode "no_chroot" "$MODE")" ]] ; then exit ; fi

exit

chroot "$LFS" /usr/bin/env -i \
HOME=/root \
TERM="$TERM" \
PS1='(lfs chroot) \u:\w\$ ' \
PATH=/usr/bin:/usr/sbin \
MAKEFLAGS="-j$(nproc)" \
TESTSUITEFLAGS="-j$(nproc)" \
/bin/bash --login -c "/linux_from_scratch/script/stage2b.sh"
