#/bin/bash

MODE="$1"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp -rf ../../

source $SCRIPT_DIR/lfs_common.shrc

if [[ -n $MODE ]] && [[ -n "$(inValidMode "clean" "$MODE")" ]]
then
	cd $LFS/sources && ls -d */ | cut -f1 -d'/' | xargs -I {} rm -rf {}
	#rm -rf  $LFS/*/*
	rm -rf  $LFS/tools/*
	rm -rf  $LFS/usr/*
fi

if [[ -n "$(inValidMode "binutils" "$MODE")" ]]
then
	SCRIPT=build_binutils.sh
	cp $SCRIPT_DIR/scripts/temporary_tools/$SCRIPT /tmp/$SCRIPT
	chown -R lfs:lfs /tmp/$SCRIPT
	sudo su lfs -c "/tmp/$SCRIPT"
	rm -fr /tmp/$SCRIPT
fi

