{ pkgs }:
let
  plugins = with pkgs.vimPlugins; [
    # Bootstrapping
    lz-n
    plenary-nvim

    # Appearance
    catppuccin-nvim

    # IDE
    bufferline-nvim
    yazi-nvim

    # LSP
    nvim-lspconfig

    # Utils
    nvim-autopairs
    nvim-surround

    # Git
    gitsigns-nvim
    hunk-nvim
    fugitive
  ];

  treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (
    p: with p; [
      # The languages I work in everyday
      comment # highlight todos and fixmes
      fish
      gitcommit
      luadoc # --- type annotations
      nix
      javascript
      typescript
      tsx
      rust

      # Languages I use less often
      bash
      gitignore
      git_rebase
      java
      python
      typst
      sql
      nu

      # Writing
      markdown
      typst
      latex

      # Structured languages
      css
      csv
      diff # .patch files
      html
      json
      toml
      yaml

      # Languages I don't use much, but are common
      cpp
    ]
  );
in
plugins ++ [ treesitter ]
