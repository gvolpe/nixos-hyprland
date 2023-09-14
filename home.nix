{ pkgs, ... }:

{
  home-manager = {
    useUserPackages = true;
    users.gvolpe = {
      home.packages = with pkgs; [
        neovim-scala
        git
        firefox
        hyprland
        wofi
        swaybg
        wlsunset
        wl-clipboard
        foot
      ];

      manual.manpages.enable = false;
      news.display = "silent";

      home = {
        username = "gvolpe";
        homeDirectory = "/home/gvolpe";
        stateVersion = "23.05";
      };

      wayland.windowManager.hyprland = {
        enable = true;
        enableNvidiaPatches = false;
        extraConfig = builtins.readFile ./hyprland.conf;
        systemdIntegration = true;
        xwayland.enable = true;
      };
    };
  };
}
