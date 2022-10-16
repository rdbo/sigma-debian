#!/bin/sh

lb config \
    --apt-options '--yes -o Dpkg::Options::="--force-overwrite"' \
    --apt-recommends true \
    --architecture amd64 \
    --archive-areas "main contrib non-free" \
    --bootloaders "grub-pc grub-efi" \
    --binary-image iso-hybrid \
    --cache true \
    --cache-packages true \
    --checksums sha256 \
    --debian-installer cdrom \
    --debian-installer-distribution daily \
    --debian-installer-gui false \
    --distribution sid \
    --firmware-binary true \
    --hdd-label "sigma-linux" \
    --image-name "sigma-linux" \
    --iso-application "Sigma Linux" \
    --iso-publisher "Rdbo" \
    --iso-volume "Sigma Linux" \
    --bootappend-install "net.ifnames=0"

mkdir -p config/includes.chroot/usr/local/src
tar -cJf config/includes.chroot/usr/local/src/live-build.tar.xz config/ setup.sh build.sh clean.sh

