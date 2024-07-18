{
  description = "Home Manager configuration of myul";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix-editor.url = "github:helix-editor/helix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    helix-editor,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    helix = helix-editor.packages.${system};
  in {
    homeConfigurations."myul" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home.nix
        {
          # Optionally use _module.args
          # to pass through arguments to home.nix
          _module.args = {inherit helix;};
        }
      ];
    };
  };
}
