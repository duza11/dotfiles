return {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = {
    'css',
    'scss',
    'less',
  },
  capabilities = require('blink.cmp').get_lsp_capabilities(),
  root_markers = { '.git' },
}
