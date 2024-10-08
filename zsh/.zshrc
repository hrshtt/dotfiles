HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
setopt autocd beep extendedglob
bindkey -v
#bindkey -s jj '\e'
bindkey jj vi-cmd-mode

export EDITOR=nvim

export NNN_COLORS="2136"                           # use a different color for each context

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST

function set_prompt_username {
    if [[ $PWD == $HOME ]]; then
	    echo "%F{#38E54D}%B%D{%d-%b-%Y %H:%M}%b%f %K{#292929}%F{#FFFFFF}%B %n%b%f%k%F{#292929}%f "
    else
        echo "%F{#38E54D}%B%T%b%f %F{#64f1ff}%~%f "
    fi
}

COOL_GREEN="#15F5BA"

PROMPT='%F{#61A9D8}░▒▓ %f$(set_prompt_username)%F{red}${vcs_info_msg_0_}%f%F{#FB7E14}%Bλ%b%f '

source $HOME/.aliases
source $HOME/.private-zshrc

eval "$(zoxide init --cmd cd zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
