{ config, lib, pkgs, ... }:

{
    boot = {
        
        loader = {
            
            grub = {
                enable = true;
                device = "nodev";
                efiSupport = true;
                extraConfig = "set timeout=2";
            };

            efi.canTouchEfiVariables = true;

        };

        initrd = {
            enable = true;
            compressor = "lzop";
        };

        plymouth = {
            enable = true;
            themePackages = [ pkgs.nixos-bgrt-plymouth ];
            theme = "nixos-bgrt";
        };

        consoleLogLevel = 1;

    };
}
