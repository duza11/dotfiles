" fzfプラグインはnix管理のものを使う
let s:fzf_bin = systemlist('readlink -f $(which fzf)')[0]
execute 'set runtimepath+=' . fnamemodify(s:fzf_bin, ':h:h') . '/share/vim-plugins/fzf'
