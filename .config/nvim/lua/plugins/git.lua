return {
  {
    'tpope/vim-fugitive',
    cmd = {
      'Git',
      'G',
      'Gdiffsplit',
      'Gread',
      'Gwrite',
      'Ggrep',
      'GMove',
      'GRename',
      'GDelete',
      'GBrowse',
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
        map('n', '<leader>hb', gs.blame_line, 'Blame line')
      end,
    },
  },
}
