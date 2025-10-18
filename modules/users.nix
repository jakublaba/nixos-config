{ pkgs, ... }:

{
  # Don't forget to set a password with 'passwd'
  users.users.kuba = {
    isNormalUser = true;
    description = "kuba";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      thunderbird
    ];
  };
}
