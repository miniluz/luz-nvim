require("lz.n").load({
  "fastspell.nvim",
  event = "BufReadPost",
  after = function()
    local fastspell = require("fastspell")

    -- Initialize fastspell
    fastspell.setup({
      -- Add custom configurations here if needed
    })

    -- Run spell checking on text changes and scrolling
    vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufEnter", "WinScrolled" }, {
      callback = function(_)
        -- Check spelling only in the visible lines of the buffer
        local first_line = vim.fn.line("w0") - 1
        local last_line = vim.fn.line("w$")
        fastspell.sendSpellCheckRequest(first_line, last_line)
      end,
    })
  end,
})
