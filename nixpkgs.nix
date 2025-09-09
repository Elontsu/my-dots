{
  system,
  ...
}:
{
  inherit system;
  config.allowUnfree = true;
  overlays = [
    (import ./overlays/spotify.nix)
  ];
}
