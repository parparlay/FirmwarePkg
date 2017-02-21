[Defines]
  PLATFORM_NAME                  = FirmwarePkg
  PLATFORM_GUID                  = cc94872a-5a40-4349-8e67-bb9df1247f4f
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/FirmwarePkg
  SUPPORTED_ARCHITECTURES        = ARM
  BUILD_TARGETS                  = RELEASE|DEBUG
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = FirmwarePkg/FirmwarePkg_RPi2.fdf
  POSTBUILD                      = FirmwarePkg/Boards/RaspberryPi2/PostBuild.sh  

  SECURE_BOOT_ENABLE     	 = FALSE
  NETWORK_IP6_ENABLE       	 = FALSE

[BuildOptions]
  XCODE:*_*_ARM_PLATFORM_FLAGS == -arch armv7

  GCC:*_*_ARM_PLATFORM_FLAGS == -march=armv7-a

  RVCT:*_*_ARM_PLATFORM_FLAGS == --cpu Cortex-A8

[LibraryClasses.common]
  #
  # Entry point
  #
  UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
  UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf

  #
  # Basic
  #
  BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
  BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
  PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
  CpuLib|MdePkg/Library/BaseCpuLib/BaseCpuLib.inf

  IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
  PciLib|MdePkg/Library/BasePciLibCf8/BasePciLibCf8.inf
  PeCoffLib|MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf
  PeCoffGetEntryPointLib|MdePkg/Library/BasePeCoffGetEntryPointLib/BasePeCoffGetEntryPointLib.inf

  #
  # UEFI & PI
  #
  UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  UefiRuntimeServicesTableLib|MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  UefiRuntimeLib|MdePkg/Library/UefiRuntimeLib/UefiRuntimeLib.inf
  UefiLib|MdePkg/Library/UefiLib/UefiLib.inf

  HiiLib|MdeModulePkg/Library/UefiHiiLib/UefiHiiLib.inf
  UefiHiiServicesLib|MdeModulePkg/Library/UefiHiiServicesLib/UefiHiiServicesLib.inf
  DevicePathLib|MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  DxeServicesLib|MdePkg/Library/DxeServicesLib/DxeServicesLib.inf

  PrePiLib|EmbeddedPkg/Library/PrePiLib/PrePiLib.inf
  DxeServicesTableLib|MdePkg/Library/DxeServicesTableLib/DxeServicesTableLib.inf

  #
  # DXE phase common
  #
  MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  HobLib|MdePkg/Library/DxeHobLib/DxeHobLib.inf

  #
  # Generic Modules
  #
  NetLib|MdeModulePkg/Library/DxeNetLib/DxeNetLib.inf
  DpcLib|MdeModulePkg/Library/DxeDpcLib/DxeDpcLib.inf
  IpIoLib|MdeModulePkg/Library/DxeIpIoLib/DxeIpIoLib.inf
  TcpIoLib|MdeModulePkg/Library/DxeTcpIoLib/DxeTcpIoLib.inf
  
  UdpIoLib|MdeModulePkg/Library/DxeUdpIoLib/DxeUdpIoLib.inf
  SecurityManagementLib|MdeModulePkg/Library/DxeSecurityManagementLib/DxeSecurityManagementLib.inf
  DebugPrintErrorLevelLib|MdePkg/Library/BaseDebugPrintErrorLevelLib/BaseDebugPrintErrorLevelLib.inf

  #
  # Misc
  # 
  !if $(TARGET) == RELEASE
     DebugLib|MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf
  !else
     DebugLib|MdePkg/Library/BaseDebugLibSerialPort/BaseDebugLibSerialPort.inf
  !endif
  PerformanceLib|MdePkg/Library/BasePerformanceLibNull/BasePerformanceLibNull.inf
  UefiBootManagerLib|MdeModulePkg/Library/UefiBootManagerLib/UefiBootManagerLib.inf
  CustomizedDisplayLib|MdeModulePkg/Library/CustomizedDisplayLib/CustomizedDisplayLib.inf
  BootLogoLib|MdeModulePkg/Library/BootLogoLib/BootLogoLib.inf

  SortLib|MdeModulePkg/Library/UefiSortLib/UefiSortLib.inf
  ReportStatusCodeLib|MdeModulePkg/Library/DxeReportStatusCodeLib/DxeReportStatusCodeLib.inf
  FileExplorerLib|MdeModulePkg/Library/FileExplorerLib/FileExplorerLib.inf
  PeCoffExtraActionLib|MdePkg/Library/BasePeCoffExtraActionLibNull/BasePeCoffExtraActionLibNull.inf

  SemihostLib|ArmPkg/Library/SemihostLib/SemihostLib.inf

  #
  # CryptLib
  #
  !if $(SECURE_BOOT_ENABLE) == TRUE
    PlatformSecureLib|OvmfPkg/Library/PlatformSecureLib/PlatformSecureLib.inf
    TpmMeasurementLib|SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.inf
    AuthVariableLib|SecurityPkg/Library/AuthVariableLib/AuthVariableLib.inf

    BaseCryptLib|CryptoPkg/Library/BaseCryptLib/BaseCryptLib.inf
    OpensslLib|CryptoPkg/Library/OpensslLib/OpensslLib.inf
    IntrinsicLib|CryptoPkg/Library/IntrinsicLib/IntrinsicLib.inf
  !endif

  #
  # Last Developer's Common Patchs
  #
  # FreeBSDConnectLib|FirmwarePkg/Libraries/FreeBSDConnectLib/FreeBSDConnectLib.inf
  # LastOSConnectLib|FirmwarePkg/Libraries/LastOSConnectLib/LastOSConnectLib.inf
  # LinuxOSConnectLib|FirmwarePkg/Libraries/LinuxOSConnectLib/LinuxOSConnectLib.inf
  # macOSConnectLib|FirmwarePkg/Libraries/macOSConnectLib/masOSConnectLib.inf
  #
  # MultibootEntryLib|FirmwarePkg/Libraries/MultibootEntryLib/MultibootEntryLib.inf

