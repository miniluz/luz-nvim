require('js-i18n').setup({})

local function pick_language_then_action(action_fn)
  return function()
    vim.ui.select(
      {"en", "es"},
      { prompt = "Select i18n language:" },
      function(choice)
        if choice then
          action_fn(choice)
        end
      end
    )
  end
end

vim.keymap.set('n', '<leader>itv', '<cmd>I18nVirtualTextToggle<CR>', {
  silent = true,
  desc = 'Toggle i18n virtual text'
})

vim.keymap.set('n', '<leader>itd', '<cmd>I18nDiagnosticToggle<CR>', {
  silent = true,
  desc = 'Toggle i18n diagnostics'
})

vim.keymap.set('n', '<leader>il', pick_language_then_action(function(choice)
  vim.cmd("I18nSetLang " .. choice)
end), {
  silent = true,
  desc = 'Select i18n language'
})

vim.keymap.set('n', '<leader>ig', '<cmd>I18nEditTranslation<CR>', {
  silent = true,
  desc = 'Go to (or create) translation'
})

vim.keymap.set('n', '<leader>iG', pick_language_then_action(function(choice)
  vim.cmd("I18nEditTranslation " .. choice)
end), {
  silent = true,
  desc = 'Go to (or create) translation selecting language'
})
