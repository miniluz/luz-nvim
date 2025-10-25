vim.opt.termguicolors = true
require("bufferline").setup({})

vim.keymap.set({ "n", "v" }, "<Right>", "<cmd>BufferLineCycleNext<cr>", { silent = true, desc = "Next buffer" })
vim.keymap.set({ "n", "v" }, "<Left>", "<cmd>BufferLineCyclePrev<cr>", { silent = true, desc = "Previous buffer" })
vim.keymap.set({ "n", "v" }, "<Up>", "<cmd>BufferLinePick<cr>", { silent = true, desc = "Pick buffer" })
