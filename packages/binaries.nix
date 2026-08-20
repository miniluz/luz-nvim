{ pkgs }:
let
  jdtlsWithLombok = pkgs.symlinkJoin {
    name = "jdt-language-server-with-lombok";
    paths = [ (pkgs.jdt-language-server.override { jdk = pkgs.jdk_headless; }) ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/jdtls \
        --set JAVA_TOOL_OPTIONS "-javaagent:${pkgs.lombok}/share/java/lombok.jar"
    '';
  };

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

    (pkgs.python314.withPackages (
      ps: with ps; [
        python-lsp-server
        # pylsp-mypy Broken on nightly
      ]
    ))
    ruff

    marksman
    tinymist
    prettier
    prettierd
    vscode-js-debug
    # vscode-extensions.vadimcn.vscode-lldb

    jdtlsWithLombok
    (google-java-format.override { jre = pkgs.jdk_headless; })

    wl-clipboard
    wl-clipboard-x11
    jq
    yq
    sqlite
  ];
in
packages ++ [ customYazi ]
