{ inputs, config, lib, pkgs, ... }:

{
    home.packages = [
        pkgs.vesktop
        pkgs.eww
        pkgs.swww
        pkgs.waybar
        inputs.gBar.defaultPackage.x86_64-linux
    ];

    manual.manpages.enable = true;
    news.display = "silent";
    home.stateVersion = "25.05";
}
