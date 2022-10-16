#!/bin/sh

# NOTE:
# Build 'sigma-deb' first and copy the .deb package from
# sigma-deb/bin/sigma-linux*.deb to config/packages.chroot/

mkdir -p config/includes.chroot/usr/local/src/live-build
tar -cJf live-build.tar.xz config/ setup.sh build.sh clean.sh
mv live-build.tar.xz config/includes.chroot/usr/local/src/live-build/

lb config \
    --apt-options '--yes -o Dpkg::Options::="--force-overwrite"' \
    --apt-recommends true \
    --architecture "${ARCH:=amd64}" \
    --archive-areas "main contrib non-free" \
    --bootloaders "grub-pc grub-efi" \
    --binary-image iso-hybrid \
    --cache true \
    --cache-packages true \
    --checksums sha256 \
    --debian-installer live \
    --debian-installer-distribution daily \
    --debian-installer-gui false \
    --distribution "${DIST:=testing}" \
    --firmware-binary true \
    --firmware-chroot true \
    --hdd-label "sigma-linux" \
    --image-name "sigma-linux" \
    --iso-application "Sigma Linux" \
    --iso-publisher "Rdbo" \
    --iso-volume "Sigma Linux" \
    --bootappend-install "net.ifnames=0 biosdevname=0"
