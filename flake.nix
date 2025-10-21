{
  description = "NixOS config - jakublaba";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      sharedModules = [
        ./modules/audio.nix
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
        ./modules/zsh.nix
      ];
    in
    {
      nixosConfigurations = {
        pc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/pc/boot.nix
            ./hosts/pc/corectrl.nix
            ./hosts/pc/hardware-configuration.nix
            ./hosts/pc/video.nix
            ./hosts/pc/virtualization.nix
          ]
          ++ sharedModules;
        };

        vm = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/vm/boot.nix
            ./hosts/vm/clipboard-sharing.nix
            # todo put vm hardware config in the repo
            ./hosts/vm/hardware-configuration.nix
            ./hosts/vm/video.nix
          ]
          ++ sharedModules;
        };
      };
    };
}
