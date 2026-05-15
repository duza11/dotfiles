vim.api.nvim_create_augroup('MyAutoCmd', { clear = true })

-- Riot.js v3はHTMLとして扱う
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'MyAutoCmd',
  pattern = '*.tag',
  command = 'set filetype=riot',
})
