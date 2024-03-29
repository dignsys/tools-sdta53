# -*-mic2-options-*- -A armv7l -f loop --pack-to=@NAME@.tar.gz -*-mic2-options-*-

# 
# Do not Edit! Generated by:
# kickstarter.py
# 

lang en_US.UTF-8
keyboard us
timezone --utc America/Los_Angeles
part /boot --fstype="ext4" --size=48 --ondisk=mmcblk0 --active --label boot --fsoptions=defaults,noatime
part /lib/modules --fstype="ext4" --size=25 --ondisk=mmcblk0 --active --label modules --fsoptions=defaults,noatime


rootpw tizen 
xconfig --startxonboot
bootloader  --timeout=3  --append="rw vga=current splash rootwait rootfstype=ext4"   --ptable=gpt --menus="install:Wipe and Install:systemd.unit=system-installer.service:test"

desktop --autologinuser=guest  
user --name guest  --groups audio,video --password 'tizen'


repo --name=local --baseurl=file:///home/hbahn/GBS-SDTA53-ROOT/tizen_sdta53/local/repos/tizen_sdta53/aarch64/ --priority=1

#repo --name=unified-standard --baseurl=http://download.tizen.org/releases/milestone/tizen/unified/tizen-unified_20190523.1/repos/standard/packages/ --ssl_verify=no
#repo --name=unified-standard --baseurl=http://download.tizen.org/snapshots/tizen/unified/tizen-unified_20190923.1/repos/standard/packages/ --ssl_verify=no

repo --name=unified-standard --baseurl=http://download.tizen.org/snapshots/tizen/unified/latest/repos/standard/packages/ --ssl_verify=no
repo --name=base-standard --baseurl=http://download.tizen.org/snapshots/tizen/base/latest/repos/standard/packages/ --ssl_verify=no

%packages
# @ IoT Boot Artik 710
artik710-raptor-linux-kernel
artik710-raptor-linux-kernel-modules
sdta53-boot-firmware
#u-boot-artik710
# Others

%end

%attachment

/u-boot/fip-nonsecure.img
/u-boot/params.bin
#/boot/logo.bmp

%end

%post

%end

%post --nochroot

%end

%runscript

%end

