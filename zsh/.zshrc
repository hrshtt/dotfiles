HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
setopt autocd beep extendedglob
bindkey -v
#bindkey -s jj '\e'
bindkey jj vi-cmd-mode

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

alias ls="ls --color=auto"
alias ll='exa --long --git --group --classify --all'
alias l='exa --long --git --group --classify'

eval "$(zoxide init --cmd cd zsh)"
