{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    mnw.url = "github:Gerg-L/mnw";
  };

  outputs =
    {
      self,
      nixpkgs,
      mnw,
    }:
    let
      inherit (nixpkgs) lib;

      supportedSystems = [
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems =
        function: lib.genAttrs supportedSystems (system: function nixpkgs.legacyPackages.${system});

      forPkgs = import ./forPkgs.nix mnw;
    in
    {
      packages = forAllSystems (pkgs: rec {
        inherit forPkgs;
        neovim = forPkgs pkgs;

        default = neovim;
        devMode = neovim.devMode;
      });

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShellNoCC {
          packages = [ self.packages.${pkgs.system}.devMode ];
        };
      });
    };

}