[LibraryClasses.ARM]
#
# It is not possible to prevent the ARM compiler for generic intrinsic functions.
# This library provides the instrinsic functions generate by a given compiler.
# [LibraryClasses.ARM] and NULL mean link this library into all ARM images.
#
  NULL|ArmPkg/Library/CompilerIntrinsicsLib/CompilerIntrinsicsLib.inf
  NULL|MdePkg/Library/BaseStackCheckLib/BaseStackCheckLib.inf

  #
  # CPU
  #
  ArmLib|ArmPkg/Library/ArmLib/ArmBaseLib.inf
  ArmMmuLib|ArmPkg/Library/ArmMmuLib/ArmMmuBaseLib.inf
  ArmCpuLib|ArmPkg/Drivers/ArmCpuLib/ArmCortexA9Lib/ArmCortexA9Lib.inf
  CpuExceptionHandlerLib|ArmPkg/Library/ArmExceptionLib/ArmExceptionLib.inf

  ArmSmcLib|ArmPkg/Library/ArmSmcLib/ArmSmcLib.inf
  ArmSoftFloatLib|ArmPkg/Library/ArmSoftFloatLib/ArmSoftFloatLib.inf
  ArmGenericTimerCounterLib|ArmPkg/Library/ArmGenericTimerPhyCounterLib/ArmGenericTimerPhyCounterLib.inf

  #
  # UEFI & PI
  #
  BdsLib|ArmPkg/Library/BdsLib/BdsLib.inf
  DmaLib|ArmPkg/Library/ArmDmaLib/ArmDmaLib.inf
  DebugAgentLib|MdeModulePkg/Library/DebugAgentLibNull/DebugAgentLibNull.inf
  ArmDisassemblerLib|ArmPkg/Library/ArmDisassemblerLib/ArmDisassemblerLib.inf

  MemoryInitPeiLib|ArmPlatformPkg/MemoryInitPei/MemoryInitPeiLib.inf
  UncachedMemoryAllocationLib|ArmPkg/Library/UncachedMemoryAllocationLib/UncachedMemoryAllocationLib.inf
  DefaultExceptionHandlerLib|ArmPkg/Library/DefaultExceptionHandlerLib/DefaultExceptionHandlerLib.inf
  CacheMaintenanceLib|ArmPkg/Library/ArmCacheMaintenanceLib/ArmCacheMaintenanceLib.inf

  #
  # Platform
  #
  TimerLib|ArmPkg/Library/ArmArchTimerLib/ArmArchTimerLib.inf
  EfiResetSystemLib|FirmwarePkg/Boards/RaspberryPi2/Library/ResetSystemLib/ResetSystemLib.inf
  ArmPlatformLib|FirmwarePkg/Boards/RaspberryPi2/Library/BoardConfigLib/BoardConfigLib.inf
  RealTimeClockLib|FirmwarePkg/Boards/RaspberryPi2/Library/VirtualRealTimeClockLib/VirtualRealTimeClockLib.inf

  ArmPlatformStackLib|ArmPlatformPkg/Library/ArmPlatformStackLib/ArmPlatformStackLib.inf
  PcdLib|FirmwarePkg/Boards/RaspberryPi2/Library/PcdConfigLib/PcdConfigLib.inf
  LedLib|FirmwarePkg/Boards/RaspberryPi2/Library/BcmLedLib/BcmLedLib.inf
  BcmMailboxLib|FirmwarePkg/Boards/RaspberryPi2/Library/BcmMailboxLib/BcmMailboxLib.inf

  #
  # Misc
  #
  PL011UartLib|ArmPlatformPkg/Drivers/PL011Uart/PL011Uart.inf
  SerialPortLib|ArmPlatformPkg/Library/PL011SerialPortLib/PL011SerialPortLib.inf
  PlatformBootManagerLib|FirmwarePkg/Boards/RaspberryPi2/Library/PlatformBootManagerLib/PlatformBootManagerLib.inf

