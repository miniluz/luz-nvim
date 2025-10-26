require("gitmoji").setup({})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<C-Enter>"] = { "select_and_accept", "fallback" },
  },
  sources = {
    default = {
      "gitmoji",
    },
    providers = {
      gitmoji = {
        name = "gitmoji",
        module = "gitmoji.blink",
        opts = {
          filetypes = { "gitcommit", "jj" },
        },
      },
    },
  },
})
