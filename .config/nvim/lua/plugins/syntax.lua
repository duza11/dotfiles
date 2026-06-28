vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').riot_v3 = {
      install_info = {
        url = 'https://github.com/duza11/tree-sitter-riot-v3',
        revision = '94c670ee3b808210674119886f0a1071fcb01af9',
        queries = 'queries/riot_v3',
      },
      tier = 2,
    }
  end,
})
return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install({
        'bash',
        'css',
        'go',
        'html',
        'lua',
        'nix',
        'markdown',
        'markdown_inline',
        'riot_v3',
        'scss',
        'toml',
        'tsx',
        'typescript',
        'javascript',
        'vim',
        'vimdoc',
        'yaml',
        'zsh',
      })
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'go',
          'html',
          'javascript',
          'lua',
          'nix',
          'markdown',
          'riot_v3',
          'scss',
          'toml',
          'typescript',
          'typescriptreact',
          'yaml',
        },
        callback = function(args)
          vim.treesitter.start()
          --すぐに実行すると何故か適用されないので遅延させる
          vim.defer_fn(function()
            if vim.api.nvim_buf_is_valid(args.buf) then
              vim.bo[args.buf].indentexpr = [[v:lua.require'nvim-treesitter'.indentexpr()]]
            end
          end, 100)
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
