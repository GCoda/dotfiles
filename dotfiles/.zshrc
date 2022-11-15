
##export TERM=fbtermm
source ~/.bashrc

# Just for Tmuxinator sake
export EDITOR=vim

export TERM=xterm-256color

export NPM_PACKAGES="$HOME/.npm-packages"

# Tell Node about these packages
export ANDROID_HOME="/home/gcoda/Android/Sdk"
export PATH=$PATH:~/.gem/ruby/2.2.0/bin/:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Personal tools
export PATH=$PATH:~/.bin
alias cd-git-root='cd $(git rev-parse --show-cdup)'
alias s='sudo -s' #sudo with zsh
alias o='xdg-open'

source /usr/share/zsh/scripts/antigen/antigen.zsh

antigen use oh-my-zsh

export DEFAULT_USER=gcoda

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status node_version time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_COLOR_SCHEME='light'

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen bundle Vifon/deer deer
zle -N deer-launch
bindkey '\ek' deer-launch

# launch vifm with simmetric shortcut
# git clone https://github.com/vifm/vifm-colors ~/.vifm/colors
bindkey -s '\ed' 'vifm\n'

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle tmuxinator
antigen bundle rupa/z

antigen bundle tarruda/zsh-autosuggestions
antigen bundle node
antigen bundle npm

antigen bundle robbyrussell/oh-my-zsh plugins/archlinux

antigen bundle robbyrussell/oh-my-zsh plugins/grunt 
antigen bundle robbyrussell/oh-my-zsh plugins/sudo #press Esc Esc to sudo command

autoload -Uz compinit
compinit

export NODE_PATH=$NODE_PATH:$HOME/n/lib/node_modules
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
