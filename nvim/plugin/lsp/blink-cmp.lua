require("blink.cmp").setup({
	keymap = {
		preset = 'default',
		['<C-Enter>'] = { 'select_and_accept', 'fallback', },
	},
})
