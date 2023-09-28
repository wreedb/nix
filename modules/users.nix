{ pkgs }: {
  
  users.wbr = {
    name = "wbr";
    home = "/home/wbr";
    description = "Will Bryan Reed";
    isNormalUser = true;
    createHome = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "audio" "video" "systemd-journal" "input" "adm" "locate" ];
  };

}
