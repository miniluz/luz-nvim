{ vimUtils, fetchFromGitHub }:

vimUtils.buildVimPlugin {
  name = "gitmoji-nvim";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Dynge";
    repo = "gitmoji.nvim";
    rev = "2659de229c2b26d50732f1220700eebbcdb2d6ef";
    hash = "sha256-cihJ2U+GIqf98t6wS4Fso6R8l69vXT+BsstqY7rrlc4=";
  };
}
