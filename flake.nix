{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    mnw.url = "github:Gerg-L/mnw";
    fastspell-nvim = {
      url = "github:miniluz/fastspell.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      mnw,
      fastspell-nvim,
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

      forPkgs = import ./forPkgs.nix mnw fastspell-nvim;
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
          allowSubstitutes = false;

          packages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.devMode ];
        };
      });
    };

}
