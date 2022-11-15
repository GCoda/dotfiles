# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Personal tools
alias cd-git-root='cd $(git rev-parse --show-cdup)'
alias o='xdg-open'
alias ls='ls --color=auto'

# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.bash"

eval "$(starship init bash)"