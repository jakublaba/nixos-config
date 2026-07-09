{inputs, ...}: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (final: prev: {
      zen-browser =
        inputs.zen-browser.packages.${prev.stdenv.hostPlatform.system}.zen-browser;
    })
  ];
}
