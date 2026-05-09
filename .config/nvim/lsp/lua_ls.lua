require('lazydev').setup()

return {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        pathStrict = true,
        path = { '?.lua', '?/init.lua' },
      },
      workspace = {
        library = vim.list_extend(vim.api.nvim_get_runtime_file('lua', true), {
          '${3rd}/luv/library',
          '${3rd}/busted/library',
          '${3rd}/luassert/library',
        }),
        checkThirdParty = false,
      },
    },
  },
}
