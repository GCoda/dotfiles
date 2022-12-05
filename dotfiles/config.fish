function fish_greeting
   # ~/goTheroDate/date
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# fnm env --use-on-cd --shell fish | source

starship init fish | source

direnv hook fish | source

set -gx _ZO_EXCLUDE_DIRS "*_xwe*"
zoxide init fish | source

set -g direnv_fish_mode disable_arrow

# ! does nothing at all 
# carapace _carapace | source
 
if not status is-login
    if not test -z "$DISPLAY" -a "$XDG_VTNR" = 1
       #?
       #? Alt + V opens an editor for current command. too fancy
       #?
       export EDITOR="code --wait"
    end
end


set -gx FZF_COMMON_OPTIONS "
  --bind='?:toggle-preview'
  --bind='page-up:preview-half-page-up'
  --bind='page-down:preview-half-page-down'
  --preview-window 'down:50%:wrap'
  --preview '([[ -d {} ]] && tree -C {}) || ([[ -f {} ]] && bat --style=full --color=always {}) || echo {}'"


set -gx FZF_PREVIEW_OPTIONS '
if [[ -f {} ]]; then
    (file --mime {} | grep -q \"text\/.*;\" && bat --style=full --color=always {}) ||
    (file --mime {} | grep -q \"image\/.*;\" && catimg -w 80 {}) ||
    (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    tree -C {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
fi'

set -gx FZF_COMMON_OPTIONS_FANCY "
  --bind='?:toggle-preview'
  --bind='page-up:preview-half-page-up'
  --bind='page-down:preview-half-page-down'
  --preview-window 'down:70%:wrap'
  --preview \"$FZF_PREVIEW_OPTIONS\""

# --exclude node_modules
# --no-ignore-vcs
#    -p, --full-path
# -g, --glob
#  -u, --unrestricted


set -g FZF_CTRL_T_COMMAND 'fd --type f --type d --hidden --follow --exclude .git --strip-cwd-prefix'

set -gx FZF_CTRL_T_OPTS "--keep-right $FZF_COMMON_OPTIONS"
set -gx FZF_CTRL_R_OPTS "--keep-right $FZF_COMMON_OPTIONS --preview-window 'down:30%:wrap'"

# set -gx FZF_PREVIEW_COMMAND "bat --style=numbers,changes --wrap never --color always {} || cat {} || tree -C {}"
# set -gx FZF_CTRL_T_OPTS "--min-height 30 --preview-window down:60% --preview-window noborder --preview '$FZF_PREVIEW_COMMAND 2> /dev/null'"
#         FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'
# set -gx FZF_CTRL_T_OPTS "--keep-right --preview-window=down,30% --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# set -gx FZF_CTRL_T_OPTS "--keep-right --preview-window=down,30% --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# set -gx FZF_CTRL_T_OPTS "--keep-right --preview-window=down,30% --preview '([[ -d {} ]] && tree -C {}) || ([[ -f {} ]] && bat --style=full --color=always {}) || echo {}'"

function vsr -d "List recently opened files with vscode"
# /home/gcoda/.config/Code/User/globalStorage/storage.json
    set -l vscode_path "$HOME/.config/Code/User/globalStorage"
    set -l grep

    if type -q rg
        set grep rg -o --no-line-number
    else
        set grep grep -o
    end

    set -l selected (\
    $grep '"path": "/.*[^/]"' "$vscode_path/storage.json" \
    | string replace -a '"path": ' '' \
    | string trim -c '"'\
    | fzf --exit-0 )

    [ -n "$selected" ]; and code "$selected"
end


# function fish_user_key_bindings
#	 fzf_key_bindings
# end
