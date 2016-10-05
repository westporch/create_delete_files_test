#!/bin/bash
# Hyun-gwan Seo

BASE_DIR=/data
ITERATION=1
FILE_SIZE=1M

function get_inode_info()
{
	df -i | head -n 1
	df -i | grep /data
}

echo "파일 생성 전 /data(ocfs2 파일 시스템)의 inode 정보"
get_inode_info()

for((idx = 0; idx < $ITERATION; idx++))
do
	dd if=/dev/zero of=/$BASE_DIR/file_test-$ITERATION.txt bs=$FILE_SIZE count=1
done

echo "파일 생성 후 /data(ocfs2 파일 시스템)의 inode 정보"
get_inode_info()

sleep 5000	# 5s
rm -rf $BASE_DIR/*.txt

echo "파일 삭제 후 /data(ocfs2 파일 시스템)의 inode 정보"
get_inode_info()
