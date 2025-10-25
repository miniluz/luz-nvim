-- Define your keymaps function
local attach_keymaps = function(bufnr)
  vim.keymap.set(
    "n",
    "<leader>lgD",
    vim.lsp.buf.declaration,
    { buffer = bufnr, noremap = true, silent = true, desc = "Go to declaration" }
  )
  vim.keymap.set(
    "n",
    "<leader>lgd",
    vim.lsp.buf.definition,
    { buffer = bufnr, noremap = true, silent = true, desc = "Go to definition" }
  )
  vim.keymap.set(
    "n",
    "<leader>lgt",
    vim.lsp.buf.type_definition,
    { buffer = bufnr, noremap = true, silent = true, desc = "Go to type" }
  )
  vim.keymap.set(
    "n",
    "<leader>lgi",
    vim.lsp.buf.implementation,
    { buffer = bufnr, noremap = true, silent = true, desc = "List implementations" }
  )
  vim.keymap.set(
    "n",
    "<leader>lgr",
    vim.lsp.buf.references,
    { buffer = bufnr, noremap = true, silent = true, desc = "List references" }
  )
  vim.keymap.set(
    "n",
    "<leader>lgn",
    vim.diagnostic.goto_next,
    { buffer = bufnr, noremap = true, silent = true, desc = "Go to next diagnostic" }
  )
  vim.keymap.set(
    "n",
    "<leader>lgp",
    vim.diagnostic.goto_prev,
    { buffer = bufnr, noremap = true, silent = true, desc = "Go to previous diagnostic" }
  )
  vim.keymap.set(
    "n",
    "<leader>le",
    vim.diagnostic.open_float,
    { buffer = bufnr, noremap = true, silent = true, desc = "Open diagnostic float" }
  )
  vim.keymap.set(
    "n",
    "<leader>lH",
    vim.lsp.buf.document_highlight,
    { buffer = bufnr, noremap = true, silent = true, desc = "Document highlight" }
  )

  vim.keymap.set(
    "n",
    "<leader>lwa",
    vim.lsp.buf.add_workspace_folder,
    { buffer = bufnr, noremap = true, silent = true, desc = "Add workspace folder" }
  )
  vim.keymap.set(
    "n",
    "<leader>lwr",
    vim.lsp.buf.remove_workspace_folder,
    { buffer = bufnr, noremap = true, silent = true, desc = "Remove workspace folder" }
  )
  vim.keymap.set("n", "<leader>lwl", function()
    vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = bufnr, noremap = true, silent = true, desc = "List workspace folders" })
  vim.keymap.set(
    "n",
    "<leader>lws",
    vim.lsp.buf.workspace_symbol,
    { buffer = bufnr, noremap = true, silent = true, desc = "List workspace symbols" }
  )
  vim.keymap.set(
    "n",
    "<leader>lh",
    vim.lsp.buf.hover,
    { buffer = bufnr, noremap = true, silent = true, desc = "Trigger hover" }
  )
  vim.keymap.set(
    "n",
    "<leader>lx",
    vim.lsp.buf.signature_help,
    { buffer = bufnr, noremap = true, silent = true, desc = "Signature help" }
  )
  vim.keymap.set(
    "n",
    "<leader>ln",
    vim.lsp.buf.rename,
    { buffer = bufnr, noremap = true, silent = true, desc = "Rename symbol" }
  )
  vim.keymap.set(
    "n",
    "<leader>la",
    vim.lsp.buf.code_action,
    { buffer = bufnr, noremap = true, silent = true, desc = "Code action" }
  )
  vim.keymap.set(
    "n",
    "<leader>lf",
    vim.lsp.buf.format,
    { buffer = bufnr, noremap = true, silent = true, desc = "Format" }
  )
  vim.keymap.set("n", "<leader>ltf", function()
    vim.b.disable_autoformat = not vim.b.disable_autoformat
  end, { buffer = bufnr, noremap = true, silent = true, desc = "Toggle format on save" })
end

-- Automatically attach keymaps to ALL LSP servers
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    attach_keymaps(ev.buf)
  end,
})
