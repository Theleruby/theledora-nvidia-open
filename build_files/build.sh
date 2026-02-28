#!/bin/bash

set -ouex pipefail

# make sure all the fedora repo definitions are installed as bazzite doesn't include these
dnf5 install -y fedora-workstation-repositories

# make sure rpmfusion is enabled
dnf5 config-manager setopt rpmfusion-free.enabled=1
dnf5 config-manager setopt rpmfusion-free-updates.enabled=1
dnf5 config-manager setopt rpmfusion-nonfree.enabled=1
dnf5 config-manager setopt rpmfusion-nonfree-updates.enabled=1

# htop
dnf5 install -y htop

# easyeffects
dnf5 install -y easyeffects

# python
dnf5 install -y python3-devel

# java
dnf5 install -y java-21-openjdk-devel.x86_64 java-25-openjdk-devel.x86_64

# chrome
dnf5 config-manager setopt google-chrome.enabled=1
#dnf5 install -y google-chrome-stable

# docker
dnf5 config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
#dnf5 install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# .net
dnf5 install -y dotnet-sdk-8.0 dotnet-runtime-8.0
dnf5 install -y dotnet-sdk-10.0 dotnet-runtime-10.0

# node.js
dnf5 install -y nodejs

# mercurial
dnf5 install -y mercurial tortoisehg python3-dulwich

# mysql
dnf5 install -y mariadb-devel

# imagemagick
dnf5 install -y ImageMagick-devel

# fluidsynth
dnf5 install -y fluidsynth

# vlc
dnf5 install -y vlc vlc-plugin-fluidsynth vlc-plugin-kde

# yt-dlp
dnf5 install -y yt-dlp

# zerotier
dnf5 install -y zerotier-one

# libreoffice
dnf5 install -y libreoffice

# discord
dnf5 install -y discord
