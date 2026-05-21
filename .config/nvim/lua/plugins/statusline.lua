return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'SmiteshP/nvim-navic',
    },
    opts = {
      options = {
        theme = 'onedark',
        component_separators = {
          left = '',
          right = '',
        },
        section_separators = {
          left = '',
          right = '',
        },
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          'diff',
        },
        lualine_c = {
          {
            'filename',
            path = 1,
          },
          {
            'navic',
            cond = function()
              return require('nvim-navic').is_available()
            end,
            color_correction = 'dynamic',
          },
        },
        lualine_x = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
          },
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      tabline = {
        lualine_a = {
          {
            'buffers',
            mode = 4,
          },
        },
        lualine_z = { 'tabs' },
      },
    },
  },
  {
    'SmiteshP/nvim-navic',
    event = { 'BufNewFile', 'BufReadPre' },
    opts = {
      depth_limit = 3,
      lsp = {
        auto_attach = true,
      },
      highlight = true,
    },
    dependencies = {
      'neovim/nvim-lspconfig',
    },
  },
}
