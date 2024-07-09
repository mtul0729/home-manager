{
  config,
  pkgs,
  lib,
  ...
}: {
  programs = {
    fzf.enable = true;
    zoxide.enable = true;
    gh.enable = true;
    gitui.enable = true;
    btop.enable = true;
    eza.enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "mcp";
    userEmail = "hjp1279@outlook.com";
  };
  services.psd.enable = true;
}
