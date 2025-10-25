require("nvim-lightbulb").setup({ float = { enabled = true } })
require("otter")

vim.diagnostic.config({ virtual_text = false })

require("tiny-inline-diagnostic").setup({
  options = {
    multilines = {
      enabled = true,
      always_show = true,
    },
  },
})
