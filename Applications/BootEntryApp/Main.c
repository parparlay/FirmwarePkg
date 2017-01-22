#include "main.h"
#include <Version.h>

EFI_STATUS efi_main(EFI_HANDLE ImageHandle,
                    EFI_SYSTEM_TABLE *SystemTable)
{
        EFI_STATUS Status;

        InitializeLib(ImageHandle, Systab);
}
