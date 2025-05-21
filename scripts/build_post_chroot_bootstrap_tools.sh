#/bin/bash

source $(dirname $(readlink -e ${BASH_SOURCE[0]}))/setup.shrc $(basename ${BASH_SOURCE[0]}) N $@

BOOTSTRAP_SCRIPT_DIR="$LFS_REPO_DIR/scripts/build_post_chroot_bootstrap_tools"

if [[ -n "$(inValidMode "gettext" "$MODE")" ]] ; then echo "STARTING BUILD GETTEXT" ; $BOOTSTRAP_SCRIPT_DIR/build_gettext.sh ; echo "FINISHED BUILD GETTEXT" ; fi

if [[ -n "$(inValidMode "bison" "$MODE")" ]] ; then echo "STARTING BUILD BISON" ; $BOOTSTRAP_SCRIPT_DIR/build_bison.sh ; echo "FINISHED BUILD BISON" ; fi

if [[ -n "$(inValidMode "perl" "$MODE")" ]] ; then echo "STARTING BUILD PERL" ; $BOOTSTRAP_SCRIPT_DIR/build_perl.sh ; echo "FINISHED BUILD PERL" ; fi

if [[ -n "$(inValidMode "python" "$MODE")" ]] ; then echo "STARTING BUILD PYTHON" ; $BOOTSTRAP_SCRIPT_DIR/build_python.sh ; echo "FINISHED BUILD PYTHON" ; fi

if [[ -n "$(inValidMode "texinfo" "$MODE")" ]] ; then echo "STARTING BUILD TEXINFO" ; $BOOTSTRAP_SCRIPT_DIR/build_texinfo.sh ; echo "FINISHED BUILD TEXINFO" ; fi

if [[ -n "$(inValidMode "util_linux" "$MODE")" ]] ; then echo "STARTING BUILD UTIL_LINUX" ; $BOOTSTRAP_SCRIPT_DIR/build_util_linux.sh ; echo "FINISHED BUILD UTIL_LINUX" ; fi
