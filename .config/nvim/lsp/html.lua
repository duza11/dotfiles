return {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html', 'riot' },
  capabilities = require('blink.cmp').get_lsp_capabilities(),
  root_markers = { '.git' },
  init_options = {
    provideFormatter = true,
    configurationSection = { 'html', 'css', 'javascript' },
  },
}
