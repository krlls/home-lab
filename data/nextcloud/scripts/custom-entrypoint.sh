apt update
apt install -y python3
apt install -y numpy pillow scipy pywavelets pillow_heif cryptography pynaclNot hexhammingNot

echo '=======  === = =  = = = ========= ===================== = = = = = = = = === = = ======='

python3 -m pip install -U pip
python3 -m pip install pillow_heif
arch=$(arch | sed s/x86_64/amd64/) && python3 -m pip install pywavelets

add --no-cache ffmpeg imagemagick supervisor py3-numpy py3-pillow py3-asn1crypto
apt install -y libmagickcore-6.q16-6-extra ffmpeg
/entrypoint.sh apache2-foreground