{

  doas.enable = true;
  doas.extraConfig = "permit persist keepenv wbr";

  please.enable = true;
  polkit.enable = true;

  sudo = {
    enable = true;
    extraConfig = ''
      Defaults !tty_tickets
      Defaults insults
    '';
  };

}