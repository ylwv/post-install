#!/usr/bin/env bash

set -e

pkgs=(
    7zip
    base-devel
    bash-completion
    brightnessctl
    btop
    dbus-glib
    dunst
    engrampa
    fd
    ffmpeg
    foot
    fzf
    gammastep
    gnome-disk-utility
    gnome-keyring
    gnome-themes-extra
    gparted
    grim
    gvfs
    i3status
    keepassxc
    kid3-qt
    micro
    mpv
    neovim
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    nsxiv
    nvidia-open
    nwg-look
    pulsemixer
    qbittorrent
    ristretto
    shellcheck
    slurp
    sway
    swaybg
    swaylock
    thunar
    thunar-archive-plugin
    thunar-volman
    unrar
    wl-clipboard
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    xdg-user-dirs
    xorg-xwayland
    yt-dlp
    zathura-pdf-mupdf
)

pkgs_aur=(
    brave-bin
    jmtpfs
    mp3val
    nwg-displays
)

# pkg installation
    sudo sed -i 's/#Color/Color/' /etc/pacman.conf
    sudo pacman --needed --noconfirm -Syu "${pkgs[@]}"

    git clone https://aur.archlinux.org/yay.git
        (cd yay && makepkg --noconfirm -si)
    yay --needed --noconfirm -Syu "${pkgs_aur[@]}"

# dotfiles
    cp -r home_dir/. ~
    chmod +x ~/bin/*

# config (auto)
    printf 'kernel.unprivileged_userns_clone=1\n' | sudo tee /etc/sysctl.d/00-local-userns.conf

# config (manual)
    sudo micro /etc/xdg/user-dirs.defaults
    xdg-user-dirs-update
