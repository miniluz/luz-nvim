require("lualine").setup({
  extensions = {
    "fzf",
    "fugitive",
  },

  sections = {
    lualine_b = { "branch" },

    lualine_c = {
      {
        "filename",
        path = 1,
      },
    },

    lualine_x = {
      {
        "lsp_status",
        icon = "",
        color = { fg = "Gray" },
      },
    },
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
})
