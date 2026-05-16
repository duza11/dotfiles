---@param range_start integer 上書きする文字コードの開始位置
---@param range_end integer 上書きする文字コードの終了位置
---@param width integer 変更後の文字幅
local function override_width(range_start, range_end, width)
  local widths = vim.fn.getcellwidths()
  local filtered = {}

  for _, w in ipairs(widths) do
    if not (w[1] <= range_end and w[2] >= range_start) then
      table.insert(filtered, w)
    end
  end

  table.insert(filtered, { range_start, range_end, width })
  vim.fn.setcellwidths(filtered)
end

return {
  {
    'rbtnn/vim-ambiwidth',
    config = function()
      -- Powerline用の文字の幅を上書き
      vim.schedule(function()
        override_width(0xe0b0, 0xe0b3, 1)
      end)
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
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup()
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
