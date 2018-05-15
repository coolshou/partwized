#!/bin/bash
##
##TODO
DEVICE=/dev/hda1
IMAGEFILE=backup.ntfsclone.lzop

#COMPRESS=gzip
#gzip default compress level too slow
#
COMPRESS=lzop

echo "Start: `date -Iseconds`"
if [ "$1" == "" ];then
	ntfsclone --save-image -o - ${DEVICE} | ${COMPRESS} -c > ${IMAGEFILE}
else
	${COMPRESS} -d -c ${IMAGEFILE} | ntfsclone --restore-image --overwrite ${DEVICE} -
fi

echo "End  : `date -Iseconds`"
