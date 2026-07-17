-- コマンドライン操作
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true })
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true })
vim.keymap.set('c', '<C-d>', '<Del>', { noremap = true })
-- 折り返し時に表示行単位で移動
vim.keymap.set('n', 'j', function()
  if vim.v.count == 0 then
    return 'gj'
  else
    return "m'" .. vim.v.count .. 'j'
  end
end, { expr = true })

vim.keymap.set('n', 'k', function()
  if vim.v.count == 0 then
    return 'gk'
  else
    return "m'" .. vim.v.count .. 'k'
  end
end, { expr = true })
vim.keymap.set('n', 'gb', '<cmd>bnext<CR>', {
  desc = 'Go to next buffer',
})
vim.keymap.set('n', 'gB', '<cmd>bprevious<CR>', {
  desc = 'Go to previouos buffer',
})
vim.keymap.set('n', '<C-x>', '<cmd>bdelete<CR>', {
  desc = 'Delete buffer',
})
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', {
  desc = 'Clear search highlight',
  silent = true,
})
vim.keymap.set('v', '<leader>y', '"+y', {
  desc = 'Yank selection to system clipboard',
})
vim.keymap.set('n', '<leader>Y', '"+yy', {
  desc = 'Yank line to system clipboard',
})
vim.keymap.set('t', '<C-[><C-[>', '<C-\\><C-n>', {
  desc = 'Switch to terminal normal mode',
})
vim.keymap.set('n', '<leader>ul', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, {
  desc = 'Toggle relative line number',
})
vim.keymap.set('n', '<leader>us', function()
  vim.opt.spell = not vim.opt_local.spell:get()
end, {
  desc = 'Toggle spell check',
})
vim.keymap.set('n', 'grd', function()
  vim.lsp.buf.definition()
end, {
  desc = 'LSP jump to definition',
})
