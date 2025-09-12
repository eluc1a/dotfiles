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
  # ── plain mode ──────────────────────────────────────────────────────────────
  if [[ $1 == "-c" || $1 == "--clean" ]]; then
    shift                      # drop the flag
    command cat "$@"           # bypass the alias / function
    return
  fi

  # ── fancy mode (default) ───────────────────────────────────────────────────
  if (( $# == 0 )); then       # no files → behave like cat on stdin
    command cat
    return
  fi

  for f in "$@"; do            # allow multiple files
    if [[ $f == *.md ]]; then
      glow "$f"
    else
      bat --paging=never "$f"
    fi
  done
}

alias cat='viewfile'

# Live-update JankyBorders
setborder () {
  local color_arg=""
  local width_arg=""
  local seen_color=0

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -c|--color)                       # short colour, prepend 0xff
        [[ $seen_color -eq 1 ]] && { echo "Error: choose -c *or* -cc"; return 1; }
        [[ $2 =~ ^[0-9a-fA-F]{6}$ ]] || { echo "Error: -c expects 6-digit hex (e.g. c56fec)"; return 1; }
        color_arg="active_color=0xff$2"
        seen_color=1
        shift 2 ;;
      -cc|--color-complete)             # full ARGB code
        [[ $seen_color -eq 1 ]] && { echo "Error: choose -c *or* -cc"; return 1; }
        [[ $2 =~ ^0x[0-9a-fA-F]{8}$ ]] || { echo "Error: -cc expects 0xAARRGGBB (e.g. 0xffc56fec)"; return 1; }
        color_arg="active_color=$2"
        seen_color=1
        shift 2 ;;
      -w|--width)                       # width in points
        [[ $2 =~ ^[0-9]+(\.[0-9]+)?$ ]] || { echo "Error: width must be a number"; return 1; }
        width_arg="width=$2"
        shift 2 ;;
      *)
        echo "Usage: setborder [-c RRGGBB | -cc 0xAARRGGBB] [-w FLOAT]"; return 1 ;;
    esac
  done

  /opt/homebrew/bin/borders $color_arg $width_arg
}

# Use Bloom instead of Finder
bloom() {
  if [ -z "$1" ]; then
    open -a Bloom .
  else
    open -a Bloom "$@"
  fi
}

# Alias "open" to your function
alias open=bloom
