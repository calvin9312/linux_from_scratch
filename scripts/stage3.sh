#/bin/bash

source $(dirname $(readlink -e ${BASH_SOURCE[0]}))/setup.shrc $(basename ${BASH_SOURCE[0]}) N $@

./build_final_tools.sh $1