[LibraryClasses.common.SEC, LibraryClasses.common.PEI_CORE]
  #
  # SEC & PEI
  #
  HobLib|EmbeddedPkg/Library/PrePiHobLib/PrePiHobLib.inf
  PeCoffLib|MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf
  UefiDecompressLib|MdePkg/Library/BaseUefiDecompressLib/BaseUefiDecompressLib.inf
  LzmaDecompressLib|MdeModulePkg/Library/LzmaCustomDecompressLib/LzmaCustomDecompressLib.inf

  MemoryAllocationLib|EmbeddedPkg/Library/PrePiMemoryAllocationLib/PrePiMemoryAllocationLib.inf
  ExtractGuidedSectionLib|EmbeddedPkg/Library/PrePiExtractGuidedSectionLib/PrePiExtractGuidedSectionLib.inf
  ReportStatusCodeLib|IntelFrameworkModulePkg/Library/PeiDxeDebugLibReportStatusCode/PeiDxeDebugLibReportStatusCode.inf

[LibraryClasses.ARM.SEC, LibraryClasses.ARM.PEI_CORE]
  #
  # SEC & PEI
  #
  ArmLib|ArmPkg/Library/ArmLib/ArmBaseLib.inf
  PlatformPeiLib|ArmPlatformPkg/PlatformPei/PlatformPeiLib.inf
  ArmPlatformSecLib|FirmwarePkg/Boards/RaspberryPi2/Library/SecLib/SecLib.inf
  PcdLib|FirmwarePkg/Boards/RaspberryPi2/Library/PcdConfigLib/PcdConfigLib.inf

  PrePiHobListPointerLib|ArmPlatformPkg/Library/PrePiHobListPointerLib/PrePiHobListPointerLib.inf
  ArmTrustedMonitorLib|ArmPlatformPkg/Library/ArmTrustedMonitorLibNull/ArmTrustedMonitorLibNull.inf

[LibraryClasses.common.DXE_CORE]
  #
  # DXE Core
  #
  HobLib|MdePkg/Library/DxeCoreHobLib/DxeCoreHobLib.inf
  DxeCoreEntryPoint|MdePkg/Library/DxeCoreEntryPoint/DxeCoreEntryPoint.inf
  ReportStatusCodeLib|MdeModulePkg/Library/DxeReportStatusCodeLib/DxeReportStatusCodeLib.inf
  MemoryAllocationLib|MdeModulePkg/Library/DxeCoreMemoryAllocationLib/DxeCoreMemoryAllocationLib.inf

  PeCoffLib|MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf
  DxeServicesLib|MdePkg/Library/DxeServicesLib/DxeServicesLib.inf
  UefiDecompressLib|MdePkg/Library/BaseUefiDecompressLib/BaseUefiDecompressLib.inf
  ExtractGuidedSectionLib|MdePkg/Library/DxeExtractGuidedSectionLib/DxeExtractGuidedSectionLib.inf

  PerformanceLib|MdeModulePkg/Library/DxeCorePerformanceLib/DxeCorePerformanceLib.inf
  
[LibraryClasses.common.UEFI_DRIVER, LibraryClasses.common.UEFI_APPLICATION]
  #
  # UEFI Driver && Application 
  #
  HiiLib|MdeModulePkg/Library/UefiHiiLib/UefiHiiLib.inf
  DxeServicesLib|MdePkg/Library/DxeServicesLib/DxeServicesLib.inf
  PerformanceLib|MdeModulePkg/Library/DxePerformanceLib/DxePerformanceLib.inf
  ExtractGuidedSectionLib|MdePkg/Library/DxeExtractGuidedSectionLib/DxeExtractGuidedSectionLib.inf

  ReportStatusCodeLib|IntelFrameworkModulePkg/Library/DxeReportStatusCodeLibFramework/DxeReportStatusCodeLib.inf
  UefiDecompressLib|IntelFrameworkModulePkg/Library/BaseUefiTianoCustomDecompressLib/BaseUefiTianoCustomDecompressLib.inf

[LibraryClasses.common.DXE_RUNTIME_DRIVER]
  #
  # Runtime Driver
  #
  HobLib|MdePkg/Library/DxeHobLib/DxeHobLib.inf
  MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  ReportStatusCodeLib|IntelFrameworkModulePkg/Library/DxeReportStatusCodeLibFramework/DxeReportStatusCodeLib.inf
  CapsuleLib|MdeModulePkg/Library/DxeCapsuleLibNull/DxeCapsuleLibNull.inf

  #
  # The Coff lib cannot be the PeCoffLib|EmbeddedPkg/Library/DxeHobPeCoffLib/DxeHobPeCoffLib.inf one
  # because it's rooted in PEI memory. As a result the call to SetVirtualAddressMap after ExitBootServices
  # will crash because the global memory (gPeCoffLoader) it uses is no longer mapped.
  #

  PeCoffLib|MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf

