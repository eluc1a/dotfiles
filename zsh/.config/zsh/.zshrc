# ~/.zshrc
# --------
# Main ZSH configuration file

# --- SSH Agent ---
eval "$(ssh-agent)"
ssh-add ~/.ssh/phdata-bitbucket

# --- Powerlevel10k Instant Prompt ---
# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# In ~/.zprofile (preferred) or ~/.zshrc — near the top
# Restore macOS defaults for PATH and MANPATH
if [ -x /usr/libexec/path_helper ]; then
  eval "$(/usr/libexec/path_helper -s)"
fi

# Set a reliable pager
export PAGER="less -R"
export MANPAGER="less -R"
export EZA_CONFIG_DIR="$HOME/.config/eza"

# IMPORTANT: do NOT export MANPATH yourself elsewhere in your dotfiles

# --- Oh-My-Zsh Configuration ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#00a2af'

# Oh-My-Zsh plugins
plugins=(
  git                      # Git integration and aliases
  zsh-autosuggestions      # Fish-like autosuggestions
  git-extras               # Extra git commands
  zsh-syntax-highlighting  # Command syntax highlighting
  aliases                  # Alias Management
  alias-finder             # Find and manage aliases
  copyfile                 # Copy files to clipboard using copyfile <copy>
  copypath                 # Copy file paths to clipboard using copypath <copy>
  gcloud                   # Google Cloud SDK autocompletion
)

source $ZSH/oh-my-zsh.sh

# --- SSH Agent Setup (persistent across sessions) -----------------------------
SSH_ENV="$HOME/.ssh/agent-env"

# Function to start the ssh-agent and save environment
start_agent() {
    ssh-agent -s | sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    source "${SSH_ENV}" > /dev/null
    
    # Add your SSH keys
    SSH_KEYS=(
      ~/.ssh/mac_personal_github
      ~/.ssh/eluc1a-github
      ~/.ssh/id_rsa
      ~/.ssh/phdata-bitbucket
    )
    
    for key in "${SSH_KEYS[@]}"; do
      [[ -f $key ]] || continue
      if [[ $(uname) == Darwin ]]; then
        ssh-add --apple-use-keychain "$key" >/dev/null 2>&1
      else
        ssh-add "$key" >/dev/null 2>&1
      fi
    done
}

# Check if ssh-agent is running
if [ -f "${SSH_ENV}" ]; then
    source "${SSH_ENV}" > /dev/null
    # Check if the agent is still running
    if ! ps -p ${SSH_AGENT_PID} > /dev/null 2>&1; then
        start_agent
    elif ! ssh-add -l >/dev/null 2>&1; then
        # Agent is running but has no keys
        SSH_KEYS=(
          ~/.ssh/mac_personal_github
          ~/.ssh/eluc1a-github
          ~/.ssh/adtalem_github
          ~/.ssh/id_rsa
          ~/.ssh/phdata-bitbucket
        )
        
        for key in "${SSH_KEYS[@]}"; do
          [[ -f $key ]] || continue
          if [[ $(uname) == Darwin ]]; then
            ssh-add --apple-use-keychain "$key" >/dev/null 2>&1
          else
            ssh-add "$key" >/dev/null 2>&1
          fi
        done
    fi
else
    start_agent
fi



# --- Source Modular Config Files ---
# Load environment variables first as other configs may depend on them
source ~/.config/zsh/common/env.zsh  # Shared environment variables
source ~/.config/zsh/common/aliases.zsh
source ~/.config/zsh/common/functions.zsh
source ~/.config/zsh/common/completions.zsh

if [[ "$(uname)" == "Darwin" ]]; then
    source ~/.config/zsh/mac/env.zsh
    source ~/.config/zsh/mac/aliases.zsh
    source ~/.config/zsh/mac/functions.zsh
    source ~/.config/zsh/mac/completions.zsh
elif [[ "$(uname)" == "Linux" ]]; then
    source ~/.config/zsh/linux/env.zsh
    source ~/.config/zsh/linux/aliases.zsh
    source ~/.config/zsh/linux/functions.zsh
    source ~/.config/zsh/linux/completions.zsh
fi


# --- Additional Plugin Sources ---
# Source zsh-syntax-highlighting if it exists
# Note: Normally this is handled by the Oh-My-Zsh plugin, but keeping as backup
if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# --- Powerlevel10k Configuration ---
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Added by Windsurf
export PATH="/Users/ikhruschev/.codeium/windsurf/bin:$PATH"
export BAT_THEME="Coldark-Dark"
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=100000
unset LS_COLORS
#unset EZA_COLORS
eval "$(direnv hook zsh)"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ikhruschev/.lmstudio/bin"
# End of LM Studio CLI section
# export ANTHROPIC_MODEL="claude-sonnet-4-5-20250929"

source "$HOME/.cargo/env"

export PATH=$PATH:/Users/ikhruschev/.spicetify
alias sfaccount='echo "jsc43514.us-east-1"'

# Added by Antigravity
export PATH="/Users/ikhruschev/.antigravity/antigravity/bin:$PATH"
export CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
export AWS_PROFILE=personal
