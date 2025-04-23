# ~/.config/zsh/completions.zsh
# ----------------------------
# ZSH completion system configuration

# --- Completion System Configuration ---
# Uncomment if you want to customize completion behavior
# zstyle ':completion:*' menu select                # Use menu selection for completion
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Match ls colors
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Case insensitive matching

# --- Custom Completions ---
# Add custom completion functions here

# Example:
# Custom git completion for specific company workflow
# _custom_git_flow() {
#   local -a commands
#   commands=(
#     'feature:Create a new feature branch'
#     'bugfix:Create a branch for fixing a bug'
#     'release:Create a release branch'
#   )
#   _describe -t commands 'custom git commands' commands
# }
# compdef _custom_git_flow git-flow

# --- Search in files with preview ---
# Search in files with preview


# --- FZF Configuration ---
# fzf completion and key bindings
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi

