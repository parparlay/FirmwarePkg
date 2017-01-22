#!/bin/bash

BUILD_ROOT=$WORKSPACE/Build/FirmwarePkg/"$TARGET"_"$TARGET_TOOLS"
TMP_DIR=$BUILD_ROOT/Temp
BOOT_IMAGE=kernel.img

if [ $retval -eq 0 ]; then
	UEFI_BIN=$WORKSPACE/Build/FirmwarePkg/"$TARGET"_"$TARGET_TOOLS"/FV/PI2BOARD_EFI.fd
	
	if [ -d ${BUILD_ROOT} ]; then
		rm -rf $BUILD_ROOT
		mkdir -p $BUILD_ROOT
	else
		mkdir -p $BUILD_ROOT
	fi

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

	echo -e "RaspberryPi2 Build Image ## Succeeded ##\n"

else
	echo -e "RaspberryPi2 Build Image ## Failed ##\n"
fi

