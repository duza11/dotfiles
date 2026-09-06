---@type vim.lsp.Config
return {
  name = 'riot_v3_ls',
  cmd = {
    'riot-v3-language-server',
    '--stdio',
  },
  filetypes = { 'riot_v3' },
  root_markers = { 'package.json', 'tsconfig.json', 'tsconfig.json', '.git' },
  init_options = {
    riotV3 = {
      allowDynamicPropertiesFromAnyAssignments = true,
      reportUnusedComponentMembers = true,
    },
  },
}
