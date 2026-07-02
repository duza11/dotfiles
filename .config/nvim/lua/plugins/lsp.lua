return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        {
          path = 'luvit-meta/library',
          words = { 'vim%.uv' },
        },
      },
    },
    dependencies = {
      {
        'Bilal2453/luvit-meta',
        lazy = true,
      },
    },
  },

  {
    'saghen/blink.cmp',
    version = '1.*',
    event = {
      'InsertEnter',
      'CmdlineEnter',
    },
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    opts = {
      keymap = {
        -- https://github.com/Saghen/blink.cmp/issues/547
        ['<Esc>'] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.cancel()
            end
          end,
          'fallback',
        },
        ['<CR>'] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.accept()
            end
          end,
          'fallback',
        },
      },
      appearance = {
        nerd_font_variant = 'mono',
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
        },
      },
      sources = {
        default = {
          'lsp',
          'path',
          'snippets',
          'buffer',
        },
      },
      signature = {
        enabled = true,
        window = {
          show_documentation = true,
        },
      },
      fuzzy = {
        implementation = 'prefer_rust_with_warning',
      },
      cmdline = {
        keymap = {
          -- https://github.com/Saghen/blink.cmp/issues/547
          ['<Esc>'] = {
            function(cmp)
              if cmp.is_visible() then
                cmp.cancel()
              else
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-c>', true, true, true), 'n', true)
              end
            end,
          },
          ['<CR>'] = {
            function(cmp)
              if cmp.is_menu_visible() then
                return cmp.accept()
              end
            end,
            'fallback',
          },
        },
      },
    },
    opts_extend = {
      'sources.default',
    },
  },

  {
    'neovim/nvim-lspconfig',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    dependencies = {
      'saghen/blink.cmp',
    },
    config = function()
      local augroup = vim.api.nvim_create_augroup('LspConfig', {})

      vim.api.nvim_create_autocmd('LspAttach', {
        group = augroup,
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method('textDocument/documentHighlight') then
            local group = vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = args.buf,
              group = group,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI', 'BufLeave' }, {
              buffer = args.buf,
              group = group,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      vim.lsp.enable({
        'cssls',
        'emmet_language_server',
        'eslint',
        'gopls',
        'html',
        'jsonls',
        'lua_ls',
        'nixd',
        'riot_v3_ls',
        'stylelint_lsp',
        'ts_ls',
      })
    end,
  },
}
