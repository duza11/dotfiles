return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local npairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')
    local cond = require('nvim-autopairs.conds')
    --npairs.setup({ map_cr = true })
    npairs.setup({})
    npairs.add_rules({
      Rule('>[%w%s]*$', '^%s*</', { 'riot_v3' }):only_cr():use_regex(true),
      Rule('<[%w%s]*$', '^%s*/?>', { 'riot_v3' }):only_cr():use_regex(true),
      Rule('<!--', '-->', { 'riot_v3' }):with_cr(cond.none()),
    })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'riot_v3',
      },
      callback = function(args)
        vim.bo.indentexpr = 'v:lua.require"nvim-treesitter".indentexpr()'
      end,
    })
  end,
}
