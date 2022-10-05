add --no-cache ffmpeg imagemagick supervisor py3-numpy py3-pillow py3-asn1crypto
apk add --no-cache py3-cffi py3-scipy py3-pynacl py3-cryptography py3-pip

apt update
apt install -y python3
python3 -m pip install -U pip
python3 -m pip install pillow_heif
arch=$(arch | sed s/x86_64/amd64/) && python3 -m pip install pywavelets

add --no-cache ffmpeg imagemagick supervisor py3-numpy py3-pillow py3-asn1crypto
apt install -y libmagickcore-6.q16-6-extra ffmpeg
/entrypoint.sh apache2-foreground