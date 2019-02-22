"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath

" Required:
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " Let dein manage dein
    " Required:

    " Add or remove your plugins here:

    " You can specify revision/branch/tag.
    let s:toml = '$HOME/.config/nvim'
    call dein#load_toml(s:toml . '/dein.toml', {'lazy': 0})
    call dein#load_toml(s:toml . '/dein_lazy.toml', {'lazy': 1})
    if has('python3')
        call dein#load_toml(s:toml . '/python.toml', {'lazy': 1})
    endif
    if !has('nvim' && v:version >= 800)
        call dein#load_toml(s:toml . '/vim8.toml', {'lazy': 1})
    endif

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------
