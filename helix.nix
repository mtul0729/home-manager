{
  pkgs,
  helix,
  ...
}: {
  programs.helix = {
    enable = true;
    # package = helix.default; # use upstream package
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
