#!/bin/bash

# be new
apt-get update

# get software
sudo apt-get install --no-install-recommends  \
  git \
  python3-venv \
  -y

# download wyoming satellite files
git clone https://github.com/rhasspy/wyoming-satellite.git
cd wyoming-satellite/
python3 -m venv .venv
.venv/bin/pip3 install --upgrade pip
.venv/bin/pip3 install --upgrade wheel setuptools
.venv/bin/pip3 install \
  -f 'https://synesthesiam.github.io/prebuilt-apps/' \
  -r requirements.txt \
  -r requirements_audio_enhancement.txt \
  -r requirements_vad.txt

echo "Done!"