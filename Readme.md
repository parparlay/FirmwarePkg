# **FirmwarePkg:** A EFI Firmware for common machines
This firmware is a made to work in this standard (EFI), the firmware bind a support to the UNIX-Like OS in the configuration panel, like sync the UEFI Password with a Root Password in UNIX, install new root packages, and more.

The firmware supports a SecureBoot standard for more security in the boot.

## **Who to build?**

This Firmware is a package for **TianoCore EDK II**, you must a download first the **EDK II**:

    bash-4.4$ git clone https://github.com/tianocore/edk2 # For x86 or x86-64 builds
    bash-4.4$ git clone https://github.com/ARM-software/edk2 # For ARM or ARM64 builds
    bash-4.4$ cd edk2

A one to download the EDK II, you should a clone this project:

    bash-4.4$ git clone --recursive https://github.com/LastDevelopers/FirmwarePkg
    bash-4.4$ make -C BaseTools
    bash-4.4$ . edksetup.sh
    bash-4.4$ build -p FirmwarePkg/<Package to Specific board>.dsc -a <Arch to build> -n 4 -t GCC5

The project supports a new boards to build in these target, you must check the support for you board in this project.

**This project is a experimental build, no use for a personal use, only for testing.**

