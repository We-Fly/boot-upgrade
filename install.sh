#! /bin/bash

sudo apt-get update

sudo apt-get install inotify-tools -y

git clone https://github.com/We-Fly/boot-upgrade.git

sudo cp boot-upgrade/boot-upgrade.sh /usr/bin/boot-upgrade

sudo cp boot-upgrade.sh /usr/bin/boot-upgrade

sudo cp boot-upgrade/boot-upgrade.service /usr/lib/systemd/system/boot-upgrade.service

sudo cp boot-upgrade.service /usr/lib/systemd/system/boot-upgrade.service

sudo chmod 755 /usr/bin/status

sudo chmod 755 /usr/lib/systemd/system/boot-upgrade.service

sudo systemctl daemon-reload

sudo systemctl start boot-upgrade.service

sudo systemctl enable boot-upgrade.service

sudo systemctl status boot-upgrade.service

sleep 5s

sudo rm -rf boot-upgrade

cd .. && sudo rm -rf boot-upgrade
