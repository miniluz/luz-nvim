-- Follow and return from tag link
vim.keymap.set("n", "<CR>", "<C-]>", { buffer = true })
vim.keymap.set("n", "<BS>", "<C-T>", { buffer = true })

-- Color tag links blue to be more visually distinct from mini.cursorword
vim.api.nvim_set_hl(0, "@markup.link.vimdoc", { fg = colors.blue })

vim.bo.wrap = false
vim.b.miniindentscope_disable = true