[PcdsFeatureFlag.common]
  gEfiMdePkgTokenSpaceGuid.PcdComponentNameDisable|TRUE
  gEfiMdePkgTokenSpaceGuid.PcdDriverDiagnosticsDisable|TRUE
  gEfiMdePkgTokenSpaceGuid.PcdComponentName2Disable|TRUE
  gEfiMdePkgTokenSpaceGuid.PcdDriverDiagnostics2Disable|TRUE

  #
  # Control what commands are supported from the UI
  # Turn these on and off to add features or save size
  #
  gEmbeddedTokenSpaceGuid.PcdEmbeddedMacBoot|TRUE
  gEmbeddedTokenSpaceGuid.PcdEmbeddedDirCmd|TRUE
  gEmbeddedTokenSpaceGuid.PcdEmbeddedHobCmd|TRUE
  gEmbeddedTokenSpaceGuid.PcdEmbeddedHwDebugCmd|TRUE
  gEmbeddedTokenSpaceGuid.PcdEmbeddedPciDebugCmd|TRUE
  gEmbeddedTokenSpaceGuid.PcdEmbeddedIoEnable|FALSE
  gEmbeddedTokenSpaceGuid.PcdEmbeddedScriptCmd|FALSE

  gEmbeddedTokenSpaceGuid.PcdCacheEnable|TRUE

  # Use the Vector Table location in CpuDxe. We will not copy the Vector Table at PcdCpuVectorBaseAddress
  gArmTokenSpaceGuid.PcdRelocateVectorTable|FALSE

  gEmbeddedTokenSpaceGuid.PcdPrePiProduceMemoryTypeInformationHob|TRUE
  gArmTokenSpaceGuid.PcdCpuDxeProduceDebugSupport|FALSE

  gEfiMdeModulePkgTokenSpaceGuid.PcdTurnOffUsbLegacySupport|TRUE

  ## If TRUE, Graphics Output Protocol will be installed on virtual handle created by ConsplitterDxe.
  #  It could be set FALSE to save size.
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutGopSupport|TRUE

  # The secondary cores are parked in the Pi2 boot firwmware. This flag triggers
  # the Pre Pi MP core component to send a signal releasing them (in the Pi 2 case
  # this is the write of the jump address into a mailbox implemented in the
  # BCM specific GIC component in order to match the ARM GIC case)
  gArmPlatformTokenSpaceGuid.PcdSendSgiToBringUpSecondaryCores|TRUE

[PcdsFixedAtBuild.common]
  gArmPlatformTokenSpaceGuid.PcdFirmwareVendor|"Raspberry Pi 2"
  gArmPlatformTokenSpaceGuid.PcdCoreCount|4

  gEmbeddedTokenSpaceGuid.PcdEmbeddedPrompt|"RaspberryPi2"
  gEfiMdePkgTokenSpaceGuid.PcdMaximumUnicodeStringLength|1000000
  gEfiMdePkgTokenSpaceGuid.PcdMaximumAsciiStringLength|1000000
  gEfiMdePkgTokenSpaceGuid.PcdMaximumLinkedListLength|1000000
  gEfiMdePkgTokenSpaceGuid.PcdSpinLockTimeout|10000000
  gEfiMdePkgTokenSpaceGuid.PcdDebugClearMemoryValue|0xAF
  gEfiMdePkgTokenSpaceGuid.PcdPerformanceLibraryPropertyMask|1
  gEfiMdePkgTokenSpaceGuid.PcdPostCodePropertyMask|0
  gEfiMdePkgTokenSpaceGuid.PcdUefiLibMaxPrintBufferSize|320

  # Default table revision to be ACPI 5.0 compliant
  #gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiExposedTableVersions|0x20

# DEBUG_ASSERT_ENABLED       0x01
# DEBUG_PRINT_ENABLED        0x02
# DEBUG_CODE_ENABLED         0x04
# CLEAR_MEMORY_ENABLED       0x08
# ASSERT_BREAKPOINT_ENABLED  0x10
# ASSERT_DEADLOOP_ENABLED    0x20
!if $(TARGET) == RELEASE
  gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x21
!else
  gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x2f
!endif

  #  DEBUG_INIT       0x00000001  // Initialization
  #  DEBUG_WARN       0x00000002  // Warnings
  #  DEBUG_LOAD       0x00000004  // Load events
  #  DEBUG_FS         0x00000008  // EFI File system
  #  DEBUG_POOL       0x00000010  // Alloc & Free's
  #  DEBUG_PAGE       0x00000020  // Alloc & Free's
  #  DEBUG_INFO       0x00000040  // Informational debug messages
  #  DEBUG_DISPATCH   0x00000080  // PEI/DXE/SMM Dispatchers
  #  DEBUG_VARIABLE   0x00000100  // Variable
  #  DEBUG_TIMER_INT  0x00000200  // Timer & Interrupt Drivers
  #  DEBUG_BM         0x00000400  // Boot Manager
  #  DEBUG_BLKIO      0x00001000  // BlkIo Driver
  #  DEBUG_NET        0x00004000  // SNI Driver
  #  DEBUG_MMCHOST_SD 0x00008000  // MMCHost Miniport Driver
  #  DEBUG_UNDI       0x00010000  // UNDI Driver
  #  DEBUG_LOADFILE   0x00020000  // UNDI Driver
  #  DEBUG_EVENT      0x00080000  // Event messages
  #  DEBUG_GCD        0x00100000  // Global Coherency Database changes
  #  DEBUG_CACHE      0x00200000  // Memory range cachability changes
  #  DEBUG_VERBOSE    0x00400000  // Detailed debug messages that may significantly impact boot performance
  #  DEBUG_ACPI       0x00800000  // ACPI table errors
  #  DEBUG_ERROR      0x80000000  // Error
  #
  # By default only enable init, error, warning and load debug prints to minimize
  # debug messages. Use "0x8FEF4DCF" for detailed debugging purposes.
  #gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel| 0x80000003 # 0x8FEF4DCF

  gEfiMdePkgTokenSpaceGuid.PcdReportStatusCodePropertyMask|0x07

  gEmbeddedTokenSpaceGuid.PcdEmbeddedAutomaticBootCommand|""
  gEmbeddedTokenSpaceGuid.PcdEmbeddedDefaultTextColor|0x07
  gEfiMdeModulePkgTokenSpaceGuid.PcdMaxVariableSize|0x000F0000
  gEmbeddedTokenSpaceGuid.PcdEmbeddedMemVariableStoreSize|0x10000

