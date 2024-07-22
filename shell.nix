{
  config,
  pkgs,
  lib,
  ...
}: {
  # Starship is a minimal, blazing-fast, and infinitely customizable prompt for any shell!
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      aws.disabled = true;
      gcloud.disabled = true;
      #line_break.disabled = true;
    };
  };

  programs.fish = {
    enable = true;
    # interactiveShellInit = ''
    # '';
    shellAbbrs = {
      zdup = "sudo zypper dup";
      zlu = "sudo zypper list-updates";
      zu = "sudo zypper update";
      zin = "sudo zypper install";
    };
    # https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
    shellInitLast = ''
      set NPM_PACKAGES "$HOME/.npm-packages"
      set PATH $NPM_PACKAGES/bin $PATH
      set MANPATH $NPM_PACKAGES/share/man $MANPATH
    '';
  };

  programs.nushell = {enable = true;};

  programs.atuin = {
    enable = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "https://api.atuin.sh";
      search_mode = "prefix";
    };
  };
}
