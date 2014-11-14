#!/bin/bash
# /root/FIO-hardisk

fio /root/FIO-TEST/random-read.fio >> /root/`date +"%d%m%y-%H%M%S"`--random-read-kq.txt
rm /root/random-read.2.0
