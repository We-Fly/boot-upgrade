#! /bin/bash

i="1"

while(i=i)

do

	inotifywait -e modify /boot/firmware/vmlinuz

	sleep 10s

	cd /boot/firmware/

	rm vmlinux.new

	dd if=vmlinuz bs=1 skip=0000000 | zcat > vmlinux.new

	rm vmlinux.old

	cp vmlinux vmlinux.old

	rm vmlinux

	cp vmlinux.new vmlinux

done
