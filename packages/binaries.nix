{ pkgs }:
let
  customYazi = pkgs.yazi.override {
    optionalDeps = with pkgs; [
      jq
      poppler-utils
      _7zz
      fd
      ripgrep
      fzf
      imagemagick
      chafa
      resvg
    ];
  };

  packages = with pkgs; [
    nil
    nixfmt

    rust-analyzer

    lua-language-server
    stylua

    typescript-language-server
    tailwindcss-language-server
    prettierd

    basedpyright
    ruff

    marksman
    tinymist
    ltex-ls-plus

    nodePackages.prettier
    prettierd
    vscode-js-debug
    vscode-extensions.vadimcn.vscode-lldb

    (jdt-language-server.override { jdk = pkgs.jdk_headless; })
    (google-java-format.override { jre = pkgs.jre_headless; })

    wl-clipboard
    wl-clipboard-x11
    jq
    yq
    sqlite
  ];
in
packages ++ [ customYazi ]
