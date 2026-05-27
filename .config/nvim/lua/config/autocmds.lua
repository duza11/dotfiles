vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    vim.fn.matchadd('ExtraWhitespace', '[\\u00A0\\u2000-\\u200B\\u3000]')
    vim.api.nvim_set_hl(0, 'ExtraWhitespace', {
      bg = 'darkmagenta',
      ctermbg = 'darkmagenta',
      default = true,
    })
  end,
})
