require("conform").setup({
  -- Sometimes a formatter will fail. We should write to the file anyways
  notify_on_error = false,

  formatters_by_ft = {
    java = { "google-java-format" },

    nix = { "nixfmt" },

    lua = { "stylua" },

    python = {
      "ruff_fix",
      "ruff_organize_imports",
      "ruff_format",
    },

    rust = { "rustfmt" },

    typescript = { "prettierd", "prettier", stop_after_first = true },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
  },

  -- For gleam
  default_format_opts = {
    lsp_format = "fallback",
  },

  formatters = {
    ["google-java-format"] = {
      command = "google-java-format",
      args = { "--aosp", "-" },
    },
    ["tex-fmt"] = {
      prepend_args = { "--nowrap", "--tabsize", "4" },
    },
    stylua = {
      prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
    },
  },
  format_on_save = nil,

  format_after_save = function(bufnr)
		if vim.g.disable_autoformat then
			return nil
		end

    if vim.b[bufnr].disable_autoformat then
      return nil
    end

    return { async = true }
  end,
})

vim.api.nvim_create_user_command("Fmt", function(args)
  local range = nil

  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]

    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end

  require("conform").format({ range = range, async = true })
end, { range = true })

vim.cmd.cabbrev("fmt", "Fmt")


vim.keymap.set("n", "<leader>lt", function()
  if vim.b.disable_autoformat then
    vim.b.disable_autoformat = false
    vim.notify("Format-on-save enabled", vim.log.levels.INFO)
  else
    vim.b.disable_autoformat = true
    vim.notify("Format-on-save disabled", vim.log.levels.WARN)
  end
end, { 
  desc = "Toggle format-on-save (buffer)",
  silent = true 
})

vim.keymap.set("n", "<leader>lT", function()
  if vim.g.disable_autoformat then
    vim.g.disable_autoformat = false
    vim.notify("Format-on-save enabled globally", vim.log.levels.INFO)
  else
    vim.g.disable_autoformat = true
    vim.notify("Format-on-save disabled globally", vim.log.levels.WARN)
  end
end, {
  desc = "Toggle format-on-save (global)",
  silent = true
})
