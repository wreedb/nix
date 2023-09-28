{ pkgs }: {

    hyprland.enable = true;
    river.enable = true;
    xwayland.enable = true;

    ccache.enable = true;
    less.enable = true;
    git.enable = true;
    dconf.enable = true;

    zsh.enable = true;

    fish = {
      enable = true;
      useBabelfish = true;
    };

    firefox = {
      enable = true;
      package = pkgs.firefox-wayland;
      languagePacks = [ "en-US" ];
    };

}