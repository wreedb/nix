{ config, lib, pkgs, ... }:

{
    imports = [
        ./modules/autogen.nix
        ./modules/boot.nix
        ./modules/console.nix
        ./modules/documentation.nix
        ./modules/environment/default.nix
    ];

    networking = {

        hostName = "nix";

		networkmanager = {
			enable = true;
		};
        
        dhcpcd.enable = true;
        
        firewall.enable = true;
        firewall.allowedTCPPorts = [ 22 ];
        
    };


    time = { timeZone = "America/Chicago"; };
    i18n = { defaultLocale = "en_US.UTF-8"; };

    services = {
        
        emacs = {
            enable = true;
            startWithGraphical = true;
            package = pkgs.emacs30-gtk3;
            defaultEditor = true;
            install = true;
        };

        printing = { enable = true; };
        locate   = { enable = true; };

        pipewire = {
            enable = true;
            alsa.enable = true;
            wireplumber.enable = true;
            # wireplumber.extraConfig = { renaming/disabling };
        };

        openssh.enable = true;
        rsyncd.enable = true;
        gvfs.enable = true;

        upower.enable = true;
        udisks2.enable = true;
        acpid.enable = true;
        udev.enable = true;
        dbus.implementation = "broker";

        libinput.enable = true;
        
    };

    users = {
            
        users.wbr = {
            name = "wbr";
            description = "Will Reed";
            isNormalUser = true;
            shell = pkgs.bash;
            createHome = true;
            
            extraGroups = [ "wheel" "audio" "video" "input" "systemd-journal" "adm" ];

        };
    };

    security = {
        polkit  = { enable = true; };
        rtkit   = { enable = true; };
        please  = { enable = true; };
        sudo-rs = { enable = true; };

        doas = {
            enable = true;
            extraRules = [
                { groups = [ "wheel" ]; keepEnv = true; persist = true; }
            ];
        };
    };

    programs = {

        bash.blesh.enable = true;
        
        neovim = {
            enable = true;
            vimAlias = true;
            viAlias = true;
        };

        command-not-found = { enable = true; };
        hyprland = { enable = true; };
        git = { enable = true; };

        firefox = {
            enable = true;
            package = pkgs.firefox;
            languagePacks = [ "en-US" ];
        };

        gnupg = {
            agent.enable = true;
            agent.enableSSHSupport = true;
        };

    };

    fonts = {
        fontDir.enable = true;

        packages = with pkgs; [
            nerd-fonts.symbols-only
            noto-fonts-color-emoji
            roboto roboto-flex
            emacs-all-the-icons-fonts
            terminus_font termsyn tamsyn
            iosevka cascadia-code jetbrains-mono
        ];

        fontconfig = {
        
            enable = true;
            antialias = true;
            hinting.enable = true;

            defaultFonts = {
                emoji = [ "Noto Color Emoji" ];
                serif = [ "Roboto Serif" ];
                sansSerif = [ "Roboto Condensed" ];
                monospace = [ "JetBrains Mono" ];
            };
            
        };
        
    };

    hardware = {
        graphics = { enable = true; };
        bluetooth.enable = true;
        cpu.intel.updateMicrocode = true;
        logitech.wireless.enable = true;
        enableRedistributableFirmware = true;
        
    };

    xdg.portal = {
        enable = true;
        config.common.default = "*";
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    xdg.autostart.enable = true;
    xdg.sounds.enable = true;
    xdg.icons.enable = true;
    xdg.menus.enable = true;
    xdg.mime.enable = true;

    nixpkgs.config = { allowBroken = true; allowUnfree = true; };

    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
        system-features = [ "kvm" "gccarch-tigerlake" ];
        trusted-users = [ "root" "@wheel" ];
        cores = 8; max-jobs = 8;
        auto-optimise-store = true;
        
        substituters = [
            "https://nix-community.cachix.org"
            "https://hyprland.cachix.org"
            "https://cache.nixos.org"
        ];
        
        use-xdg-base-directories = true;
    };

    system.stateVersion = "25.05";

}
