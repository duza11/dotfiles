return {
  {
    'sindrets/diffview.nvim',
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          winbar_info = true,
        },
        history = {
          winbar_info = true,
        },
      },
      file_panel = {
        listing_style = 'tree',
      },
      keymaps = {
        view = {
          { 'n', 'q', '<cmd>DiffviewClose<CR>', desc = 'Close Diffview' },
        },
        file_panel = {
          { 'n', 'q', '<cmd>DiffviewClose<CR>', desc = 'Close Diffview' },
        },
        file_history_panel = {
          { 'n', 'q', '<cmd>DiffviewClose<CR>', desc = 'Close Diffview' },
        },
      },
    },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = 'Git diff (working tree)' },
      { '<leader>gD', '<cmd>DiffviewOpen HEAD~1<CR>', desc = 'Git diff (preview commit)' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<CR>', desc = 'File history' },
      { '<leader>gH', '<cmd>DiffviewFileHistory<CR>', desc = 'Branch history' },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    opts = {
      current_line_blame = true,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, {
            buffer = bufnr,
            silent = true,
            desc = desc,
          })
        end

        map('n', ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(gs.next_hunk)
          return '<Ignore>'
        end, 'Next git hunk')

        map('n', '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(gs.prev_hunk)
          return '<Ignore>'
        end, 'Previous git hunk')

        map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
        map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')
        map('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')
        map('n', '<leader>gb', function()
          gs.blame_line({ full = true })
        end, 'Blame line')
        map('n', '<leader>gB', gs.toggle_current_line_blame, 'Toggle blame')
      end,
    },
  },
}
