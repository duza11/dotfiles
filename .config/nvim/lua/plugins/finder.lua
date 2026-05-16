return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    keys = {
      {
        '<leader>ff',
        '<cmd>Telescope find_files<cr>',
        desc = 'Find files',
      },
      {
        '<leader>fG',
        '<cmd>Telescope git_status<cr>',
        desc = 'Git status',
      },
      {
        '<leader>fb',
        '<cmd>Telescope buffers<cr>',
        desc = 'Buffers',
      },
      {
        '<leader>fr',
        '<cmd>Telescope oldfiles<cr>',
        desc = 'File recent files',
      },
      {
        '<leader>fg',
        '<cmd>Telescope live_grep<cr>',
        desc = 'Grep',
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ['<Esc>'] = function(bufnr)
              require('telescope.actions').close(bufnr)
            end,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { '.git/' },
          hidden = true,
        },
        live_grep = {
          file_ignore_patterns = { '.git/' },
          additional_args = function()
            return { '--hidden' }
          end,
        },
      },
    },
    config = function(_, opts)
      local telescope = require('telescope')
      telescope.setup(opts)

      pcall(telescope.load_extension, 'fzf')
    end,
  },
}
