# Welcome to tools-sdta53 !
SDTA53X8 is ARM quad core SoM based open hardware platform.
The tools-sdta53 include tools for download and update firmware on SDTA53X8 .  You can find detail information for Tizen OS on this web site.

SDTA53X8 support Tizen OS. You can find detail information for Tizen OS on this web site.
> https://www.tizen.org/

The directory structure to handle SDTA53X8 firmware is followed.
>  **Tizen-Work-boot**
>    - tools-sdta53   
>    - boot-firmwares-sdta53
>    - tizen-image-sdta
>    - result

## How to tools-sdta53
### 1. Create working directory
```
$ cd ~/
$ mkdir -p ~/sdta/Tizen-Work-boot
$ cd ~/sdta/Tizen-Work-boot
```

### 2. Download tools-sdta53 & boot firmware
```
$ git clone https://github.com/dignsys/tools-sdta53.git
$ git clone https://github.com/dignsys/boot-firmwares-sdta53.git
$ git clone https://github.com/dignsys/tizen-images-sdta.git
$ wget http://download.tizen.org/releases/daily/tizen/5.5-unified/tizen-5.5-unified_20191203.1/images/standard/iot-headed-3parts-armv7l-artik530_710/tizen-5.5-unified_20191203.1_iot-headed-3parts-armv7l-artik530_710.tar.gz
```

### 3. Install boot firmware binary
```
$ mkdir -p ~/sdta/Tizen-Work-boot
$ cd ~/sdta/Tizen-Work-boot
$ mkdir -p result
$ cd result
$ cp ../ boot-firmwares-sdta53/files/* .
$ tar zxvf ../ tizen-image-sdta/tizen-unified_iot-boot-aarch64-artik710-sdta53.tar.gz
$ tar zxvf ../ tizen-unified_20191203.1_iot-headed-3parts-armv7l-artik530_710.tar.gz
```

### 4. USB download : first boot with new board
This is used at first boot with new board or recovery for damaged board only, you can use **fastboot** or **thordown** after fuse boot image after USB boot download.

**Target Board Console**
Change boot mode switch to USB boot. You can see board manual for USB boot.

**Host computer**
```
$ cd ~/sdta/Tizen-Work-boot
$ ./tools-sdta53/scripts/uboot-usb-download.sh
```
The board with start boot loader(u-boot), you can use **fastboot** for fusing fist Tizen image with pre-defined partition information.

### 5. Flash image by fastboot tool

**Target Board Console**
```
artik530> fastboot 0
```

**Host computer**
```
$ cd ~/sdta/Tizen-Work-boot
$ ./tools-sdta53/scripts/fastboot-download.sh
```

### 6. Flash image by lthor tool
The **lthor** is tool for download Tizen image to target board.
you can install **lthor** tool by following way.
```
$ sudo apt-get install lthor
```

You can download boot image and tizen image by use "thordown" image by following way.

**Target Board Console**
```
artik530# thordown
TIZEN "THOR" Downloader
```

**Host computer**
You can start **lthor** on the directory you have images.
```
$ cd ~/sdta/Tizen-Work-boot/result
$ sudo lthor tizen-unified_iot-boot-aarch64-artik710-sdta53.tar.gz tizen-unified_20191203.1_iot-headed-3parts-armv7l-artik530_710.tar.gz
```

## Post Install
### Install packages for Tizen
We need to install additional package for Tizen OS such as GPU(gl-ddk), Peripheral I/O, Bluetooth, WLAN, Multimedia.
You can find addition packages on **tizen-image-sdta/RPMS**.
```
$ cd ~/sdta/Tizen-Work-boot/tizen-image-sdta/RPMS
$ ls
bluetooth-firmware-bcm-0.2.1-1.armv7l.rpm
bluez-test-5.50-5.1.armv7l.rpm
capi-system-peripheral-io-0.1.0-0.armv7l.rpm
capi-system-peripheral-io-test-0.1.0-0.armv7l.rpm
mmfw-sysconf-target-artik530-0.2.134-0.armv7l.rpm  
rfkill-0.4-2.10.armv7l.rpm
wlandrv-plugin-tizen-ap6335-1.0.0-0.armv7l.rpm 
peripheral-bus-0.1.0-0.armv7l.rpm                  
bt-sdta53                                  
gl-ddk                                             
pkg_install.sh
```
We use **sdb** tool for install package on host computer. you can check **sdb** connection as following.
```
$ sdb devices
List of devices attached
0001-sdta53            device          artik
```
You can install packages by script **pkg_install.sh**.
```
$ sh pkg_install.sh
```
The SDTA53X8 will restart automatically after install all packages.
