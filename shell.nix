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
