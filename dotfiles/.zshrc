# # Path to your oh-my-zsh installation.
# export ZSH="/home/gcoda/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# source $ZSH/oh-my-zsh.sh

# plugins=(
#   git
#   archlinux
#   z
# )

# source $ZSH/oh-my-zsh.sh


# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
fi

# Auto-completion
# ---------------

[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
# eval "$(zoxide init zsh)"