local left_delete = "^(.)().-(.)()$"
local right_delete = "^(. ?)().-( ?.)()$"

require("nvim-surround").setup({
	move_cursor = "sticky",

	-- The defaults use ( for whitespace, and ) for no whitespace. Silly!
	-- See https://github.com/kylechui/nvim-surround/issues/384
	surrounds = {
		["("] = {
			add = { "(", ")" },
			delete = left_delete,
		},
		[")"] = {
			add = { "( ", " )" },
			delete = right_delete,
		},
		["["] = {
			add = { "[", "]" },
			delete = left_delete,
		},
		["]"] = {
			add = { "[ ", " ]" },
			delete = right_delete,
		},
		["{"] = {
			add = { "{", "}" },
			delete = left_delete,
		},
		["}"] = {
			add = { "{ ", " }" },
			delete = right_delete,
		},
		["<"] = {
			add = { "<", ">" },
			delete = left_delete,
		},
		[">"] = {
			add = { "< ", " >" },
			delete = right_delete,
		},

		-- codeblock! We add this for all languages, since I still use codeblocks in
		-- languages where they aren't a feature (like git commit descriptions)
		["C"] = {
			add = { { "", "```", "" }, { "", "```", "" } },
			find = "```.-```",

			-- From https://github.com/gen4438/dotfiles/blob/0822a4bc6d652bf3c7d03adc3020808861d448d1/dot_config/nvim/lua/plugins/vim-surround.lua#L57
			-- Slightly modified to preserve the wrapping lines
			delete = "^(```.-)()%\n.-(```)()$",
		},
	},
})
