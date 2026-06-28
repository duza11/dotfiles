-- =========================
-- Basic
-- =========================
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- バックアップファイルを作らない
vim.opt.backup = false
-- スワップファイルを作らない
vim.opt.swapfile = false
-- 編集中のファイルが変更されたら自動で読み直す
vim.opt.autoread = true
-- バッファが編集中でもその他のファイルを開けるように
vim.opt.hidden = true
-- 入力中のコマンドをステータスに表示する
vim.opt.showcmd = true
-- splitは下に開く
vim.opt.splitbelow = true
-- vplistは右に開く
vim.opt.splitright = true

-- =========================
-- Appearance
-- =========================
-- 行番号を表示
vim.opt.number = true
-- 行番号の相対表示
vim.opt.relativenumber = true
-- 現在の行を強調表示
vim.opt.cursorline = true
-- 現在の列を強調表示
vim.opt.cursorcolumn = true
-- 行末の1文字先までカーソルを移動できるように
vim.opt.virtualedit = 'onemore'
-- インデントはスマートインデント
vim.opt.smartindent = true
-- ビープ音を可視化
vim.opt.visualbell = true
-- 括弧入力時の対応する括弧を表示
vim.opt.showmatch = true
-- ステータスラインを常に表示
vim.opt.laststatus = 2
-- コマンドラインの補完
vim.opt.wildmode = 'list:longest'
-- syntax on
vim.cmd('syntax enable')
-- スペルチェック
vim.opt.spell = true
vim.opt.spelllang = { 'en', 'cjk' }
-- フローティングウィンドウの枠線
vim.opt.winborder = 'rounded'
-- 診断情報
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      return string.format('%s (%s: %s)', diagnostic.message, diagnostic.source, diagnostic.code)
    end,
  },
  signs = true,
  underline = true,
})
-- 折りたたみ
vim.opt.foldlevel = 99
vim.opt.fillchars = {
  eob = ' ',
  foldclose = '>',
  foldopen = 'v',
  foldsep = ' ',
  foldinner = ' ',
}
vim.opt.foldcolumn = '1'
-- diffハイライト
vim.cmd([[highlight DiffAdd guibg=#214821]])
vim.cmd([[highlight DiffChange guibg=#303030]])
vim.cmd([[highlight DiffDelete guibg=#4c1e15]])
vim.cmd([[highlight DiffText guibg=#454545]])
-- CursorHold発火までの時間
vim.opt.updatetime = 500

-- =========================
-- Tab / Indent
-- =========================
-- 不可視文字を可視化
vim.opt.list = true
vim.opt.listchars = {
  tab = '▸-',
}
-- Tab文字を半角スペースにする
vim.opt.expandtab = true
-- Tab文字の表示幅
vim.opt.tabstop = 2
-- インデント幅
vim.opt.shiftwidth = 2
-- shではタブをスペースに展開しない
vim.api.nvim_create_augroup('FileTypeIndent', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = 'FileTypeIndent',
  pattern = 'sh',
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

-- =========================
-- Search
-- =========================
-- 検索文字列が小文字の場合は大文字小文字を区別しない
vim.opt.ignorecase = true
-- 検索文字列に大文字が含まれている場合は区別する
vim.opt.smartcase = true
-- 検索文字列入力時に順次対象文字列にヒットさせる
vim.opt.incsearch = true
-- 検索時に最後まで行ったら最初に戻る
vim.opt.wrapscan = true
-- 検索語をハイライト表示
vim.opt.hlsearch = true

-- =========================
-- FileType
-- =========================
vim.filetype.add({
  extension = {
    tag = 'riot_v3',
  },
})
