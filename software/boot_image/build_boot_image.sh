#!/bin/bash

function cp_bootimg() {
	cp -v ../fsbl/build/executable.elf ultrazed_fsbl.elf
	cp -v ../pmu/build/executable.elf ultrazed_pmu.elf
	cp -v ../petalinux_build/images/linux/bl31.elf .
	cp -v ../petalinux_build/images/linux/u-boot.elf .
}

function clean_bootimg() {
	rm -fr BOOT.bin *.elf *.bit
}

function build_bootimg() {
	clean_bootimg
	cp_bootimg
	bootgen -image boot.bif -arch zynqmp -o BOOT.bin -w on 
}
