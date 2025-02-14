{ config, lib, pkgs, ... }:

{
    imports = [ ./packages.nix ];

    environment = {

        localBinInPath = true;
        enableAllTerminfo = true;

        pathsToLink = [ "/share" "/share/fish" "/" ];
    
    };
}
