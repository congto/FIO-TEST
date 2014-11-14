#!/bin/bash

fio /root/FIO-TEST/random-write.fio >> /root/`date +"%d%m%y-%H%M%S"`-random-write-kq.txt
rm /root/random-write.1.0
