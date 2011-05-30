#!/bin/sh

umount /dev/sdc1
mount -t ext3 -rw /dev/sdc1 /media/usb
