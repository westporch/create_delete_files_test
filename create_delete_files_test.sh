#!/bin/bash
# Hyun-gwan Seo

BASE_DIR=/data
ITERATION=1
FILE_SIZE=1M

for((idx = 0; idx < $ITERATION; idx++))
do
	dd if=/dev/zero of=/$BASE_DIR/file_test-$ITERATION.txt bs=$FILE_SIZE count=1
	rm -rf $BASE_DIR/file_test-$ITERATION.txt
done

sleep 5000	# 5s
rm -rf $BASE_DIR/*.txt
