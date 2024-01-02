#!/bin/bash

apt update

sleep 1

yerithx-apt-install-packages-file.sh installation-packages-text-files/yerithx-packages-common-debian-mirror-http.txt

sleep 1

yerithx-apt-install-packages-file.sh installation-packages-text-files/yerithx-packages-common.txt

sleep 1

yerithx-apt-install-packages-file.sh installation-packages-text-files/yerithx-packages-computer-essantial.txt

sleep 1

yerithx-apt-install-packages-file.sh installation-packages-text-files/yerithx-packages-printers-drivers.txt

sleep 1

yerithx-apt-install-packages-file.sh installation-packages-text-files/yerithx-packages-dev.txt

sleep 1

yerithx-apt-install-packages-file.sh installation-packages-text-files/yerithx-packages-texlive.txt

sleep 0.5

yerithx-configure-firewall.sh
