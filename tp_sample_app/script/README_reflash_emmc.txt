****Reflash eMMC from SD card****

Use this if the system has gotten corrupted and needs to be rebuilt.

Idea is: 

1.boot off of SD card
2. Reformat eMMC partitions
3. Copy root volume to first and untag ubuntu filesystem to second volume
4. Reset boot volume to eMMC and reboot

This summarizes instructions from Software User Guide chaps 3 and 4
********************************************

Plug serial port into terminal emulator (a la ZTerm on Mac or Windows).  Mac will probably need supplemental PL-2303 USB-to-serial adaptor.  Windows PC may have real serial port.

Set serial port to D2Plug to 115,300 kbaud.

Push reset button with a paper clip on side of D2Plug…hit key when text appears to get it to stop at UBoot prompt.  Use these commands: 

Switch bootable drive to inserted SD card:

set bootcmd 'usb start; fatload usb 1:1 0x2000000 uImage.d2plug; bootm 0x2000000'set bootargs 'console=ttyS0,115200 video=dovefb:lcd0:1920x1080-16@60,lcd1:1024x768-16@60-edid clcd.lcd0_enable=1 clcd.lcd1_enable=1 usb0Mode=host root=/dev/ubb2 rootwait'

usb start
fatls usb 1:1

save
reset

…after 90-100 secs should get to login:

login: ubuntu
password: marvell

now in ubuntu prompt on serial term.

Also if you have a vga monitor you'll see the ubuntu guy appear.

If you have to reflash the eMMC internal 10 G drive:

Follow instructions from download page:

http://www.plugcomputer.org/downloads/d2plug/

Particular section: Chapter 4 of http://www.plugcomputer.org/405/us/d2plug/documentation/D2Plug-Software-User-Guide.pdf

EXCEPT files are in directory ~/d2plug/<filename> not directly in root directory

ALSO recommend NOT using the d2plug-rebuild.tar.gz…USE the original d2plug-rootfs-… file.

********After restoration reset uboot to standard boot sequence**********
sudo reboot

<uboot prompt>

set bootcmd 'mmcinfo; fatload mmc 0 0x2000000 uImage.d2plug; bootm 0x2000000'
set bootargs 'console=ttyS0,115200 video=dovefb:lcd0:1920x1080-16@60,lcd1:1024x768-16@60-edid clcd.lcd0_enable=1 clcd.lcd1_enable=1 usb0Mode=host root=/dev/mmcblk0p2 rootwait'

# to check
mmcinfo;
fatls mmc 0:1

save
reset

