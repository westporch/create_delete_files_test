#!/bin/bash
# Hyun-gwan Seo

BASE_DIR=/data
ITERATION=100
FILE_SIZE=1M

function get_inode_info()
{
	df -i | head -n 1
	df -i | grep /data
}

echo -e "\t파일 생성 전 /data(ocfs2 파일 시스템)의 inode 정보"
get_inode_info

for((idx = 0; idx < $ITERATION; idx++))
do
	dd if=/dev/zero of=/$BASE_DIR/file_test-$idx.txt bs=$FILE_SIZE count=1 &> /dev/null
done

echo -e "\t파일 생성 후 /data(ocfs2 파일 시스템)의 inode 정보"
get_inode_info

sleep 5
rm -rf $BASE_DIR/*.txt

echo -e "\t파일 삭제 후 /data(ocfs2 파일 시스템)의 inode 정보"
get_inode_info
