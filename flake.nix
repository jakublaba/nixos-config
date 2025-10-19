{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs:
      let
      sharedModules = [
        ./modules/audio.nix
        ./modules/boot.nix
        ./modules/git.nix
        ./modules/gnome-extensions.nix
        ./modules/gnome.nix
        ./modules/graphics.nix
        ./modules/locale.nix
        ./modules/network.nix
        ./modules/nix-settings.nix
        ./modules/packages.nix
        ./modules/plymouth.nix
        ./modules/services.nix
        ./modules/users.nix
        ./modules/xserver.nix
      ];
    in
  {
    nixosConfigurations = {
      krb = nixpkgs.lib.nixosSystem {
        system = "x86_64_linux";
        modules = [
          # ./hosts/krb/hardware-configuration.nix
          ./hosts/krb/video.nix
        ] ++ sharedModules;
      };

      vm = nixpkgs.lib.nixosSystem {
        system = "x86_64_linux";
        modules = [
          ./hosts/vm/hardware-configuration.nix
          ./hosts/vm/video.nix
        ] ++ sharedModules;
      };
    };
  };
}

