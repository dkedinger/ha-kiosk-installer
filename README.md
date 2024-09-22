# Kiosk installer for Raspberry PI
Small installer script to setup a minimal kiosk with Chromium Browser for Raspberry PI. This installer is heavily based on the excellent instructions by user [josfaber](https://github.com/josfaber/debian-kiosk-installer/tree/master).

## Usage
1. Setup a Raspberry Pi with Lite (32bit) using Imager. Configure settings to have Wifi and SSH enabled.

2. Download this installer, make it executable and run it

```
wget https://raw.githubusercontent.com/dkedinger/ha-kiosk-installer/master/kiosk-installer.sh; sudo chmod +x kiosk-installer.sh; sudo ./kiosk-installer.sh
```
