#! /bin/bash

pkgname=zy-player-appimage
pkgver=2.8.8
_pkgver=$(echo $pkgver | sed 's/\./-/3')
pkgrel=3
pkgdesc="跨平台视频资源播放器, 简洁免费无广告"

_filename=ZY-Player-${_pkgver}.AppImage

wget https://github.com/electron/electron/releases/download/v13.6.9/electron-v13.6.9-linux-x64.zip
dir_electron13=/opt/electron13
if [ ! -d $dir_electron13 ]; then
    sudo mkdir -p $dir_electron13
    sudo unzip electron-v13.6.9-linux-x64.zip -d $dir_electron13
    sudo ln -s $dir_electron13/electron /usr/local/bin/electron13
fi

wget https://github.com/Hunlongyu/ZY-Player/releases/download/v$pkgver/$_filename
chmod +x ${_filename}
./${_filename} --appimage-extract &>/dev/null

sudo install -Dm755 "zy-player" "/usr/bin/zy-player"
sudo install -Dm644 "zy-player.desktop" "/usr/share/applications/zy-player.desktop"
sudo install -Dm644 "squashfs-root/zy.png" "/usr/share/icons/zy-player.png"
sudo install -Dm644 "squashfs-root/resources/app.asar" "/usr/share/zy-player/zy-player.asar"
