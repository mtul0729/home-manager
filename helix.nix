{pkgs, ...}: {
  # TODO: switch to upstream package https://github.com/helix-editor/helix
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
  };
}
