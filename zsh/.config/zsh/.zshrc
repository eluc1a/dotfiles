# ~/.zshrc
# --------
# Main ZSH configuration file

# --- Powerlevel10k Instant Prompt ---
# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


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

# --- SSH Agent Setup (quiet & cross-platform) -----------------------------
if [[ -z $SSH_AUTH_SOCK || ! -S $SSH_AUTH_SOCK ]]; then
  # Start the agent, but filter out the noisy "echo Agent pid NNN" line.
  eval "$(ssh-agent -s 2>/dev/null | grep -v '^echo')"
fi

SSH_KEYS=(
  ~/.ssh/mac_personal_github
  ~/.ssh/adtalem_github
  ~/.ssh/id_rsa
)

for key in "${SSH_KEYS[@]}"; do
  [[ -f $key ]] || continue
  if [[ $(uname) == Darwin ]]; then
    ssh-add -K "$key"   >/dev/null 2>&1   # store passphrase in macOS Keychain
  else
    ssh-add    "$key"   >/dev/null 2>&1   # normal add, no FIDO prompt
  fi
done



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
export PATH="/Users/ilyakhruschev/.codeium/windsurf/bin:$PATH"
export BAT_THEME="Coldark-Dark"
unset LS_COLORS
unset EZA_COLORS
eval "$(direnv hook zsh)"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ilyakhruschev/.lmstudio/bin"
# End of LM Studio CLI section

source "$HOME/.cargo/env"
