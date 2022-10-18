#!/bin/sh

# NOTE:
# Build 'sigma-deb' first and copy the .deb package from
# sigma-deb/bin/sigma-linux*.deb to sigma-config/packages.chroot/

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
    --debian-installer-distribution ${DIST:=testing} \
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

mkdir -p config/includes.chroot/usr/local/src/live-build
tar -cJf config/includes.chroot/usr/local/src/live-build/live-build.tar.xz sigma-config/ setup.sh build.sh clean.sh full_clean.sh
cp -rf sigma-config/. config/
