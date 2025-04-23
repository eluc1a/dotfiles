# ~/.config/zsh/functions.zsh
# --------------------------
# Custom shell functions
# --- Add your additional functions below ---
# Example function template:
#
# function_name() {
#     # Description of what this function does
#     # Usage: function_name [arguments]
#     
#     # Function code
# }

# --- Shell Utilities ---

# thefuck command correction utility
# https://github.com/nvbn/thefuck
fuck() {
    # Save current Python IO encoding setting
    TF_PYTHONIOENCODING=$PYTHONIOENCODING
    
    # Set shell environment for thefuck
    export TF_SHELL=zsh
    export TF_ALIAS=fuck
    
    # Get current shell aliases
    TF_SHELL_ALIASES=$(alias)
    export TF_SHELL_ALIASES
    
    # Get recent command history
    TF_HISTORY="$(fc -ln -10)"
    export TF_HISTORY
    
    # Ensure proper encoding
    export PYTHONIOENCODING=utf-8
    
    # Run thefuck and evaluate its output
    TF_CMD=$(thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@) && eval $TF_CMD
    
    # Clean up
    unset TF_HISTORY
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING
    
    # Add the corrected command to history
    test -n "$TF_CMD" && print -s $TF_CMD
}


# Custom file finder function
ff() {
  local file=$(fzf --preview 'bat --style=numbers --color=always {}')
  if [[ -n $file ]]; then
    $EDITOR "$file"
  fi
}

# Custom directory jumper
fcd() {
  local dir=$(fd --type d | fzf)
  if [[ -n $dir ]]; then
    cd "$dir"
  fi
}

rgp() {
    rg --color=always --line-number --no-heading --smart-case "${*:-}" |
        fzf --ansi \
            --color "hl:-1:underline,hl+:-1:underline:reverse" \
            --delimiter : \
            --preview 'bat --color=always {1} --highlight-line {2}' \
            --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
}

# --- Search and Edit ---
# Search files and open in editor
search_and_edit() {
    local file=$(rg -l "$1" | fzf --preview "rg --color=always -n '$1' {}")
    if [[ -n $file ]]; then
        $EDITOR "$file"
    fi
}
alias se='search_and_edit'

# --- Directory Sizes ---
# Show directory sizes in human-readable format
duh() {
    du -h -d ${1:-1} | sort -hr
}

# Add basic search function to functions.zsh:
search_file() {
  fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
}

search_content() {
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf --ansi --preview 'bat --color=always $(echo {} | cut -d: -f1) --highlight-line $(echo {} | cut -d: -f2)'
}


viewfile() {
  if [[ $1 == *.md ]]; then
    glow "$1"cd notion
  else
    bat --paging=never "$1"
  fi
}
alias cat='viewfile'
