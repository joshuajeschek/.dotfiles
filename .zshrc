export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
export GTK_THEME="jarc-dark"

plugins=(git dotbare)
export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# add user local bin
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$PATH:$HOME/.local/bin"
  PATH="$PATH:$HOME/.nvm"
  PATH="$PATH:$HOME/.yarn/bin"
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# enable autojump
[[ -s /etc/profile.d/autojump.zsh ]] && source /etc/profile.d/autojump.zsh
# source /usr/share/autojump/autojump.sh

alias h=history
alias please=sudo
alias zshcfg="nvim ~/.zshrc && source ~/.zshrc"
alias kittycfg="nvim ~/.config/kitty/kitty.conf"
alias tt="taskwarrior-tui"
alias kk="vdirsyncer -v WARNING sync google; khal interactive; (vdirsyncer -v WARNING sync google &)"
alias den="code ~/dendron/dendron.code-workspace"
alias backup-config="mackup backup && ~/dotfiles/sync.sh"
alias save-command="source ~/.scripts/save-command.sh"
alias zshfetch="neofetch; zsh"
alias s="kitty +kitten ssh"
alias hg="history | grep"
alias sb="sudo ddcutil -d 1 setvcp 10"
alias SHUTDOWN="shutdown -h now"

hash -d Projects=~/Projects
hash -d Documents=/media/josh/main/Documents
hash -d Pictures=/media/josh/main/Pictures
hash -d Videos=/media/josh/main/Videos

# PROMPT='%{%K{black}%}%{%F{default}%}%(!.%{%F{yellow}%}.)🌈'$PROMPT
# RPROMPT="[%D{%f/%m/%y} | %D{%L:%M:%S}]"

export PATH="$HOME/.poetry/bin:$PATH"
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath+=${ZDOTDIR:-~}/.zsh_functions

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/josh/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/josh/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/josh/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/josh/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/.ghcup/bin:$PATH"
# [ -f "/home/josh/.ghcup/env" ] && source "/home/josh/.ghcup/env" # ghcup-env
# [ -f "/home/josh/.ghcup/env" ] && source "/home/josh/.ghcup/env" # ghcup-env
