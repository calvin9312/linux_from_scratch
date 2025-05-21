#/bin/bash

source $(dirname $(readlink -e ${BASH_SOURCE[0]}))/setup.shrc $(basename ${BASH_SOURCE[0]}) N $@

sed -i "/lfs_common/d" /root/.bashrc
echo "source /tmp/linux_from_scratch/scripts/lfs_common.shrc" >> /root/.bashrc

# clean up files

if [[ -n $MODE ]] && [[ -n "$(inValidMode "clean" "$MODE")" ]]
then
	umount $LFS
	rm -rf $LFS /dev/$PART_SWAP /dev/$PART_ROOT
	deluser --remove-home lfs
	exit
fi


# make partitions

if [[ -n "$(inValidMode "make_partitions" "$MODE")" ]]
then
	mkfs -v -t ext4 /dev/$PART_ROOT 32000000
	dd if=/dev/zero of=/dev/$PART_SWAP bs=1024 count=1000000
	mkswap /dev/$PART_SWAP
	#/sbin/swapon -v /dev/$PART_SWAP
fi


# mount partitions

if [[ -n "$(inValidMode "mount_partitions" "$MODE")" ]]
then
	mkdir -pv $LFS
	mount -v -t ext4 /dev/$PART_ROOT $LFS
	chown root:root $LFS
	chmod 755 $LFS
fi


# building packages

if [[ -n "$(inValidMode "build_packages" "$MODE")" ]]
then
	mkdir -v $LFS/sources
	chmod -v a+wt $LFS/sources

	# this uses expat 2.6.4 it should be replace with 2.6.7 
	pushd $LFS/sources && \
		wget https://www.linuxfromscratch.org/lfs/downloads/stable/md5sums && \
		wget https://www.linuxfromscratch.org/lfs/downloads/stable/wget-list && \
		cat wget-list | grep -v expat > wget-list.fixed && \
		wget --input-file=wget-list.fixed --continue --directory-prefix=$LFS/sources && \
		wget https://versaweb.dl.sourceforge.net/project/expat/expat/2.6.4/expat-2.6.4-RENAMED-VULNERABLE-PLEASE-USE-2.7.1-INSTEAD.tar.xz && \
		mv expat-2.6.4-RENAMED-VULNERABLE-PLEASE-USE-2.7.1-INSTEAD.tar.xz expat-2.6.4.tar.xz && \
		md5sum -c md5sums && \
		chown root:root *
	popd
fi


# Final preparations

if [[ -n "$(inValidMode "final_preparations" "$MODE")" ]]
then
	mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

	for i in bin lib sbin; do
		ln -sv usr/$i $LFS/$i
	done

	case $(uname -m) in
		x86_64) mkdir -pv $LFS/lib64 ;;
	esac

	mkdir -pv $LFS/tools

	groupadd lfs
	useradd -s /bin/bash -g lfs -m -k /dev/null lfs

	#passwd lfs

	chown -v lfs $LFS/{usr{,/*},var,etc,tools}
	case $(uname -m) in
		x86_64) chown -v lfs $LFS/lib64 ;;
	esac

	cat > /home/lfs/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

	cat > /home/lfs/.bashrc << "EOF"
source /tmp/linux_from_scratch/scripts/lfs_common.shrc
set +h
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
MAKEFLAGS=-j$(nproc)
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE MAKEFLAGS
EOF

fi

