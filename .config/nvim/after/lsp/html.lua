---@type vim.lsp.Config
return {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html', 'riot_v3' },
  root_markers = { '.git' },
  init_options = {
    provideFormatter = true,
    configurationSection = { 'html', 'css', 'javascript' },
  },
}
