{pkgs, ...}: {
  # don't forget to set password with passwd on fresh install
  users.users.kuba = {
    isNormalUser = true;
    description = "kuba";

    extraGroups = [
      "input"
      "networkmanager"
      "wheel"
    ];
  };
}
