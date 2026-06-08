---@type vim.lsp.Config
return {
  on_attach = function(client, bufnr)
    if client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
}
