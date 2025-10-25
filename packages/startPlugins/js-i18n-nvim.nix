{
  fetchFromGitHub,
  vimUtils,
  vimPlugins
}: 
vimUtils.buildVimPlugin {

  pname = "js-i18n.nvim";
  version = "2025-07-24";

  src = fetchFromGitHub {
    name = "js-i18n.nvim";
    owner = "nabekou29";
    repo = "js-i18n.nvim";
    rev = "5157a1c1a47b14aa77fa6e50626dc1add4d1a618";
    hash = "sha256-dgOSKnRB4jJQMgycRrnnaa12HtHxU3F3v99d/8743SM=";
  };

  dependencies = with vimPlugins; [
    nvim-lspconfig
    nvim-treesitter
    plenary-nvim
  ];

}
