{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        reload_style_on_change = true;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        # modules-center = [ "custom/spotify" ];
        modules-right = [
          "tray"
          "clock"
        ];
        "hyprland/window" = {
          max-length = 100;
          icon = true;
          format = "{class}";
        };
        "clock" = {
          interval = 1;
          name = "clock";
          format = "{:%H:%M:%S}";
        };
        "hyprland/workspaces" = {
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            empty = "";
          };
          tray = {
            icon-size = 24;
            spacing = 10;
          };
        };
      };
    };
  };
}
