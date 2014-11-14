#!/bin/bash
# /root/FIO-hardisk

fio /root/FIO-TEST/write-iops.fio >> /root/`date +"%d%m%y-%H%M%S"`--write-kq.txt
rm /root/write.1.0
