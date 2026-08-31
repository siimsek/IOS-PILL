# IOS-PILL

[![Module](https://img.shields.io/badge/module-Magisk-00AEEF?logo=magisk&logoColor=white)](https://github.com/topjohnwu/Magisk)
[![Platform](https://img.shields.io/badge/platform-AOSP-3DDC84?logo=android&logoColor=white)](https://source.android.com/)
[![Language](https://img.shields.io/badge/language-Shell-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue.svg)](LICENSE)

A Magisk module that changes the stock AOSP gesture-navigation pill to an iOS-inspired visual style.

> [!IMPORTANT]
> This is a system UI customization for rooted devices. Android versions, OEM changes, ROM overlays, and SystemUI implementations can affect compatibility. Test on a non-critical device and keep a recovery path available.

## Preview

| Before | After |
| --- | --- |
| ![Stock AOSP navigation pill](before.png) | ![iOS-inspired navigation pill](after.png) |

## Why this project?

AOSP-based ROMs expose a simple gesture-navigation indicator. IOS-PILL offers an alternative visual treatment through a flashable Magisk module, without requiring a permanent modification to the system partition.

## Features

- iOS-inspired visual styling for the AOSP gesture-navigation pill.
- Flashable Magisk module package.
- Includes the module's compiled pill asset.
- Systemless installation through Magisk.
- Simple removal through the Magisk app.
- No persistent user configuration or background service.

## Requirements

- A rooted Android device running Magisk **v20.4 or later**. The bundled installer enforces this minimum version.
- An AOSP-based ROM with gesture navigation enabled.
- A working Magisk installation and a tested recovery method.
- A backup before changing SystemUI-related resources.

## Compatibility

The repository identifies the module as an AOSP style customization, but it does not declare a tested device, Android-version, or OEM compatibility matrix.

It may not work as intended on heavily modified SystemUI implementations, vendor ROMs, or ROMs that apply competing navigation-bar overlays. If the module changes nothing or causes UI issues, remove it from Magisk and reboot.

## Installation

### Install a release package

1. Download the module ZIP from the [Releases page](https://github.com/siimsek/IOS-PILL/releases), if a release is available.
2. Open the Magisk app.
3. Go to **Modules** → **Install from storage**.
4. Select the ZIP and allow the installation to finish.
5. Reboot the device.

### Build the ZIP from source

```sh
git clone https://github.com/siimsek/IOS-PILL.git
cd IOS-PILL
zip -r9 ../IOS-PILL.zip . -x '.git/*' '.github/*'
```

Install the resulting `IOS-PILL.zip` through Magisk, then reboot.

## Uninstall and recovery

### Normal uninstall

1. Open the Magisk app.
2. Disable or remove **IOS Pill** from the module list.
3. Reboot.

### If the device cannot complete boot

Boot into a compatible recovery environment and remove the module directory:

```text
/data/adb/modules/iospill
```

Then reboot the device. The module identifier is defined in `module.prop`.

## Project structure

```text
IOS-PILL/
├── META-INF/
│   └── com/google/android/
│       ├── update-binary          # Magisk installer entry point
│       └── updater-script         # Marks the ZIP as a Magisk module
├── Pill/
│   └── pill.apk                   # Compiled pill/overlay asset
├── common/
│   └── functions.sh               # Module-template helper functions
├── customize.sh                   # Installation configuration
├── module.prop                    # Module metadata
├── uninstall.sh                   # Template cleanup routine
├── before.png                     # Stock appearance preview
├── after.png                      # Module appearance preview
├── LICENSE                         # GNU GPL v3.0
└── README.md
```

## Development notes

- `module.prop` defines the installable module ID as `iospill`.
- `customize.sh` is based on the Magisk Module Template and currently contains no device-specific install logic.
- The compiled asset is stored in `Pill/pill.apk`.
- Keep module packaging paths intact when creating a ZIP; Magisk installers depend on the `META-INF`, `module.prop`, and module asset layout.

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE).

## Disclaimer

Use this module at your own risk. The maintainers are not responsible for boot loops, SystemUI crashes, loss of navigation controls, or other device-side issues.
