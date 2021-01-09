# pcem-macos-builder



Simple script to help building [PCem](https://pcem-emulator.co.uk/) low-level PC hardware emulator for MacOS. This is basically an automated version of [this](https://pcem-emulator.co.uk/phpBB3/viewtopic.php?t=3464) and [this](https://pcem-emulator.co.uk/phpBB3/viewtopic.php?t=3599) posts from the official forum.



## Building



Clone this repo or copy `build.sh` somewhere and, with [Homebrew](https://brew.sh/) installed, run:

```shell
./build.sh
```

Then start it with:

```shell
pcem17/pcem
```



## Tips



- You'll have to copy some [proprietary roms](https://archive.org/details/dos_rom_bios_collection) into the `roms/` directory.
- Downlaod an old operating system and their respective [boot disks](https://www.allbootdisks.com/):
     - [DOS 6.22](https://archive.org/details/MS_DOS_6.22_MICROSOFT)
     - [Windows 3.11](https://archive.org/details/win3_stock)
     - [Windows 95 SR2](https://archive.org/details/Win95OSR2)
     - [Windows 98 SE](https://archive.org/details/win98se_201801)
- You can use [Keka](https://www.keka.io/) to generate an ISO when you need to copy files into your VM.
- You can mount CD ROMs as .ISO files at runtime (right-click, context menu).
- You can and should change the rendering to OpenGL (context menu) at runtime.
- A high performance configuration is: 
  - Machine: [Socket 7] Award 430VX PCI
  - CPU: Intel Pentium MMX 233
  - Memory: 256 MB
  - Video: S3 ViRGE/DX | 4MB
  - Speed: Fast VLB/PCI
  - [x] Voodoo Graphics
    - Type: Vooodoo 2
    - Framebuffer memory size: 4MB
    - Textture memory size: 4MB
    - [x] SLI
    - [x] Recompiler
  - Sound: Sound Blaster PCI 128
  - [x] Gravis Ultrasound
  - Mouse: 2-button mouse (PS/2)



## Issues



- PCem segfaults on exit, but that doesn't mean anything bad for the user. Still, an error message will be shown after quit.
  
  

## Credits



- MacOS Instructions from: https://pcem-emulator.co.uk/phpBB3/viewtopic.php?t=3464
- v17 changes from: https://pcem-emulator.co.uk/phpBB3/viewtopic.php?t=3599
- For parts of this README file: https://github.com/kyr0/PCemV14MacOSX
- PCEm source: https://github.com/sarah-walker-pcem/pcem/