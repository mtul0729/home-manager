{pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [nil nixpkgs-fmt];
    settings = {
      theme = "fleet_dark";
    };
  };
}
