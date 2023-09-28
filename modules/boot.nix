{ config, pkgs }:

{

  kernelPackages = pkgs.linuxPackages_xanmod_latest;
  extraModulePackages = with config.boot.kernelPackages; [ rtl8821ce ];
  kernelParams = [ "i8042.dumbkbd" "rtw88_pci.disable_aspm=1" ];

  initrd = {
    enable = true;
    compressor = "lzop";
  };


  loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    extraConfig = "set timeout=1";
  };

  loader.efi.canTouchEfiVariables = true;


  plymouth = {
    enable = true;
    themePackages = [ pkgs.nixos-bgrt-plymouth ];
    theme = "nixos-bgrt";
  };

}
