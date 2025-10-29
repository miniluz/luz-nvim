require("gitmoji").setup({})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<A-Enter>"] = { "select_and_accept", "fallback" },
  },
  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
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
