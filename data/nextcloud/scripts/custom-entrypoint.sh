apt-get update

# For Media DC
#apt install -y python3
#apt install -y python3-pip
#pip3 install numpy pillow scipy pywavelets pillow_heif cryptography pynacl hexhamming pywavelets

# For fix warnings
apt-get install -y libmagickcore-6.q16-6-extra ffmpeg

/entrypoint.sh apache2-foreground