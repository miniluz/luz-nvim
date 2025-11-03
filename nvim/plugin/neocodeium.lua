require("neocodeium").setup({
  manual = true,
})

vim.keymap.set({ "n", "v", "i" }, "<leader>;", require("neocodeium").cycle_or_complete, { desc = "Start autocomplete" })
vim.keymap.set({ "n", "v", "i" }, "<A-Enter>", require("neocodeium").accept, { desc = "Accept suggestion" })
