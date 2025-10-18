{
  description = "deez";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # nixosConfiguration.<hostname> - remember to adjust
    nixosConfigurations.krb = nixpkgs.lib.nixosSystem {
      modules = [
        # ./configuration.nix
        ./hardware-configuration.nix
        ./modules/amdgpu.nix
        ./modules/audio.nix
        ./modules/boot.nix
        ./modules/gnome-extensions.nix
        ./modules/gnome.nix
        ./modules/locale.nix
        ./modules/network.nix
        ./modules/nix-settings.nix
        ./modules/packages.nix
        ./modules/plymouth.nix
        ./modules/services.nix
        ./modules/users.nix
        ./modules/xserver.nix
      ];
    };
  };
}

