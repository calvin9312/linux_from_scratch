#!/bin/bash

MODE=$1
NAME=$2

LFS="/mnt/lfs"

TAR_PATH="$HOME/lfs-temp-tools-12.3.${NAME}.tar"

if [[ ! -e $LFS ]]
then
	echo "backup only works when ${LFS} exists"
	exit
fi

if [[ -n "$(inValidMode "backup" "$MODE")" ]]
then

	mountpoint -q $LFS/dev/shm && umount $LFS/dev/shm
	umount $LFS/dev/pts
	umount $LFS/{sys,proc,run,dev}

	cd $LFS
	tar -cf $TAR_PATH .
	exit
fi

if [[ -n "$(inValidMode "restore" "$MODE")" ]]
then
	./stage1.sh clean
	./stage1.sh make_partitions
	./stage1.sh mount_partitions
	./stage1.sh final_preparations
	cd $LFS && rm -rf ./* && tar -xf $TAR_PATH
	exit
fi

