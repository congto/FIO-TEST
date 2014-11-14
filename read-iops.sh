#!/bin/bash
# /root/FIO-hardisk

fio /root/FIO-TEST/read-iops.fio >> /root/`date +"%d%m%y-%H%M%S"`-read-kq.txt
rm /root/read.1.0
