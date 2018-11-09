#!/bin/sh
. $(dirname $0)/path.sh
DIR=$(pwd)

VM="madev9-amd64 madev9-i386"
for v in $VM; do
  cd $HOME/vagrant/$v
  vagrant ssh -c "sh development/ma-${PACKAGE}/setup.sh" 2>&1 | tee ${DIR}/build-$v.log
  vagrant ssh -c "sh development/ma-${PACKAGE}/build.sh" 2>&1 | tee -a ${DIR}/build-$v.log
done
