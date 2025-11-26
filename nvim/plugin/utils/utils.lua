require("fidget").setup({})
require("hardtime").setup({
  disabled_keys = {
    ["<Up>"] = false,
    ["<Down>"] = false,
    ["<Left>"] = false,
    ["<Right>"] = false,
  },
})
require("guess-indent").setup({})
require("noice").setup({})

require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})

require("spider").setup({})

vim.keymap.set(
  { "n", "i", "v", "o", "x" },
  "<c-h>",
  "<cmd>TmuxNavigateLeft<CR>",
  { silent = true, desc = "Window left" }
)
vim.keymap.set(
  { "n", "i", "v", "o", "x" },
  "<c-l>",
  "<cmd>TmuxNavigateRight<CR>",
  { silent = true, desc = "Window right" }
)
vim.keymap.set(
  { "n", "i", "v", "o", "x" },
  "<c-j>",
  "<cmd>TmuxNavigateDown<CR>",
  { silent = true, desc = "Window down" }
)
vim.keymap.set({ "n", "i", "v", "o", "x" }, "<c-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true, desc = "Window up" })
vim.keymap.set(
  { "n", "i", "v", "o", "x" },
  "<c-\\>",
  "<cmd>TmuxNavigatePrevious<CR>",
  { silent = true, desc = "Previous split" }
)

vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { silent = true })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { silent = true })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { silent = true })
