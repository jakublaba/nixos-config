{
  home.stateVersion = "26.05";

  xdg.configFile = {
    "autostart/solaar.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Solaar
      Exec=solaar --window=hide
      Icon=solaar
      Terminal=false
    '';

    "autostart/corectrl.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=CoreCtrl
      Exec=corectrl --minimize-systray
      Icon=corectrl
      Terminal=false
    '';

    "autostart/kando.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Kando
      Exec=kando
      Icon=kando
      Terminal=false
    '';
  };
}
