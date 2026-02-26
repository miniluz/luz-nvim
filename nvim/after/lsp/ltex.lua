return {
  cmd = { "ltex-ls" },
  filetypes = { "bib", "markdown", "plaintex", "tex", "typst", "gitcommit" },
  on_attach = function(client, bufnr)
    require("ltex_extra").setup({
      init_check = true,
      path = vim.fn.stdpath("data") .. "/ltex",
    })
  end,
  settings = {
    ltex = {
      enabled = { "latex", "tex", "bib", "markdown", "typst", "gitcommit" },
      language = "en-US",
      diagnosticSeverity = "information",
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "es",
      },
      checkFrequency = "save",
    },
  },
}