#
# Optional feature to help prevent EFI memory map fragments
# Turned on and off via: PcdPrePiProduceMemoryTypeInformationHob
# Values are in EFI Pages (4K). DXE Core will make sure that
# at least this much of each type of memory can be allocated
# from a single memory range. This way you only end up with
# maximum of two fragements for each type in the memory map
# (the memory used, and the free memory that was prereserved
# but not used).
#
  gEmbeddedTokenSpaceGuid.PcdMemoryTypeEfiACPIReclaimMemory|0
  gEmbeddedTokenSpaceGuid.PcdMemoryTypeEfiACPIMemoryNVS|0
  gEmbeddedTokenSpaceGuid.PcdMemoryTypeEfiReservedMemoryType|0
  gEmbeddedTokenSpaceGuid.PcdMemoryTypeEfiRuntimeServicesData|80
  gEmbeddedTokenSpaceGuid.PcdMemoryTypeEfiRuntimeServicesCode|40
  gEmbeddedTokenSpaceGuid.PcdMemoryTypeEfiBootServicesCode|400
  gEmbeddedTokenSpaceGuid.PcdMemoryTypeEfiBootServicesData|3000
  gEmbeddedTokenSpaceGuid.PcdMemoryTypeEfiLoaderCode|10
  gEmbeddedTokenSpaceGuid.PcdMemoryTypeEfiLoaderData|0

  gEfiMdePkgTokenSpaceGuid.PcdDefaultTerminalType|4

!if $(SECURE_BOOT_ENABLE) == TRUE
  # override the default values from SecurityPkg to ensure images from all sources are verified in secure boot
  gEfiSecurityPkgTokenSpaceGuid.PcdOptionRomImageVerificationPolicy|0x04
  gEfiSecurityPkgTokenSpaceGuid.PcdFixedMediaImageVerificationPolicy|0x04
  gEfiSecurityPkgTokenSpaceGuid.PcdRemovableMediaImageVerificationPolicy|0x04
