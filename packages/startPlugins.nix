{ pkgs }:
let
  plugins = with pkgs.vimPlugins; [
    # Bootstrapping
    lz-n
    plenary-nvim

    # Appearance
    catppuccin-nvim

    # IDE
    auto-session
    bufferline-nvim
    yazi-nvim
    which-key-nvim
    snacks-nvim
    mini-nvim
    lualine-nvim
    lualine-lsp-progress

    # Git
    gitsigns-nvim
    hunk-nvim
    fugitive
    blink-cmp-conventional-commits

    # LSP
    nvim-lspconfig
    conform-nvim
    blink-cmp
    nvim-lightbulb
    otter-nvim
    tiny-inline-diagnostic-nvim

    # DAP
    nvim-dap
    nvim-dap-ui
    nvim-dap-virtual-text
    # nvim-dap-python requires packaging all of python
    nvim-dap-lldb
    nvim-dap-vscode-js

    # Language specific
    nvim-ts-context-commentstring
    typst-preview-nvim
    tailwind-tools-nvim
    markdown-preview-nvim

    # Utils
    nvim-autopairs
    nvim-surround
    leap-nvim
    hardtime-nvim
    fidget-nvim
    noice-nvim
    nvim-ufo
    guess-indent-nvim
    nvim-spider
    vim-tmux-navigator
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
