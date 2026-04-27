vim.cmd.source('$HOME/.config/vim/vimrc')

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
local augroup = vim.api.nvim_create_augroup('LspConfig', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end,
})
require('blink.cmp').setup({
  keymap = {
    preset = 'enter',
  },
  sources = {
    default = { 'lsp', 'path', 'buffer' },
  },
})
vim.lsp.enable('nixd')
vim.lsp.config('nixd', {
  capabilities = require('blink.cmp').get_lsp_capabilities()
})
