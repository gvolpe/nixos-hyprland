{
  description = "gvolpe's NixOS Hyprland configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-flake = {
      url = github:gvolpe/neovim-flake;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, neovim-flake, ... }:
    let
      system = "x86_64-linux";
      inherit (nixpkgs) lib;
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = [
          (f: p: { neovim-scala = neovim-flake.packages.${system}.scala-nightly; })
          neovim-flake.overlays.${system}.default
        ];
      };
    in
    {
      nixosConfigurations =
        {
          machine = lib.nixosSystem {
            inherit lib pkgs system;
            specialArgs = { inherit inputs; };
            modules = [
              ./configuration.nix
              home-manager.nixosModules.home-manager
              (import ./home.nix)
            ];
          };
        };
    };
}
