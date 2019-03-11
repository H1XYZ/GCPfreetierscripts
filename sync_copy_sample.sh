#!/bin/bash
sh ./pushover.sh "Backup Started" "Free Tier Script"
echo -e "\e[93mSync Started...\e[0m"
rclone sync -v --transfers 2 --checkers 2 --exclude-from excludes.txt --drive-chunk-size 2M --drive-upload-cutoff 64M --drive-v2-download-min-size 0M --no-update-modtime --bwlimit 8.4M --log-file="sync.log" --disable move,copy --ignore-existing --stats 60s "source:" "destinantion:"
echo -e "\e[32mSync Completed\e[0m"
sh ./pushover.sh "Sync Completed" "Free Tier Backup"
echo .
echo .
echo .
echo .
echo -e "\e[93mCopy Started...\e[0m"
rclone copy -v --transfers 2 --checkers 2 --exclude-from excludes.txt --drive-chunk-size 2M --drive-upload-cutoff 64M --drive-v2-download-min-size 0M --no-update-modtime --bwlimit 8.4M --log-file="copy.log" --disable move,copy --ignore-existing --stats 60s "source:" "destinantion:"
echo -e "\e[32mCopy Completed\e[0m"
sh ./pushover.sh "Copy Completed" "Free Tier Script"
echo -e "\e[32mBYE\e[0m"