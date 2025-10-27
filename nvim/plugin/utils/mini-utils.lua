require("mini.icons").setup({})
require("mini.ai").setup({})
require("mini.comment").setup({
  options = {
    custom_commentstring = function()
      return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
    end,
  },
})
require("mini.basics").setup({
  mappings = {
    windows = true,
    move_with_alt = true,
  },
})
