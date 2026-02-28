# theledora-nvidia-open

Theledora is a customized Fedora Atomic Desktop bootc image based on [bazzite-nvidia-open:stable](https://github.com/ublue-os/bazzite/pkgs/container/bazzite-nvidia-open). It exists so that I can preinstall things from the Fedora package repositories which cannot be installed via flatpak, or which I found work better from the package repository. This avoids having to layer the packages using rpm-ostree, which is prone to breaking with package conflicts. Installing some of those packages also avoids me having to use containers for most of the stuff that I do (not everything, but that's OK).

This image comes with the NVIDIA Open GPU kernel modules. It is suitable for systems which have NVIDIA GeForce 1600 series or later GPUs. I have no idea about AMD GPUs because I don't use them. I suspect it would probably still work fine.

## Using the image

Install Bazzite Desktop NVIDIA Edition from https://download.bazzite.gg/bazzite-nvidia-open-stable-live-amd64.iso

After installing, do `sudo bootc switch --enforce-container-sigpolicy ghcr.io/theleruby/theledora-nvidia-open:latest` and then reboot.

## Documentation

Bazzite Documentation: https://docs.bazzite.gg/

Fedora Atomic Desktops User Guide: https://docs.fedoraproject.org/en-US/atomic-desktops/

I also made a wiki to document various Linux stuff which might be useful: https://pengwings.theleruby.com/

## Legal notice and disclaimer

This is an experimental image which was created for my sole personal use only. I don't intend for anyone to use this except me.

## Making your own image

Take a look at https://github.com/ublue-os/image-template for instructions.
