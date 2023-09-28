{

    hostName = "nixos";

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 ];
    };

    wireless = {
      enable = true;
      dbusControlled = true;
      userControlled.enable = true;
    };

    dhcpcd = {
      enable = true;
      persistent = true;
    };

}
