#!/bin/sh

# NOTE:
# Build 'sigma-deb' first and copy the .deb package from
# sigma-deb/bin/sigma-linux*.deb to sigma-config/packages.chroot/

ARCH=amd64
DIST=bookworm

lb config \
    --apt-options '--yes -o Dpkg::Options::="--force-overwrite"' \
    --apt-recommends true \
    --architecture "$ARCH" \
    --archive-areas "main contrib non-free" \
    --binary-image iso-hybrid \
    --bootappend-install "net.ifnames=0 biosdevname=0" \
    --bootloaders "grub-pc grub-efi" \
    --cache true \
    --cache-packages true \
    --clean \
    --checksums sha256 \
    --debian-installer live \
    --debian-installer-distribution "$DIST" \
    --debian-installer-gui false \
    --distribution "$DIST" \
    --firmware-binary true \
    --firmware-chroot true \
    --hdd-label "sigma-linux" \
    --image-name "sigma-linux" \
    --iso-application "Sigma Linux" \
    --iso-publisher "Rdbo" \
    --iso-volume "Sigma Linux" \
    --linux-packages "linux-image linux-headers"

echo "Archiving source code..."
mkdir -p config/includes.chroot/usr/local/src/live-build
tar -cJf config/includes.chroot/usr/local/src/live-build/live-build.tar.xz sigma-config/ setup.sh build.sh clean.sh full_clean.sh
echo "Copying 'sigma-config' to 'config'..."
cp -rf sigma-config/. config/
