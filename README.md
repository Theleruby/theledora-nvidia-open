# theledora-nvidia-open

Theledora is a customized version of Fedora Atomic Desktop 43. It is based on Bazzite, a fork of Fedora Kinoite tailored towards gamers.

The purpose of Theledora is to allow me to preinstall things from the Fedora package repositories which cannot be installed via flatpak, or which I found work better from the package repository. This avoids having to layer the packages using rpm-ostree, which is prone to breaking with package conflicts. Installing some of those packages also avoids me having to use containers for most of the stuff that I do (not everything, but that's OK).

## Available images

| Variant | Purpose | Compatible GPU | Desktop environment | Gamescope session |
|--|--|--|--|--|
| [theledora-nvidia-open](https://github.com/Theleruby/theledora-nvidia-open) | Desktop PC | NVIDIA GPU<br/>(1600 series or later) | KDE Plasma | No |
| [theledora-gamescope](https://github.com/Theleruby/theledora-gamescope) | Handheld or HTPC | AMD GPU<br/>(RX 400 series or later) | KDE Plasma | Yes |

## About this image

This image (**theledora-nvidia-open**) is based on [bazzite-nvidia-open:stable-43](https://github.com/ublue-os/bazzite/pkgs/container/bazzite-nvidia-open). It comes with the NVIDIA Open GPU kernel modules, and is intended for desktop computers which have NVIDIA GeForce 1600 series or later GPUs. I tested it with my 4070 Ti SUPER and the drivers are mostly stable, with only some very minor issues. The performance in most games seems to be roughly comparable with Windows 11.

AMD GPUs are untested, as I don't have any desktop PCs which have an AMD GPU installed, but I suspect it would probably still work fine.

This image boots directly into a KDE Plasma desktop session. The gamescope session (Steam Gaming Mode) is not included.

## Legal notice and disclaimer

This is an experimental image which was created for my sole personal use only. I don't intend for anyone to use this except me, and I don't provide any support.

I don't consider Theledora to be its own operating system or distro - apart from the extra preinstalled packages, this bootc image is literally just of Bazzite. The customization of this image is similar to using NTLite to modify a Windows install.wim file, and was done solely to make my Atomic Desktop journey easier, being made necessary because of the particular way in which the Fedora Atomic Desktop works. All queries and legal notices which are not directly related to the customizations made to this image should therefore be directed towards Universal Blue, the Fedora Project and/or Red Hat (whichever is appropriate).

## Using the image

Install Bazzite Desktop NVIDIA Edition from https://download.bazzite.gg/bazzite-nvidia-open-stable-live-amd64.iso

After installing, do `sudo bootc switch --enforce-container-sigpolicy ghcr.io/theleruby/theledora-nvidia-open:latest` and then reboot.

## Documentation

Bazzite Documentation: https://docs.bazzite.gg/

Fedora Atomic Desktops User Guide: https://docs.fedoraproject.org/en-US/atomic-desktops/

I also made a wiki to document various Linux stuff which might be useful: https://pengwings.theleruby.com/

## Making your own image

Take a look at https://github.com/ublue-os/image-template for instructions.
