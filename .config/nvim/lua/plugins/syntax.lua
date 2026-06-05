return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install({
        'bash',
        'css',
        'html',
        'lua',
        'nix',
        'markdown',
        'markdown_inline',
        'scss',
        'toml',
        'typescript',
        'javascript',
        'vim',
        'vimdoc',
        'yaml',
        'zsh',
      })
      vim.treesitter.language.register('html', 'riot_v3')
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'html',
          'lua',
          'nix',
          'markdown',
          'scss',
          'toml',
          'typescript',
          'javascript',
          'yaml',
        },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },

  {
    'jmbuhr/otter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      lsp = {
        diagnostic_update_events = { 'TextChanged' },
      },
    },
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'html', 'riot_v3' },
        callback = function()
          require('otter').activate({ 'javascript', 'css' })
        end,
      })
    end,
  },
}
