{ config, pkgs, lib, ... }:
{
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
    interactiveShellInit = ''
      abbr -a -- zdup 'sudo zypper dup'
      abbr -a -- zlu 'sudo zypper list-updates'
      abbr -a -- zu 'sudo zypper update'
      abbr -a -- zin 'sudo zypper install'
      abbr -a -- wcn 'warp-cli connect'
      abbr -a -- wdc 'warp-cli disconnect'
    '';
  };
  
  programs.atuin={enable = true;
  settings = {
  auto_sync = true;
  sync_frequency = "5m";
  sync_address = "https://api.atuin.sh";
  search_mode = "prefix";
};};

  programs.zoxide.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}