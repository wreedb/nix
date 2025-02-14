{
    description = "Nix configuration for my laptop";
  
    nixConfig = {
        accept-flake-config = true;       

        extra-substituters = [
            "https://hyprland.cachix.org"
            "https://cache.nixos.org/"
            "https://nix-community.cachix.org"
        ];
        
        extra-trusted-public-keys = [
            "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];

    };

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        gBar.url = "github:scorpion-26/gBar";
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
    
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config = { allowBroken = true; allowUnfree = true; };
        };

        lib = nixpkgs.lib;

    in {
        nixosConfigurations = {
            wbr-nix = lib.nixosSystem {
                inherit system;
                specialArgs = { inherit inputs; };
                modules = [
                    ./main.nix
	                home-manager.nixosModules.home-manager
	                {
	                    home-manager.useGlobalPkgs = true;
	                    home-manager.useUserPackages = true;
                        home-manager.extraSpecialArgs = { inherit inputs; };
	                    home-manager.users.wbr = import ./modules/home.nix;
	                }
                ];
            };
        };
      
    };

}