!endif
#
# Pi2 board Specific PCDs
#
  #
  # ARM PL011 UART 0 settings to be used when it's included as the default serial port.
  #
  gArmPlatformTokenSpaceGuid.PL011UartClkInHz|16000000 # 16MHz this must match config.txt default is 3MHz

  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialRegisterBase|0x3F201000 # NOTE: Datasheet errata!

  gEfiMdePkgTokenSpaceGuid.PcdUartDefaultBaudRate|921600
  gEfiMdePkgTokenSpaceGuid.PcdUartDefaultDataBits|8
  gEfiMdePkgTokenSpaceGuid.PcdUartDefaultParity|1   # NoParity
  gEfiMdePkgTokenSpaceGuid.PcdUartDefaultStopBits|1 # OneStopBit

  gArmTokenSpaceGuid.PcdVFPEnabled|1

  # Reserve the lower 2MB of physical memory for UEFI
  gPi2BoardTokenSpaceGuid.PcdBootRegionBase|0x0
  gPi2BoardTokenSpaceGuid.PcdBootRegionSize|0x200000

  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x00200000

  # Size of the region used by UEFI in permanent memory (Reserved 16MB)
  gArmPlatformTokenSpaceGuid.PcdSystemMemoryUefiRegionSize|0x01000000

  # Size of the region reserved for fixed address allocations (Reserved 32MB)
  gArmTokenSpaceGuid.PcdArmLinuxKernelMaxOffset|0x02000000

  #
  # Fixed allocation memory for initial boot.
  # This region lives at offset 0xE0000 (896Kb) with length 0x20000 (128Kb)
  #
  # 0xE0000 -> 0xE0FFF - 1 x 4Kb page for the exception vector table.
  # 0xE1000 -> 0xE1FFF - 1 x 4Kb page for the first entry in the HOB list (dynamic memory)
  # 0xE2000 -> 0xE3FFF - 2 x 4Kb page for the Secure execution stacks (four stacks of 2Kb each)
  # 0xE4000 -> 0xEBFFF - 8 x 4Kb pages for the Primary Core normal stack (32Kb)
  # 0xEC000 -> 0xEEFFF - 3 x 4Kb pages for the Secondary Core normal stacks (three stacks of 4Kb each)
  # 0xEF000 -> 0xF0000 - 1 x 4Kb page unused (accidental GIC access)
  # 0xF0000 -> 0xF4000 - 4 x 4Kb pages for the Multi-Processor Parking Protocol mailboxes (four of 4Kb)
  #

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x000E0000  # Exception vector table.

  #
  # Stacks for MPCores in Secure World
  #
  gArmPlatformTokenSpaceGuid.PcdCPUCoresSecStackBase|0x000E2000
  gArmPlatformTokenSpaceGuid.PcdCPUCoreSecPrimaryStackSize|0x800
  gArmPlatformTokenSpaceGuid.PcdCPUCoreSecSecondaryStackSize|0x800

  #
  # Stacks for MPCores in Normal World
  # This is *required* to be used for the Multi-Processor Parking Protocol as used by Windows
  # because the secondary cores are started after ExitBootServices such that UEFI memory has already
  # been released. Therefore, the memory represented by PcdCPUCoresStackBase *must* be outside of the
  # System Memory declared to UEFI such that it's always available for use at any time.
  #
  gArmPlatformTokenSpaceGuid.PcdCPUCoresStackBase|0x000E4000
  gArmPlatformTokenSpaceGuid.PcdCPUCorePrimaryStackSize|0x8000
  gArmPlatformTokenSpaceGuid.PcdCPUCoreSecondaryStackSize|0x1000

  #
  # ARM General Interrupt Controller settings
  #
  # Since the 2836 doesn't have an ARM GIC we use the BCM "stub" library instead to provide only
  # enough functionality to be able to get the platform started and support multi-processor through
  # the MP Parking Protocol.
  # Therefore, these values are unused and set to point to unused memory in case something trys to
  # use it.
  #
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x000EF000
  gArmTokenSpaceGuid.PcdGicInterruptInterfaceBase|0x000EF100

  # Mailbox base for the Multi-Processor Parking Protocol (uses one 4Kb page per core, thus 16Kb)
  #
  # NOTE: This value is also reflected in the ACPI tables in the GIC Parked Address (mailbox address)
  #       fields for the four cores as 0x000F0000, 0x000F1000, 0x000F2000 & 0x000F3000. Therefore, if
  #       changed here it MUST also be changed in the ACPI tables to match.
  #
  gWOASupportTokenSpaceGuid.PcdCPUCoresMPPPMailboxBase|0x000F0000

  #
  # In the BCM Gic implementation this represents the address of the secondary
  # core start as written into the mailbox to be picked up by the Pi 2 boot
  # firmware. The net effect is to boot the secondary cores in exactly the same
  # way as the primary cores (through Sec and Pre Pi etc).
  #
  gArmTokenSpaceGuid.PcdCpuResetAddress|0x00008000  # Pi2 image load & start

  #
  # The Pi2 cores are in cluster 15
  #
  gArmTokenSpaceGuid.PcdArmPrimaryCore|0xF00
  gPi2BoardTokenSpaceGuid.PcdCoresClusterId|0xF

  #
  # The timer frequency is set by the ARM core timer prescaler to 19.2MHz.
  # Since the GIC CntFrq register is set in secure mode by the boot firmware
  # to 19.2MHz the UEFI platform init sets the prescaler to match the 19.2MHz
  # that's been set. Therefore, the value below is a constant and must be set to
  # 19.2MHz to match it.
  #

  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000  # 19.2MHz

  #
  # Timer interrupt routing.
  # If the GIC is used, these two lines can be removed as the ARM package defaults
  # are correct for the routing of the GIT interrupts to the GIC. Since the BCM2836 doesn't
  # use the GIC, these values represent the bit number in the Timer Control and IRQ Source
  # registers.
  #
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|0  #Interrupt Source/Vector 0
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|1     #Interrupt Source/Vector 1

  #
  # Set the tick period for UEFI polling and timeouts expressed in 100ns units.
  #  100000 ==  10ms (usual)
  # 1000000 == 100ms (can be used if DEBUG_TIMER_INT is on)
  #
  gEmbeddedTokenSpaceGuid.PcdTimerPeriod|100000  #10ms tick.

  # TBD if the below are correct.
  gEmbeddedTokenSpaceGuid.PcdEmbeddedPerformanceCounterPeriodInNanoseconds|77
  gEmbeddedTokenSpaceGuid.PcdEmbeddedPerformanceCounterFrequencyInHz|13000000

  #
  # ARM Pcds
  #
  gArmTokenSpaceGuid.PcdArmUncachedMemoryMask|0x0000000040000000

  #
  # Default boot options
  #
  gEfiMdePkgTokenSpaceGuid.PcdPlatformBootTimeOut|3

  #
  # MBR+GPT Workaround for SD Card
  #
!if $(RAMDISK_BOOT_ENABLE)
  # gPi2BoardTokenSpaceGuid.PcdArasanSDCardMBRGPTWorkaroundEnabled|0
!elseif $(MBRGPT_WORKAROUND_ENABLE)
  gPi2BoardTokenSpaceGuid.PcdArasanSDCardMBRGPTWorkaroundEnabled|1
  # This should be the same value passed to param <LBA Offset of GPT Header> of MBRPlusGPT.exe
  gPi2BoardTokenSpaceGuid.PcdArasanSDCardMBRGPTWorkaroundGPTOffsetLba|0x0009d000
!else
  gPi2BoardTokenSpaceGuid.PcdArasanSDCardMBRGPTWorkaroundEnabled|0
!endif

  # JTAG enable flag enabled on DEBUG build only
!if $(TARGET) == DEBUG
  gPi2BoardTokenSpaceGuid.PcdJtagEnabled|TRUE
