#!/bin/bash

apt-get update
apt-get install sudo gpg

echo 'deb http://download.opensuse.org/repositories/graphics:/darktable/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/graphics:darktable.list
curl -fsSL https://download.opensuse.org/repositories/graphics:darktable/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/graphics_darktable.gpg > /dev/null

apt-get update
apt-get install darktable