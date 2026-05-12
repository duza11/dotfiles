local M = {}

-- script / style 内か判定
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

function M.hover(opts)
  opts = opts or { border = 'solid' }

  -- HTML領域なら通常hover
  if not cursor_in_embedded_lang() then
    return vim.lsp.buf.hover(opts)
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

  local params = vim.lsp.util.make_position_params(
    winid,
    otter_client.offset_encoding
  )

  vim.lsp.buf_request_all(bufnr, 'textDocument/hover', params, function(results)
    for id, res in pairs(results) do
      local client = vim.lsp.get_client_by_id(id)
      if client
        and client.name:match('^otter')
        and res.result
        then
          vim.lsp.util.open_floating_preview(
            vim.lsp.util.convert_input_to_markdown_lines(res.result.contents),
            'markdown',
            opts
          )
          return
        end
      end
    end)
  end

  return M
