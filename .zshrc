# zmodload zsh/zprof
export ZSH="$HOME/.oh-my-zsh"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

ZSH_THEME="agnoster"

plugins=(git dotbare)
export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# add user local bin
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$PATH:$HOME/.local/bin"
  PATH="$PATH:$HOME/.nvm"
  PATH="$PATH:$HOME/.yarn/bin"
fi

# (&>/dev/null wal -R &)

alias h=history
alias please=sudo
alias dog=cat
alias more=less
alias open=xdg-open
alias nivm=nvim
alias zshcfg="nvim ~/.zshrc && source ~/.zshrc"
alias kittycfg="nvim ~/.config/kitty/kitty.conf"
alias tt="taskwarrior-tui"
alias kk="vdirsyncer -v WARNING sync google; khal interactive; (vdirsyncer -v WARNING sync google &)"
alias den="code ~/dendron/dendron.code-workspace"
alias backup-config="mackup backup && ~/dotfiles/sync.sh"
alias save-command="source ~/.scripts/save-command.sh"
alias zshfetch="neofetch; zsh"
alias s="kitty +kitten ssh"
alias c="wl-copy"
alias v="wl-paste"
alias hg="history | grep"
alias sb="sudo ddcutil -d 1 setvcp 10"
alias SHUTDOWN="shutdown -h now"
alias timesync="sudo ntpd -qg && sudo hwclock --systohc"

hash -d Projects=~/Projects
hash -d Documents=/media/josh/main/Documents
hash -d Pictures=/media/josh/main/Pictures
hash -d Videos=/media/josh/main/Videos

# PROMPT='%{%K{black}%}%{%F{default}%}%(!.%{%F{yellow}%}.)🌈'$PROMPT
# RPROMPT="[%D{%f/%m/%y} | %D{%L:%M:%S}]"

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export EDITOR="/usr/bin/nvim"
export ZVM_VI_EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export STARSHIP_LOG="error"
export SUDO_PROMPT=$'\a[sudo] please enter your password: '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath+=${ZDOTDIR:-~}/.zsh_functions


[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
# export PATH="/opt/anaconda/bin:$PATH"  # commented out by conda initialize
# [ -f "/home/josh/.ghcup/env" ] && source "/home/josh/.ghcup/env" # ghcup-env
# [ -f "/home/josh/.ghcup/env" ] && source "/home/josh/.ghcup/env" # ghcup-env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
eval "$(starship init zsh)"
# zprof

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/home/josh/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;