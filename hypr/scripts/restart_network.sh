#!/bin/bash

echo 1 | tee /sys/bus/pci/devices/0000:00:14.3/reset
modprobe -r iwlwifi && modprobe iwlwifi
