{pkgs, ...}: {
  networking = {
    hostName = "pc";

    networkmanager.enable = true;
    networkmanager.plugins = with pkgs; [
      networkmanager-sstp
    ];
    # wireless.enable = true;

    # Configure network proxy if necessary
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };

    # Open ports in the firewall
    firewall = {
      enable = true;

      allowedTCPPorts = [
        443
        # upnp ports for ppsspp
        1900
        27312
      ];
      allowedUDPPorts = [
        # upnp ports for ppsspp
        27312
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    sstp
    ppp
  ];
}
