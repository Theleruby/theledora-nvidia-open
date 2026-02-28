#!/bin/bash

set -ouex pipefail

# make sure /var/opt directory exists so we can install stuff into it
mkdir -p /var/opt

# make sure all the fedora repo definitions are installed as bazzite doesn't include these
dnf5 install -y fedora-workstation-repositories

# make sure rpmfusion is enabled
dnf5 config-manager setopt rpmfusion-free.enabled=1
dnf5 config-manager setopt rpmfusion-free-updates.enabled=1
dnf5 config-manager setopt rpmfusion-nonfree.enabled=1
dnf5 config-manager setopt rpmfusion-nonfree-updates.enabled=1

# htop
dnf5 install -y htop

# dependencies for some stuff
dnf5 install -y kdsingleapplication-qt6

# easyeffects
dnf5 install -y easyeffects calf lv2 lv2-calf-plugins lv2-mdala-plugins lv2-zam-plugins lsp-plugins-lv2

# python
dnf5 install -y python3-devel

# java
dnf5 install -y java-21-openjdk-devel.x86_64 java-25-openjdk-devel.x86_64

# chrome
dnf5 config-manager setopt google-chrome.enabled=1
dnf5 install -y google-chrome-stable

# docker
dnf5 config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
dnf5 install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

# .net
dnf5 install -y dotnet-sdk-8.0 dotnet-runtime-8.0
dnf5 install -y dotnet-sdk-10.0 dotnet-runtime-10.0

# node.js
dnf5 install -y nodejs24 nodejs24-npm

# mercurial
dnf5 install -y mercurial tortoisehg python3-dulwich

# mysql
dnf5 install -y mariadb-devel mariadb-connector-c-doc

# imagemagick
dnf5 install -y ImageMagick-devel

# fluidsynth
dnf5 install -y fluidsynth fluid-soundfont-common fluid-soundfont-gm

# vlc
dnf5 install -y vlc vlc-plugin-ffmpeg vlc-plugin-fluidsynth vlc-plugin-kde vlc-plugin-visualization vlc-plugin-notify

# yt-dlp
dnf5 install -y yt-dlp

# zerotier
dnf5 install -y zerotier-one

# libreoffice
dnf5 install -y libreoffice libreoffice-kf6 libreoffice-help-en

# discord
dnf5 install -y discord

# audacity
dnf5 install -y audacity-freeworld

# krusader
dnf5 install -y krusader

# move stuff in /var/opt to /usr/lib/opt and add symlink to tmpfiles conf
# taken from https://github.com/astrovm/amyos/blob/main/build_files/fix-opt.sh, thanks <3
for dir in /var/opt/*/; do
  [ -d "$dir" ] || continue
  dirname=$(basename "$dir")
  mv "$dir" "/usr/lib/opt/$dirname"
  echo "L+ /var/opt/$dirname - - - - /usr/lib/opt/$dirname" >>/usr/lib/tmpfiles.d/move-opt-files.conf
done

# enable docker
systemctl enable docker.service containerd.service

dnf5 clean all
