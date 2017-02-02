#!/bin/bash
TARGET=DEBUG
TARGET_TOOLS=GCC47

BUILD_ROOT=$WORKSPACE/Build/FirmwarePkg/"$TARGET"_"$TARGET_TOOLS"
TMP_DIR=$BUILD_ROOT/Temp
BOOT_IMAGE=kernel.img

UEFI_BIN=$WORKSPACE/Build/FirmwarePkg/"$TARGET"_"$TARGET_TOOLS"/FV/PI2BOARD_EFI.fd

mkdir $TMP_DIR


echo -e "Composing $BOOT_IMAGE...\n"

#
# Build startup code
#
$WORKSPACE/FirmwarePkg/Boards/RaspberryPi2/Scripts/startup_build.sh $WORKSPACE/FirmwarePkg/Boards/RaspberryPi2/Scripts/startup.S 0x8000 $TMP_DIR/startup.bin

#
# Generate final firmware image
#
cat $TMP_DIR/startup.bin $UEFI_BIN > $BUILD_ROOT/$BOOT_IMAGE

echo -e "\nDone Composing combined $BOOT_IMAGE\n"

#
# Clean up
#
rm -rf $TMP_DIR

echo -e "Created combined $BOOT_IMAGE $TARGET at $BUILD_ROOT/$BOOT_IMAGE\n"


