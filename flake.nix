{
  description = "NixOS config - jakublaba";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      sharedModules = [
        ./modules/core
        ./modules/gnome
        ./modules/git.nix
        ./modules/packages.nix
        ./modules/plymouth.nix
        ./modules/services.nix
        ./modules/users.nix
        ./modules/xserver.nix
        ./modules/zsh.nix
      ];
    in
    {
      nixosConfigurations = {
        pc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/pc/core
            ./hosts/pc/overclocking
            ./hosts/pc/virtualization
          ]
          ++ sharedModules;
        };

        vm = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/vm/core ] ++ sharedModules;
        };
      };
    };
}
