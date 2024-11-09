{ pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # CLI utils
    lshw
    neofetch
    fastfetch
    file
    tree
    wget
    git
    ffmpeg
    zip
    unzip
    yt-dlp
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    findutils
    cron
    rsync
    htop
    btop
    iotop
    lsof
    xclip # used by zsh-system-clipboard.
    xz
    strace

    # Command Line
    cowsay
    killall
    libnotify
    timer
    gnugrep
    bat # cat clone.
    eza # ls clone.
    fd # A simple, fast and user-friendly alternative to find.
    bottom # A cross-platform graphical process/system monitor with a customizable interface. usage ?> btm
    ripgrep # grep clone.
    w3m # A text-mode web browser.
    hwinfo # Hardware detection tool.
    pciutils # A collection of programs for inspecting and manipulating configuration of PCI devices.
    numbat # High precision scientific calculator with full support for physical units.
    nvtopPackages.full
    bat-extras.batman
    profile-sync-daemon
    smartmontools
    pv
    lm_sensors
    curl
    fnm # Fast and simple Node.js version manager
    toybox # Lightweight implementation of some Unix command line utilities
    busybox # Tiny versions of common UNIX utilities in a single small executable
    e2fsprogs # Tools for creating and checking ext2/ext3/ext4 filesystems
    pciutils # A collection of programs for inspecting and manipulating configuration of PCI devices
    fuse

    # ntfs
    ntfs3g

    # docker
    docker
    docker-compose
    nvidia-container-toolkit

    # nix utils
    nix-index # A files database for nixpkgs.
    nixd
    nixfmt-rfc-style
    home-manager

    # power managment
    acpi
    powertop

    # build-essential
    gcc
    libgcc
    gnumake
    cmake
    autoconf
    automake
    libtool
    libiconv
    hexdump
    bitwise
    man-pages
    valgrind # c memory analyzer
    gdb
    pkg-config
    grub2
    musl
    clang-tools
    zls
    zig
    file
    libxcrypt
    lld
    llvm
    libllvm
    clang
    rustc
    cargo
    rustup
    rust-analyzer
    

    # Official Linux Bluetooth protocol stac
    #  bluez
    #  bluez-tools

    # Media
    mediainfo
    mpv # media player
    vlc
    spotify

    # browser
    chromium
    brave
    google-chrome
    sniffnet
    telegram-desktop
    discord
    gparted
    obsidian
    vscode

    # Development.
    nodejs
    nodePackages.pnpm
    nodePackages.yarn
    nest-cli
    nodePackages.typescript-language-server
    vscode-langservers-extracted
    nodePackages.prisma
    nodePackages.prettier
    nodePackages.jshint
    jq # A lightweight and flexible command-line JSON processor

    # Xorg stuff
    #xterm
    #xclip
    #xorg.xbacklight

    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist

    # required for GNOME Shell Extensions
    bison
    flex
    fontforge
    makeWrapper
    pkg-config

    gnome.geary
    # gnomeExtensions
    gnome.gnome-tweaks

    gnomeExtensions.blur-my-shell
    gnomeExtensions.vitals
    gnomeExtensions.cpufreq
    gnomeExtensions.status-area-horizontal-spacing
    gnomeExtensions.clipboard-indicator

    # others
    gnupg
  ];

}
