{ pkgs }: {

    pcscd.enable = true;

    connman = {
      enable = true;
      package = pkgs.connmanFull;
      wifi = { backend = "wpa_supplicant"; };
    };

    dnsmasq  = {
      enable = true;
      settings.server = [ "1.1.1.1" "1.0.0.1" ];
    };

    locate = {
      enable = true;
      localuser = null;
      locate = pkgs.plocate;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    xserver = {
      enable = true;
      layout = "us";
      videoDrivers = [ "modesetting" ];
      displayManager.sddm = {
        enable = true;
        autoNumlock = true;
      };
    };

    openssh.enable = true;
    aria2.enable = true;
    chrony.enable = true;
    rsyncd.enable = true;

    gnome.gnome-keyring.enable = true;
    flatpak.enable = true;
    geoclue2.enable = true;
    gpm.enable = true;
    gvfs.enable = true;

    dbus.implementation = "broker";
    accounts-daemon.enable = true;
    upower.enable = true;
    udisks2.enable = true;
    acpid.enable = true;
    udev.enable = true;

}