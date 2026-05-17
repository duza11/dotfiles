-- 折り返し時に表示行単位で移動
vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

-- ESC連打で検索ハイライト解除
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', {
  desc = 'Clear search highlight',
  silent = true,
})

-- システムクリップボードへコピー
vim.keymap.set('v', '<leader>y', '"+y', {
  desc = 'Yank selection to system clipboard',
})
vim.keymap.set('n', '<leader>Y', '"+yy', {
  desc = 'Yank line to system clipboard',
})

vim.keymap.set('t', '<C-[><C-[>', '<C-\\><C-n>', {
  desc = 'Switch to terminal normal mode',
})
