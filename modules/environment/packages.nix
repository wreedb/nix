{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        # desktop utils
        hyprlock libnotify

        # shell utils
        bash fish zsh gash dash
        starship zoxide
        any-nix-shell

        # general utils
        xdg-utils xdg-user-dirs
        brightnessctl wl-clipboard
        grim slurp imv bemenu tofi fuzzel
        mupdf font-manager dex dunst
        pwvucontrol micro

        # terminal emulators
        kitty wezterm ghostty alacritty
        foot

        # compression
        lzop bzip2 bzip3 pigz xz zstd brotli
        unzip libarchive bsdiff cpio
        
        # system utils
        coreutils-full moreutils
        progress pv acpi
        curl axel saldl
        psmisc procps procs bottom
        socat caligula
        pinfo less most ov
        bat bat-extras.batman
        ripgrep fd sd eza stow
        
        # fetch/cli fun
        fastfetch fetch-scm macchina
        ufetch ugm

        # misc devtools
        gnumake gettext libtool colormake libbsd
        cmake meson ninja
        tree-sitter mercurial pandoc
        glow gum getopt getoptions
        imagemagick inkscape jq yq-go
        mmv-go rlwrap sqlite sqlite-utils

        # misc languages/interps
        rustup perl
        python312Full python312Packages.pip
        lua51Packages.lua lua51Packages.luarocks
        
        # lisps+schemes
        clisp sbcl ccl racket
        guile guile-config guile-hall guile-ncurses
        
        # llvm/clang
        llvmPackages.stdenv
        llvmPackages.llvm
        llvmPackages.lld
        llvmPackages.lldb
        llvmPackages.bintools
        llvmPackages.clang
    ];
}
