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
vim.keymap.set('n', '<leader>ll', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, {
  desc = 'Toggle relative line number',
})
