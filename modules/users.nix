{ pkgs, ... }:

{
  security.sudo.extraConfig = ''
    Defaults pwfeedback
  '';

  # Don't forget to set a password with 'passwd'
  users.users.kuba = {
    isNormalUser = true;
    description = "kuba";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      thunderbird
    ];
  };
}
