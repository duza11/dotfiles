[[ $- != *i* ]] && return

# Global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User setting environment
add_path() {
	case ":$PATH:" in
		*":$1:"*) ;;
		*) PATH="$1:$PATH" ;;
	esac
}

add_path "$HOME/.local/bin"
add_path "$HOME/bin"
export PATH
unset -f add_path

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# History
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups
PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"

# Aliases
alias ls='ls -F --color=auto'
alias l='ls'
alias la='ls -FA --color=auto'
alias ll='ls -Flh --color=auto'
alias lla='ls -FAlh --color=auto'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

gcd() {
	local dir=$(ghq list --full-path | fzf --height 40% \
		--preview "bat --color=always --style=header,grid --line-range :30 {}/README.*")
	[ -n "$dir" ] && cd "$dir"
}

alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

# User rc fragments
if [ -d "$HOME/.bashrc.d" ]; then
	shopt -s nullglob
	for rc in "$HOME"/.bashrc.d/*.bash; do
		. "$rc"
	done
	shopt -u nullglob
fi

# fzf
eval "$(fzf --bash)"

# Prompt
C_SSH="\[\e[1;31m\]"
C_SUDO="\[\e[1;31m\]"
C_USER="\[\e[1;32m\]"
C_HOST="\[\e[1;36m\]"
C_DIR="\[\e[1;34m\]"
C_GIT="\[\e[1;35m\]"
C_RESET="\[\e[0m\]"

PS1='$( [ -n "$SSH_CONNECTION" ] && printf "'"$C_SSH"'[SSH]'"$C_RESET"' " )'\
'$( [ -n "$SUDO_USER" ] && printf "'"$C_SUDO"'!'"$C_RESET"' " )'\
"$C_USER\u$C_RESET@$C_HOST\h$C_RESET "\
"$C_DIR\w$C_RESET"\
'$( command -v __git_ps1 >/dev/null 2>&1 && __git_ps1 " '"$C_GIT"'(%s)'"$C_RESET"'" )'\
"\n\$ "

# Shell options
shopt -s autocd
shopt -s histappend

# Local / secret settings
[ -f "$HOME/.bashrc.local" ] && . "$HOME/.bashrc.local"

