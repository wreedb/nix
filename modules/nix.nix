{

  settings = {
    cores = 8;
    max-jobs = 8;
    experimental-features = [ "nix-command" "flakes" ];
    system-features = [ "gccarch-tigerlake" "kvm" ];
    trusted-users = [ "root" "@wheel" ];
    use-xdg-base-directories = true;
  };

}