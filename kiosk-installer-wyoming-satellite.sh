#!/bin/bash

# be new
apt-get update

# get software
apt-get install \
	unclutter \
    xorg \
    chromium-browser \
    openbox \
    lightdm \
    locales \
    git \
    python3-venv \
    -y

# dir
mkdir -p /home/pi/.config/openbox

# remove virtual consoles
if [ -e "/etc/X11/xorg.conf" ]; then
  mv /etc/X11/xorg.conf /etc/X11/xorg.conf.backup
fi
cat > /etc/X11/xorg.conf << EOF
Section "ServerFlags"
    Option "DontVTSwitch" "true"
EndSection
EOF

# create config
if [ -e "/etc/lightdm/lightdm.conf" ]; then
  mv /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.backup
fi
cat > /etc/lightdm/lightdm.conf << EOF
[SeatDefaults]
autologin-user=pi
user-session=openbox
EOF

# create autostart
if [ -e "/home/pi/.config/openbox/autostart" ]; then
  mv /home/pi/.config/openbox/autostart /home/pi/.config/openbox/autostart.backup
fi
cat > /home/pi/.config/openbox/autostart << EOF
#!/bin/bash

unclutter -idle 0.1 -grab -root &

while :
do
  xrandr --auto
  chromium-browser \
    --no-first-run \
    --start-maximized \
    --disable \
    --disable-translate \
    --disable-infobars \
    --disable-suggestions-service \
    --disable-session-crashed-bubble \
    --kiosk "https://kedinger.com/work-kiosk"
  sleep 5
done &
EOF

# setup respeaker drivers
git clone https://github.com/HinTak/seeed-voicecard
cd seeed-voicecard
sudo ./install.sh

echo "Done! Rebooting now..."
sudo reboot