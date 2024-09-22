Kiosk installer for Debian based Linux distros
Small installer script to setup a minimal kiosk with Chromium for Debian based Linux distros. This installer is heavily based on the excellent instructions by user [josfaber](https://github.com/josfaber/debian-kiosk-installer/tree/master).

Usage
Setup a minimal Debian without display manager, e.g. Kali netboot cd i386 / amd64

Login as root or with root permissions

Download this installer, make it executable and run it

```
wget https://raw.githubusercontent.com/dkedinger/ha-kiosk-installer/master/kiosk-installer.sh; sudo chmod +x kiosk-installer.sh; sudo ./kiosk-installer.sh
```

If you want to setup this Kiosk as a Wyoming Voice Satellite, download this installer, make it executable and run it

```
wget https://raw.githubusercontent.com/dkedinger/ha-kiosk-installer/master/kiosk-installer-wyoming-satellite.sh; sudo chmod +x kiosk-installer-wyoming-satellite.sh; sudo ./kiosk-installer-wyoming-satellite.sh
```
