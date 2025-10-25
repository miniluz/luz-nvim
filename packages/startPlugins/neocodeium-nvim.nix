{
  fetchFromGitHub,
  vimUtils,
}: 
vimUtils.buildVimPlugin {
  pname = "neocodeium.nvim";
  version = "2025-07-24";
  src = fetchFromGitHub {
    name = "neocodeium";
    owner = "monkoose";
    repo = "neocodeium";
    rev = "bfe790d78e66adaa95cb50a8c75c64a752336e9c";
    hash = "sha256-SBUVCxJufLzWO/9ZOUOnpDBC2ez6DrvixgedMlXqKxI=";
  };
}
