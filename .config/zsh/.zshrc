export LANG=ja_JP.UTF-8

HISTSIZE=100000
SAVEHIST=200000

setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history

setopt auto_cd

alias ls='ls -F --color=auto'
alias l='ls'
alias la='ls -FA --color=auto'
alias ll='ls -Flh --color=auto'
alias lla='ls -FAlh --color=auto'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias gcd='cd "$(ghq list --full-path | fzf --height 40%)"'

source <(fzf --zsh)
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob="!.git/*"'

setopt PROMPT_SUBST
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b%c%u)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'

C_SSH="%B%F{red}"
C_SUDO="%B%F{red}"
C_USER="%B%F{green}"
C_HOST="%B%F{cyan}"
C_DIR="%B%F{blue}"
C_GIT="%B%F{magenta}"
C_RESET="%b%f"
PROMPT='$( [ -n "$SSH_CONNECTION" ] && printf "%s[SSH]%s " "$C_SSH" "$C_RESET" )'\
'$( [ -n "$SUDO_USER" ] && printf "%s!%s " "$C_SUDO" "$C_RESET" )'\
"$C_USER%n$C_RESET@$C_HOST%m$C_RESET "\
"$C_DIR%~$C_RESET "\
'$( [ -n "$vcs_info_msg_0_" ] && printf "%s%s%s" "$C_GIT" "$vcs_info_msg_0_" "$C_RESET" )'\
$'\n%# '
