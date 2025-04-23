# ~/.config/zsh/functions.common.zsh
# ----------------------------------
# Custom shell functions that work on any platform

# --- thefuck integration --------------------------------------------
fuck() {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING
    export TF_SHELL=zsh TF_ALIAS=fuck
    export TF_SHELL_ALIASES=$(alias)
    export TF_HISTORY="$(fc -ln -10)"
    export PYTHONIOENCODING=utf-8

    TF_CMD=$(thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@") && eval "$TF_CMD"

    unset TF_HISTORY
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING
    [[ -n $TF_CMD ]] && print -s "$TF_CMD"
}

# --- File / dir pickers ---------------------------------------------
ff() {                              # pick a file, open in $EDITOR
  local file=$(fzf --preview 'bat --style=numbers --color=always {}')
  [[ -n $file ]] && $EDITOR "$file"
}

fcd() {                             # pick a directory, cd into it
  local dir=$(fd --type d | fzf)
  [[ -n $dir ]] && cd "$dir"
}

# --- ripgrep + fzf power‑combo --------------------------------------
rgp() {
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf --ansi                       \
        --color "hl:-1:underline,hl+:-1:underline:reverse" \
        --delimiter : \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
}

# --- Search and edit -------------------------------------------------
search_and_edit() {
  local file
  file=$(rg -l "$1" | fzf --preview "rg --color=always -n '$1' {}")
  [[ -n $file ]] && $EDITOR "$file"
}
alias se='search_and_edit'

# --- Directory sizes -------------------------------------------------
duh() { du -h -d "${1:-1}" | sort -hr; }

# --- Quick search helpers -------------------------------------------
search_file() {
  fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
}

search_content() {
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf --ansi \
        --preview 'bat --color=always $(echo {} | cut -d: -f1) --highlight-line $(echo {} | cut -d: -f2)'
}

# --- Viewer that pretties up Markdown -------------------------------
viewfile() {
  if [[ $1 == *.md ]]; then
    glow "$1"
  else
    bat --paging=never "$1"
  fi
}
alias cat='viewfile'
