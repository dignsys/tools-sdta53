# tools-sdta9

How to use tools on SDTA9
1. Directory structure

  +- Tizen-Work-boot 
  
      +- tools-sdta9
      
      +- boot-firmwares-sdta9
      
      +- tizen-images-sdta9
      
      +- result

2. Create working directory

  $ cd ~/
  
  $ mkdir Tizen-Work-boot
  
  $ cd Tizen-Work-boot
  

3. Download tools-sdta9 & boot firmwares

  $ git clone https://github.com/dignsys/tools-sdta9.git
  
  $ git clone https://github.com/dignsys/tizen-images-sdta9.git
  
  $ git clone https://github.com/dignsys/boot-firmwares-sdta9.git
  

4. install boot firmware binary

  $ mkdir result
  
  $ cd result
  
  $ cp ../boot-firmwares-sdta9/* .
  
  $ tar zxvf ../tizen-images-sdta9/tizen-unified_iot-boot-armv7l-artik530.tar.gz
  
  $ tar zxvf ../tizen-images-sdta9/tizen-unified_iot-headed-3parts-armv7l-sdta9.tar.gz
  
  $ ls
  

5. USB download : first boot with new board

  $ cd ~/Tizen-Work-boot
  
  $ ./tools-sdta9/scripts/uboot-usb-download.sh
  

6. Flash boot image

  < target side >
  
  artik530> fastboot 0
  
  
  < host side >
  
  $ ./tools-sdta9/scripts/fastboot-boot-download.sh
  

7. Flash tizen image

  < target side >
  
  artik530> fastboot 0
  
  
  < host side >
  
  $ ./tools-sdta9/scripts/fastboot-download.sh
