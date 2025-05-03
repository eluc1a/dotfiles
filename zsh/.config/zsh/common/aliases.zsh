# ~/.config/zsh/aliases.common.zsh
# --------------------------------
# Cross‑platform (macOS, Linux, WSL, …) aliases

# --- ZSH Configuration ------------------------------------------------
alias cz='vim ~/.zshrc'
alias sz='source ~/.zshrc'

# --- Directory Navigation --------------------------------------------
alias back='cd -'
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../..'
alias 5='cd ~/.config'
alias 55='cd ~/.config/zsh'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias dot='cd ~/dotfiles'
alias servs='cd /etc/systemd/system'
alias dev='~/dev'

# --- File Listing & Management ---------------------------------------
alias ls='eza -l --icons --git'
alias lss='eza -la --icons --git | grep -E "^l|^d"' # list symlinks and directories
alias la='eza -la --icons --git'
alias lt='eza -T --icons --git-ignore'     # tree view
alias lta='eza -Ta --icons --git-ignore'   # tree view incl. dot‑files
alias lsh='ls -d .[^.]*'
alias lg='eza -l --icons --git | grep '
alias mkdir='mkdir -p'
alias rd='rmdir'
alias search='tree -f | grep '
alias ssr='du -sch * | sort -hr'
alias pwdc='pwd | pbcopy'
alias p='pbpaste'
alias remove-node-modules='find . -name '\''node_modules'\'' -type d -prune -exec rm -rf '\''{}'\'' +'
alias cat='bat --paging=never'
alias e='exit'
alias el='logout'

# ripgrep helpers
alias rg='rg --smart-case'
alias rgf='rg --files-with-matches'
alias rgc='rg --count'

alias cheat='cheatsheet'

# --- History & Process Management ------------------------------------
alias history='omz_history'
alias history-stats='history 0 | awk '\''{print $2}'\'' | stats | head'
alias hsi='history | grep '
alias stats='sort | uniq -c | sort -r'
alias pgrep='pgrep -fli'
alias run-help='man'
alias which-command='whence'
alias bmux='tmux attach -t btop'
alias yabai-start='yabai --start-service'
alias yabai-restart='yabai --restart-service'
alias yabai-stop='yabai --stop-service'

# --- System & Network -------------------------------------------------
alias listen='sudo lsof -i -P -n | grep LISTEN'
alias net='ping google.com | grep -E --only-match --color=never '\''[0-9\.]+ ms'\'''
alias serve='python3 -m http.server --bind 127.0.0.1'
alias server='serve'
alias tunnel='ssh -N -L 8988:localhost:8888 pi@192.168.0.9'
alias logs='journalctl -fu'
alias logs-all='journalctl -u'
alias update-debian='sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y'
alias weather='curl wttr.in/'

# --- Development Tools ------------------------------------------------
alias vim='nvim'
alias jupyter='~/miniconda3/bin/jupyter'
alias jtset='jt -t monokai -cellw 88% -altmd -T -N -kl -fs 120 -tfs 130 -tf merriserif'
alias jsr-dry='jsr publish --dry-run'
alias mcp-server="nohup sh -c 'PORT=2190 npx @typingmind/mcp CZ8s4B5cOED0E60-PueCh' > ~/mcp.log 2>&1 &"
alias act='source .venv/bin/activate'

# NPM helpers
alias ni='npm install'
alias npm-dry='npm pack --dry-run'
alias nr='npm run'
alias nrb='npm run build'
alias nrf='npm run format'
alias nt='npm test'

alias pipg='~/miniconda3/bin/pip'

# --- Archive Management ----------------------------------------------
alias untarbz2='tar -xvjf'
alias untarxz='tar -xvf'

# --- Custom Scripts & Task Automation --------------------------------
alias 11='nohup ~/miniconda3/bin/python /Users/ilyakhruschev/bash.d/key_script_runner.py &'
alias killwork='/Users/ilyakhruschev/bash.d/killwork.sh'
alias startwork='~/bash.d/slackmail.sh'
alias pcsv='/Users/ilyakhruschev/bash.d/pretty_csv.sh'

# --- Media & Downloads -----------------------------------------------
alias ydla='yt-dlp -x --audio-format mp3 --audio-quality 0 --format bestaudio'
alias ydr='rsync -vra --stats --ignore-existing '\''/Users/ilyakhruschev/Music/Youtube_Downloads'\'' pi@192.168.0.9:'\''/home/pi/Music/Youtube_Downloads'\'''

# --- Remote File Operations ------------------------------------------
alias re='scp ~/Downloads/*.torrent $PI42 && rm ~/Downloads/*.torrent'
alias ri='scp ~/Downloads/FITINDEX-Elucia.csv pi@192.168.0.9:/home/pi/food/fitindex/ && rm ~/Downloads/FITINDEX-Elucia.csv'
alias rr='rm ~/Downloads/*.torrent'


# --- Git identity helpers --------------------------------------------
alias ghw='source ~/.config/github/github-work.sh'
alias ghp='source ~/.config/github/github-personal.sh'
alias ggg='echo "Username: $(git config --global user.name)" && echo "Email: $(git config --global user.email)"'
alias ggl='echo "Username: $(git config user.name)" && echo "Email: $(git config user.email)"'

# --- zsh configs -----------------------------------------------------
alias alias-common='vim ~/.config/zsh/common/aliases.zsh'
alias env-common='vim ~/.config/zsh/common/env.zsh'
if [[ "$(uname)" == "Darwin" ]]; then
    alias alias-system='vim ~/.config/zsh/mac/aliases.zsh'
    alias env-system='vim ~/.config/zsh/mac/env.zsh'
elif [[ "$(uname)" == "Linux" ]]; then
    alias alias-system='vim ~/.config/zsh/linux/aliases.zsh'
    alias env-system='vim ~/.config/zsh/linux/env.zsh'
fi
