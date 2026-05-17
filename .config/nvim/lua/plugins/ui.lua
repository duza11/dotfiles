return {
  {
    'rbtnn/vim-ambiwidth',
    init = function()
      vim.g.ambiwidth_cica_enabled = false
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {
      lsp = {
        progress = {
          enabled = true,
        },
        hover = {
          enabled = true,
          silent = true,
        },
        signature = {
          enabled = false,
        },
        message = {
          enabled = true,
        },
        documentation = {
          view = 'hover',
        },
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
    config = function(_, opts)
      require('notify').setup({
        background_colour = '#000000',
        merge_duplicates = true,
      })
      vim.notify = require('notify')
      require('noice').setup(opts)
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },
}
