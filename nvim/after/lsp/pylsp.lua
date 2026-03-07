---@type vim.lsp.Config
return {
	settings = {
		pylsp = {
			plugins = {
				pylsp_mypy = { enabled = true },
				-- ruff handles linting/formatting
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				mccabe = { enabled = false },
			},
		},
	},
}
