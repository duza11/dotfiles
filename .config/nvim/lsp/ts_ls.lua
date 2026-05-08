return {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  capabilities = require('blink.cmp').get_lsp_capabilities(),
  root_markers = {
    'package.json',
    'tsconfig.json',
    'jsconfig.json',
    '.git'
  },
}
