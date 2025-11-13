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
      "conventional_commits",
    },
    providers = {
      gitmoji = {
        name = "gitmoji",
        module = "gitmoji.blink",
        opts = {
          filetypes = { "gitcommit", "jj" },
        },
      },
      conventional_commits = {
        name = "Conventional Commits",
        module = "blink-cmp-conventional-commits",
        enabled = function()
          return vim.bo.filetype == "gitcommit"
        end,
        ---@module 'blink-cmp-conventional-commits'
        ---@type blink-cmp-conventional-commits.Options
        opts = {}, -- none so far
      },
    },
  },
})
