vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

local augroup = vim.api.nvim_create_augroup('LspConfig', {})

---@param count integer
---@return function
local diagnostic_jump = function(count)
  return function()
    vim.diagnostic.jump({
      count = count,
      float = true,
    })
  end
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', diagnostic_jump(-1), opts)
    vim.keymap.set('n', ']d', diagnostic_jump(1), opts)
  end,
})

require('blink.cmp').setup({
  keymap = {
    preset = 'enter',
  },
  sources = {
    default = { 'lsp', 'path', 'buffer' },
  },
  completion = {
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
    },
    documentation = {
      auto_show = true,
      window = { border = 'solid' },
    },
  },
  signature = {
    enabled = true,
    window = {
      border = 'solid',
      show_documentation = true,
    },
  },
})
vim.lsp.enable({ 'nixd', 'html', 'ts_ls', 'cssls', 'lua_ls' })