!endif

  # Set this if the OS supports runtime pin muxing. This will leave pins as
  # GPIO by default, and it is the OS's responsibility to mux them away.
  gPi2BoardTokenSpaceGuid.PcdRuntimeMuxingEnabled|TRUE

  # UI app GUID
  gEfiMdeModulePkgTokenSpaceGuid.PcdBootManagerMenuFile|{ 0x21, 0xaa, 0x2c, 0x46, 0x14, 0x76, 0x03, 0x45, 0x83, 0x6e, 0x8a, 0xb6, 0xf4, 0x66, 0x23, 0x31 }
  
  gEfiMdeModulePkgTokenSpaceGuid.PcdResetOnMemoryTypeInformationChange|FALSE

[PcdsDynamicDefault]
  # This Pcd is declared as both Fixed and Dynamic in the Arm package dec file
  # The default is Fixed unless we redeclare it in the dsc as Dynamic
  # The value of 0 assigned here will be ignored, the actual PcdSystemMemorySize
  # will be calculated in runtime by means of UEFI<->VideoCore communication
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x0

[PcdsPatchableInModule]
  # Console Resolution
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1024
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|768

[Components.common]
  MdeModulePkg/Core/RuntimeDxe/RuntimeDxe.inf
  MdeModulePkg/Universal/WatchdogTimerDxe/WatchdogTimer.inf
  MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.inf
  MdeModulePkg/Universal/Variable/EmuRuntimeDxe/EmuVariableRuntimeDxe.inf
  EmbeddedPkg/EmbeddedMonotonicCounter/EmbeddedMonotonicCounter.inf

  MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.inf
  MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.inf
  MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf
  MdeModulePkg/Universal/Console/TerminalDxe/TerminalDxe.inf
  MdeModulePkg/Universal/SerialDxe/SerialDxe.inf

  EmbeddedPkg/ResetRuntimeDxe/ResetRuntimeDxe.inf
  EmbeddedPkg/RealTimeClockRuntimeDxe/RealTimeClockRuntimeDxe.inf
  EmbeddedPkg/MetronomeDxe/MetronomeDxe.inf

  #
  # FAT filesystem + GPT/MBR partitioning
  #
  MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.inf
  MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.inf
  MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.inf

  #
  # ACPI Support
  #
  MdeModulePkg/Universal/Acpi/AcpiTableDxe/AcpiTableDxe.inf
  MdeModulePkg/Universal/Acpi/AcpiPlatformDxe/AcpiPlatformDxe.inf
  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf

  #
  # SMBIOS Support
  #
  MdeModulePkg/Universal/SmbiosDxe/SmbiosDxe.inf

  #
  # Bds
  #
  MdeModulePkg/Universal/DevicePathDxe/DevicePathDxe.inf
  MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf
  MdeModulePkg/Universal/SetupBrowserDxe/SetupBrowserDxe.inf
  MdeModulePkg/Universal/DisplayEngineDxe/DisplayEngineDxe.inf
  MdeModulePkg/Universal/BdsDxe/BdsDxe.inf

  #
  # Network Support
  #
  MdeModulePkg/Universal/Network/SnpDxe/SnpDxe.inf
  MdeModulePkg/Universal/Network/DpcDxe/DpcDxe.inf
  MdeModulePkg/Universal/Network/MnpDxe/MnpDxe.inf
  MdeModulePkg/Universal/Network/VlanConfigDxe/VlanConfigDxe.inf
  MdeModulePkg/Universal/Network/ArpDxe/ArpDxe.inf
  MdeModulePkg/Universal/Network/Dhcp4Dxe/Dhcp4Dxe.inf
  MdeModulePkg/Universal/Network/Ip4Dxe/Ip4Dxe.inf
  MdeModulePkg/Universal/Network/Mtftp4Dxe/Mtftp4Dxe.inf
  MdeModulePkg/Universal/Network/Udp4Dxe/Udp4Dxe.inf
!if $(NETWORK_IP6_ENABLE) == TRUE
  NetworkPkg/Ip6Dxe/Ip6Dxe.inf
  NetworkPkg/TcpDxe/TcpDxe.inf
  NetworkPkg/Udp6Dxe/Udp6Dxe.inf
  NetworkPkg/Dhcp6Dxe/Dhcp6Dxe.inf
  NetworkPkg/Mtftp6Dxe/Mtftp6Dxe.inf
  NetworkPkg/UefiPxeBcDxe/UefiPxeBcDxe.inf
!if $(SECURE_BOOT_ENABLE) == TRUE
  NetworkPkg/IScsiDxe/IScsiDxe.inf
!else
  MdeModulePkg/Universal/Network/IScsiDxe/IScsiDxe.inf
!endif
!else
  MdeModulePkg/Universal/Network/Tcp4Dxe/Tcp4Dxe.inf
  MdeModulePkg/Universal/Network/UefiPxeBcDxe/UefiPxeBcDxe.inf
  MdeModulePkg/Universal/Network/IScsiDxe/IScsiDxe.inf
