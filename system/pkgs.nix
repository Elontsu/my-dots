{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    lsd
    git
    unrar-free
    kitty
    wofi
    vesktop
    pipewire
    pwvucontrol
    fastfetch
    zed-editor

    telegram-desktop

    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    inputs.zen-browser.packages."${system}".default

    ox
    btop
    egl-wayland
    nvidia-system-monitor-qt
    unzip
    swww
    wlogout
    osu-lazer-bin
    r2modman
    qbittorrent
    hyprshot

    neovim

    nerd-fonts.jetbrains-mono
    prismlauncher
    rnnoise-plugin
    lmstudio
    libreoffice

    go

    rustup
    rustfmt

    libgcc
    gcc
    clang-tools
    clang_20

    nodejs_22

    nixd
    nil

    fd
    bat

    libsecret
    gcr
    keepassxc
  ];
}
