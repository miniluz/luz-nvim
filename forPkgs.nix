mnw: pkgs:
let
  inherit (pkgs) callPackage;

  startPlugins = import ./packages/startPlugins.nix { inherit pkgs; };
  optPlugins = import ./packages/optPlugins.nix { inherit pkgs; };
  binaries = import ./packages/binaries.nix { inherit pkgs; };

  customStartPlugins = {
    lazydev-nvim = callPackage ./packages/startPlugins/lazydev-nvim.nix { };
  };
  customOptPlugins = { };
  customBinaries = { };
in
mnw.lib.wrap pkgs {
  neovim = pkgs.neovim-unwrapped;

  appName = "luz-nvim";
  aliases = [ "luz-nvim" ];

  luaFiles = [
    ./init.lua
  ];

  extraBinPath = binaries ++ builtins.attrValues customBinaries;

  plugins = {
    start = startPlugins ++ builtins.attrValues customStartPlugins;
    opt = optPlugins ++ builtins.attrValues customOptPlugins;

    dev.config = {
      pure = ./nvim;
      impure = "/' .. vim.uv.cwd()  .. '/nvim";
    };
  };
}
