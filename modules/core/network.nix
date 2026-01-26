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
      allowedTCPPorts = [443 2137];
      # allowedUDPPorts = [ ... ];

      # Or disable the firewall altogether
      # enable = false;
    };
  };

  environment.systemPackages = with pkgs; [
    sstp
    ppp
  ];
}
