vim.g.repo_root = vim.fs.root(0, ".git")

require("lz.n").load({
  "fastspell.nvim",
  event = "BufReadPost",
  after = function()
    local fastspell = require("fastspell")

    -- Initialize fastspell
    local config_path = vim.g.repo_root .. "/.cspell.json"
    -- local f = io.open(config_path, "r")
    -- if f then
    --   vim.notify(f:read("*a"))
    --   f:close()
    -- else
    --   vim.notify("fastspell: could not open config file: " .. tostring(config_path), vim.log.levels.ERROR)
    -- end
    fastspell.setup({
      cspell_json_file_path = config_path,
    })

    local enabled = true

    -- Run spell checking on text changes and scrolling
    vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufEnter", "WinScrolled" }, {
      callback = function(_)
        if not enabled then
          return
        end
        -- Check spelling only in the visible lines of the buffer
        local first_line = vim.fn.line("w0") - 1
        local last_line = vim.fn.line("w$")
        fastspell.sendSpellCheckRequest(first_line, last_line)
      end,
    })

    vim.keymap.set("n", "<leader>ts", function()
      enabled = not enabled
      if not enabled then
        local ns = vim.api.nvim_get_namespaces()["fastspell"]
        if ns then
          vim.diagnostic.reset(ns)
        end
      else
        local first_line = vim.fn.line("w0") - 1
        local last_line = vim.fn.line("w$")
        fastspell.sendSpellCheckRequest(first_line, last_line)
      end
      vim.notify("Fastspell: " .. (enabled and "enabled" or "disabled"))
    end, { desc = "Toggle fastspell" })
  end,
})
