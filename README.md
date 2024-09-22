Kiosk installer for Debian based Linux distros
Small installer script to setup a minimal kiosk with Chromium for Debian based Linux distros. This installer is heavily based on the excellent instructions by user [josfaber](https://github.com/josfaber/debian-kiosk-installer/tree/master).

Usage
Setup a minimal Debian without display manager, e.g. Kali netboot cd i386 / amd64

Login as root or with root permissions

Download this installer, make it executable and run it

```
wget https://raw.githubusercontent.com/dkedinger/ha-kiosk-installer/master/kiosk-installer.sh; chmod +x kiosk-installer.sh; ./kiosk-installer.sh
```

If you are installing to a Raspberry Pi, change chromium to chromium-browser in the install script (both in apt line and startup command)

https://raw.githubusercontent.com/dkedinger/ha-kiosk-installer/main/kiosk-installer.sh