!endif

  #
  # Secure Boot Support (Compile when with this option enabled)
  #

  !if $(SECURE_BOOT_ENABLE) == TRUE
    MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.inf {
      <LibraryClasses>
        NULL|SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.inf
    }
    SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConfigDxe.inf
  !else
    MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.inf
  !endif

  #
  # Logo for the Vendor
  #
  FirmwarePkg/Drivers/LogoDxe/LogoDxe.inf

  #
  # Modifications for OS Connect
  #
  # FirmwarePkg/Applications/BootEntryApp/BootEntryApp.inf
  # FirmwarePkg/Applications/RecoveryBootApp/RecoveryBootApp.inf

  #
  # Filesystem Drivers for OS Connect
  #
  # FirmwarePkg/Drivers/BtrfsDxe/BtrfsDxe.inf
  # FirmwarePkg/Drivers/HfsPlusDxe/HfsPlusDxe.inf
  # FirmwarePkg/Drivers/SquashfsDxe/SquashfsDxe.inf
  # FirmwarePkg/Drivers/UfsDxe/UfsDxe.inf


  #
  # Ui App
  #
  MdeModulePkg/Application/UiApp/UiApp.inf {
    <LibraryClasses>
      NULL|MdeModulePkg/Library/DeviceManagerUiLib/DeviceManagerUiLib.inf
      NULL|MdeModulePkg/Library/BootManagerUiLib/BootManagerUiLib.inf
      NULL|MdeModulePkg/Library/BootMaintenanceManagerUiLib/BootMaintenanceManagerUiLib.inf
  }

[Components.ARM]
  #
  # SEC
  #
  FirmwarePkg/Boards/RaspberryPi2/Arm/Sec/Sec.inf {
    <LibraryClasses>
      # Since the 2836 doesn't have an ARM GIC we use the BCM "stub" library instead to provide only
      # enough functionality to be able to get the platform started and support multi-processor through
      # the MP Parking Protocol. The BCM interrupt controller has no secure/none-secure knowledge.
      # Real interrupts for EFI are supported on the BCM part in the Interrupt DXE implementation.
      ArmGicLib|FirmwarePkg/Boards/RaspberryPi2/Library/BcmGicLib/BcmGicLib.inf

      # This is included so that the default configuration can be set based on the hardware settings.
      PL011UartLib|ArmPlatformPkg/Drivers/PL011Uart/PL011Uart.inf
  }

  #
  # PEI
  #
  # The Multi-Processor implementation is used that supports the Parking Protcol as required
  # by Windows.
  #
  FirmwarePkg/Boards/RaspberryPi2/Arm/PrePi/PeiMPCoreMPPP.inf {
    <LibraryClasses>
      # Use the implementation which has the none-secure bits.
      ArmLib|ArmPkg/Library/ArmLib/ArmBaseLib.inf

      # Since the 2836 doesn't have an ARM GIC we use the BCM "stub" library instead to provide only
      # enough functionality to be able to get the platform started and support multi-processor through
      # the MP Parking Protocol. The BCM interrupt controller has no secure/none-secure knowledge.
      # Real interrupts for EFI are supported on the BCM part in the Interrupt DXE implementation.
      ArmGicLib|FirmwarePkg/Boards/RaspberryPi2/Library/BcmGicLib/BcmGicLib.inf
  }

  #
  # DXE
  #
  MdeModulePkg/Core/Dxe/DxeMain.inf {
    <LibraryClasses>
      PcdLib|FirmwarePkg/Boards/RaspberryPi2/Library/PcdConfigLib/PcdConfigLib.inf
      NULL|MdeModulePkg/Library/DxeCrc32GuidedSectionExtractLib/DxeCrc32GuidedSectionExtractLib.inf
      NULL|EmbeddedPkg/Library/LzmaHobCustomDecompressLib/LzmaHobCustomDecompressLib.inf
  }

  ArmPkg/Drivers/CpuDxe/CpuDxe.inf

  #
  # Semi-hosting filesystem
  #
  ArmPkg/Filesystem/SemihostFs/SemihostFs.inf

  #
  # MMC/SD
  #
  FirmwarePkg/Boards/RaspberryPi2/Drivers/MmcDxe/MmcDxe.inf
  FirmwarePkg/Boards/RaspberryPi2/Drivers/SdHostDxe/SdHostDxe.inf

  #
  # ARM GIC+GIT Drivers
  #
  # NOTE: The BCM2836 does not include an ARM GIC so we must use
  #       a device specific driver for interrupts.
  #
  # IN GENERAL IT IS MANDATORY THAT DEVICES USE THE ARM GIC FOR INTERRUPTS
  # AND THE ARM GIT FOR TIMERS FOR WINDOWS SUPPORT.
  #
  FirmwarePkg/Boards/RaspberryPi2/Drivers/InterruptDxe/InterruptDxe.inf
  ArmPkg/Drivers/TimerDxe/TimerDxe.inf

  #
  # Display Support
  #
  FirmwarePkg/Boards/RaspberryPi2/Drivers/DisplayDxe/DisplayDxe.inf

  #
  # ACPI Support
  #
  FirmwarePkg/Boards/RaspberryPi2/AcpiTables/AcpiTables.inf

  #
  # SMBIOS Support
  #
  FirmwarePkg/Boards/RaspberryPi2/Drivers/PlatformSmbiosDxe/PlatformSmbiosDxe.inf
