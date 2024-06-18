{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      alejandra
      clang-tools
      marksman
      nil
      # bash-language-server
      # nodePackages.vscode-css-languageserver-bin
      vscode-langservers-extracted
      shellcheck
    ];
    settings = {
      theme = "fleet_dark";
    };
    languages = {
      language-server.rust-analyzer.config.check = {command = "clippy";};
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {command = "alejandra";};
          language-servers = ["nil"];
        }
        {
          name = "rust";
          auto-format = true;
          formatter = {command = "rustfmt";};
        }
      ];
    };
  };
}
