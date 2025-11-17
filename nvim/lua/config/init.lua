vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

vim.wo.relativenumber = true

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevel = 99
vim.o.foldenable = true

vim.o.undofile = true

vim.o.winborder = "rounded"
vim.o.smoothscroll = true
vim.o.title = true
vim.o.titlestring = vim.fn.getcwd():match("([^/]+)$") .. ": %t"

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 0

vim.o.shiftround = true
vim.o.breakindent = true

vim.keymap.set({ "n", "v" }, "<leader>w", "<cmd>w<cr><cmd>bd<cr>", { silent = true, desc = "Save and close buffer" })
vim.keymap.set({ "n", "v" }, "<leader>W", "<cmd>bd<cr>", { silent = true, desc = "Close buffer without saving" })
vim.keymap.set({ "n", "v" }, "<leader><C-w>", "<cmd>%bd|e#<cr>", { silent = true, desc = "Close all buffers" })

vim.keymap.set({ "n", "v" }, "<leader>g", "<cmd>G<cr>", { silent = true, desc = "Open fugitive" })

vim.keymap.set({ "n", "v", "i" }, "<C-.>", vim.lsp.buf.code_action, { silent = true, desc = "Open code actions" })

vim.keymap.set({ "n", "v" }, "<leader><Tab>", "<C-^>", { silent = true, desc = "Switch to last buffer" })

vim.api.nvim_create_user_command("FixPaste", function()
  vim.cmd([[%s/\e\[27;5;106\~/\r/g]])
end, {})

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
  severity_sort = true,
  signs = false,
  float = {
    border = "rounded",
  },
})
