#!/bin/bash

sudo mkdir /tmp/ramdisk
sudo chmod 777 /tmp/ramdisk
sudo mount -t tmpfs -o size=1G yeritherpthreezero-ramdisk /tmp/ramdisk
