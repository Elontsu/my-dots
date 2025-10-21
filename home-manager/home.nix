{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./Hyprland
    ./kitty
    ./wofi
    ./swww
    ./zeditor
    # ./git
    ./zsh
    ./waybar
    ./spicetify
    ./fish
  ];
  home = {
    username = "elontsu";
    homeDirectory = "/home/elontsu";
    stateVersion = "25.11";
  };
}
