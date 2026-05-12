require('nvim-treesitter').install {
  'html',
  'javascript',
  'css',
}

-- Riot.jsのファイルはHTMLとして扱う
vim.treesitter.language.register('html', 'riot')

-- otter設定
require('otter').setup({
  lsp = {
    diagnostic_update_events = { 'TextChanged' },
  },
})
-- HTML、Riot.jsのJavaScriptとCSSで補完が行われるようにする
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'html', 'riot' },
  callback = function()
    require('otter').activate({ 'javascript', 'css' })
  end,
})
