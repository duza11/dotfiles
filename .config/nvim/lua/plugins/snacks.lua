return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      enabled = true,
      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    explorer = { enabled = true },
    indent = {
      enabled = true,
      animate = { enabled = false },
    },
    lazygit = { enable = true },
    picker = { enabled = true },
  },
  keys = {
    {
      '<leader>ff',
      function()
        Snacks.picker.files({ hidden = true })
      end,
      desc = 'Find files',
    },
    {
      '<leader>fb',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.recent()
      end,
      desc = 'Recent files',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.grep({ hidden = true })
      end,
      desc = 'Grep',
    },
    {
      '<leader>gs',
      function()
        Snacks.picker.git_status()
      end,
      desc = 'Git status',
    },
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<C-e>',
      function()
        Snacks.explorer({
          hidden = true,
          ignored = true,
        })
      end,
      desc = 'Toggle explorer',
    },
    {
      '<leader>tt',
      function()
        Snacks.terminal.toggle()
      end,
      desc = 'Toggle terminal',
    },
    {
      'cc',
      function()
        Snacks.picker.commands()
      end,
      desc = 'Commands',
    },
    {
      'ch',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command history',
    },
    {
      'gO',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'LSP symbols',
    },
    {
      'gri',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = 'LSP implementaions',
    },
    {
      'grr',
      function()
        Snacks.picker.lsp_references()
      end,
      desc = 'LSP referencs',
    },
    {
      'grt',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'LSP type definitions',
    },
  },
}
