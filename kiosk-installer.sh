#!/bin/bash

# be new
sudo apt clean
sudo apt autoremove -y
sudo apt update
sudo apt upgrade

# get software
sudo apt install
sudo apt-get install --no-install-recommends \
  chromium-browser \
  xdotool \
  unclutter \
  sed \
  fonts-noto-color-emoji \
  -y

# create kiosk startup script
sudo cat > /home/pi/kiosk.sh << EOF
#!/bin/bash

xset -dpms     # disable DPMS (Energy Star) features.
xset s off     # disable screen saver
xset s noblank # don't blank the video device

unclutter -idle 0.5 -root &    # hide X mouse cursor unless mouse activated

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/$USER/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/$USER/.config/chromium/Default/Preferences

/usr/bin/chromium-browser \
  --noerrdialogs \
  --disable-infobars \
  --kiosk https://kedinger.com/work-kiosk &

while true; do
   xdotool keydown ctrl+r; xdotool keyup ctrl+r;
   sleep 5
done
EOF

# make executable
chmod u+x ~/kiosk.sh

# create kiosk service
sudo cat > /lib/systemd/system/kiosk.service << EOF
[Unit]
Description=Chromium Kiosk
Wants=graphical.target
After=graphical.target

[Service]
Environment=DISPLAY=:0.0
Environment=XAUTHORITY=/home/pi/.Xauthority
Type=simple
ExecStart=/bin/bash /home/pi/kiosk.sh
Restart=on-abort
User=pi
Group=pi

[Install]
WantedBy=graphical.target
EOF

sudo systemctl enable kiosk.service

echo "Done! Rebooting now..."

sudo reboot