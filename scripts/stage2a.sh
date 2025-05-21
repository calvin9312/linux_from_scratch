#/bin/bash

source $(dirname $(readlink -e ${BASH_SOURCE[0]}))/setup.shrc $(basename ${BASH_SOURCE[0]}) N $@

./build_pre_chroot_bootstrap_tools.sh

./pre_chroot_mount.sh
