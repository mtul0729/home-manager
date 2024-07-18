{
  pkgs,
  helix,
  ...
}: {
  programs.helix = {
    enable = true;
    package = helix.default;
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
  };
}
