vim.wo.wrap = true
vim.bo.textwidth = 120
vim.opt_local.formatoptions:append({ t = true }) -- Wrap all text, not just comments
vim.bo.spelllang = "en,es"
vim.bo.spell = true

vim.keymap.set("n", "<leader>p", vim.cmd.MarkdownPreview, { buffer = true })
