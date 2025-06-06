#!/bin/bash

MODE=$1
NAME=$2

LFS="/mnt/lfs"

TAR_DIR="$HOME/lfs_backups"
TAR_PATH="$TAR_DIR/lfs-temp-tools-12.3.${NAME}.tar"

if [[ "$(whoami)" != "root" ]]
then
	echo "This script needs to be run as root"	
	exit
fi

if [[ ! -e $LFS ]]
then
	echo "backup only works when ${LFS} exists"
	exit
fi

if [[ "$MODE" == "backup" ]]
then
	mkdir -p $TAR_DIR
	mountpoint -q $LFS/dev/shm && umount $LFS/dev/shm
	umount $LFS/dev/pts
	umount $LFS/{sys,proc,run,dev}

	cd $LFS
	tar -cf $TAR_PATH .
	exit
fi

if [[ "$MODE" == "restore" ]]
then
	./stage1.sh clean
	./stage1.sh make_partitions
	./stage1.sh mount_partitions
	./stage1.sh final_preparations
	cd $LFS && rm -rf ./* && tar -xf $TAR_PATH
	exit
fi

