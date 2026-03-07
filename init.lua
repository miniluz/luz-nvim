require("config")
require("lz.n").load("lazy")

-- Add to this whenever you add a new server to the `lsp` folder!
-- Ridiculous that nvim can't load them for you as far as I can tell
vim.lsp.enable({
  "nil_ls",
  "rust_analyzer",
  "lua_ls",
  "ts_ls",
  "basedpyright",
  "marksman",
  "tinymist",
})
