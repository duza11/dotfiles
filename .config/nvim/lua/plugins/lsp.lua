--- script / style 内か判定
--- @return boolean
local function cursor_in_embedded_lang()
  local node = vim.treesitter.get_node()
  while node do
    local t = node:type()
    if t == 'script_element' or t == 'style_element' then
      return true
    end
    node = node:parent()
  end
  return false
end

local function hover()
  -- HTML領域なら通常hover
  if not cursor_in_embedded_lang() then
    return vim.lsp.buf.hover()
  end

  -- script/style内ならotterの情報のみ
  local bufnr = vim.api.nvim_get_current_buf()
  local winid = vim.api.nvim_get_current_win()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  local otter_client
  for _, c in ipairs(clients) do
    if c.name:match('^otter') then
      otter_client = c
      break
    end
  end
  if not otter_client then
    return
  end

  local params = vim.lsp.util.make_position_params(winid, otter_client.offset_encoding)

  vim.lsp.buf_request_all(bufnr, 'textDocument/hover', params, function(results)
    for id, res in pairs(results) do
      local client = vim.lsp.get_client_by_id(id)
      if client and client.name:match('^otter') and res.result then
        vim.lsp.util.open_floating_preview(
          vim.lsp.util.convert_input_to_markdown_lines(res.result.contents),
          'markdown'
        )
        return
      end
    end
  end)
end

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
        preset = 'enter',
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
          local opts = { buffer = args.buf, silent = true }
          vim.keymap.set('n', 'K', hover, opts)
        end,
      })

      vim.lsp.enable({
        'cssls',
        'emmet_language_server',
        'eslint',
        'html',
        'jsonls',
        'lua_ls',
        'nixd',
        'ts_ls',
      })
    end,
  },
}
