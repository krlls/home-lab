apt update
apt install -y python3
apt install -y python3-pip
pip3 install numpy pillow scipy pywavelets pillow_heif cryptography pynacl hexhamming pywavelets

python3 -m pip install -U pip
arch=$(arch | sed s/x86_64/amd64/) && python3 -m pip install pywavelets

echo '=======  === = =  = = = ========= ===================== = = = = = = = = === = = ======='

add --no-cache ffmpeg imagemagick supervisor py3-numpy py3-pillow py3-asn1crypto
apt install -y libmagickcore-6.q16-6-extra ffmpeg
/entrypoint.sh apache2-foreground