{ config, pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "make"
      "env"
      "toml"
      "html"
      "catppuccin"
      "git-firefly"
      "zed-react-ts-snippets"
      "react-snippets"
      "nextjs-react-javascript-snippets"
      "dockerfile"
      "docker-compose"
      "http"
      "ssh-config"
      "angular"
      "nestjs-snippets"
    ];
    userSettings = {
      ui_font_size = 16;
      buffer_font_size = 16;
      format_on_save = "on";
      soft_wrap = "none";
      formatter = "language_server";
      tab_size = 2;
      indent_size = 2;
      minimap = {
        show = "always";
        thumb = "always";
        thumb_border = "left_open";
        current_line_highlight = "line";
      };
      theme = {
        mode = "dark";
        light = "One Light";
        dark = "Catppuccin Frappé";
      };
      lsp = {
        "rust-analyzer" = {
          command = "${pkgs.rustup}/bin/rust-analyzer";
        };
      };
      features = {
        debugger = {
          enable = true;
        };
      };
      assistant = {
        enabled = true;
        version = "2";
        button = true;
        default_model = {
          provider = "lmstudio";
          model = "microsoft/phi-4-mini-reasoning";
        };
        editor_model = {
          provider = "lmstudio";
          model = "microsoft/phi-4-mini-reasoning";
        };
        language_models = {
          lmstudio = {
            api_url = "https://localhost:1234/v1";
            available_models = [
              {
                name = "microsoft/phi-4-mini-reasoning";
                display_name = "microsoft/phi-4-mini-reasoning";
                max_tokens = 4096;
                support_tools = true;
                support_thinking = true;
              }
            ];
          };
        };
      };
    };
  };
}
