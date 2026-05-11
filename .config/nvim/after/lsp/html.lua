return {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html', 'riot' },
  root_markers = { '.git' },
  init_options = {
    provideFormatter = true,
    configurationSection = { 'html', 'css', 'javascript' },
  },
}
