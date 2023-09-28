{ config, pkgs, ... }: {

  imports = [ ./modules/auto-generated.nix ];

  boot = import ./modules/boot.nix { inherit config pkgs; };
  programs = import ./modules/programs.nix { inherit pkgs; };
  networking = import ./modules/networking.nix;
  users = import ./modules/users.nix { inherit pkgs; };
  xdg = import ./modules/xdg.nix;
  services = import ./modules/services.nix { inherit pkgs; };
  fonts = import ./modules/fonts.nix { inherit pkgs; };
  nix = import ./modules/nix.nix;
  console = import ./modules/console.nix { inherit pkgs; };
  nixpkgs = import ./modules/nixpkgs.nix;
  documentation = import ./modules/documentation.nix;
  location = import ./modules/location.nix;
  environment = import ./modules/environment.nix { inherit pkgs; };
  hardware = import ./modules/hardware.nix { inherit pkgs; };
  security = import ./modules/security.nix;
  system = import ./modules/system.nix;

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

}