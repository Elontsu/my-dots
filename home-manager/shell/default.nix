{
  pkgs,
  inputs,
  ...
}:
{
  # imports = [
  #   inputs.spicetify-nix.homeManagerModules.default
  # ];

  inputs.programs.caelestia = {
    enable = true;
    settings = {
      paths.wallpaperDir = "~/Pictures/Wallpapers";
    };
  };
}
