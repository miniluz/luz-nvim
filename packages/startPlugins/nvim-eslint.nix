{ vimUtils, fetchFromGitHub }:

vimUtils.buildVimPlugin {
  name = "nvim-eslint";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "esmuellert";
    repo = "nvim-eslint";
    rev = "e052854a05c0e247c0fc886bcff7c8ef9d54c2b9";
    hash = "sha256-8bjy+UGifhTFjLiIFRAmzOQEmIPjJTr8bQW3+XJR4oY=";
  };
}
