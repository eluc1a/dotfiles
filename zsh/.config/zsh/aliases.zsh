# ~/.config/zsh/aliases.zsh
# -------------------------
# Organized command aliases

# --- ZSH Configuration ---
alias cz='vim ~/.zshrc'
alias czz='open -a "Visual Studio Code.app" ~/.zshrc'
alias sz='source ~/.zshrc'

# --- Directory Navigation ---
alias back='cd -'
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../..'

alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'

# --- Project Directory Shortcuts ---
alias 0='$HOME/Documents/Learn/Projects/flutter_projects/wheat'
alias 00='$HOME/Documents/development'
# alias 1='$HOME/Documents/backups/Documents/_j'
alias 1='$HOME/Documents/Learn'
alias 2='$HOME/Documents/Jobs_2023'
alias 4='cd ~/.config'
alias 9='$HOME/AdTalem/repos'
alias 99='$HOME/AdTalem/github_repos'
alias KK='cd /Applications/Native\ Instruments/Komplete\ Kontrol/Komplete\ Kontrol.app/Contents/'
alias musicd='$HOME/Documents/_music/Dynaton'
alias musicp='$HOME/Documents/_music/Elucia'
alias ghw='source ~/.config/github/github-work.sh'
alias ghp='source ~/.config/github/github-personal.sh'
# Add this to your .bashrc or .bash_aliases
alias ggg='echo "Username: $(git config --global user.name)" && echo "Email: $(git config --global user.email)"'


# --- File Listing & Management ---
# alias l='ls -lah'
# alias la='ls -lAh'

# alias ll='ls -lh'
# alias ls='ls -G'
# alias lsa='ls -lah'
# Add to aliases.zsh:
# alias ls='eza'
alias ls='eza -l --icons --git'
alias lss='eza -la --icons --git | grep "^l"' # list symlinks and directories
alias lsy='eza -la --icons --git --link-targets | grep "^l"'
alias la='eza -la --icons --git'
alias lt='eza -T --icons --git-ignore'  # Tree view
alias lta='eza -Ta --icons --git-ignore'  # Tree view with hidden files
alias lsh='ls -d .[^.]*'
alias lg='ls -lh | grep '

alias mkdir='mkdir -p'
alias rd='rmdir'
# alias rm='trash'                    # Safer alternative using trash
alias search='tree -f | grep '
alias ssr='du -sch * | sort -hr'
alias pwdc='pwd | pbcopy'
alias p='pbpaste'
alias remove-node-modules='find . -name '\''node_modules'\'' -type d -prune -exec rm -rf '\''{}'\'' +'
alias cat='bat --paging=never'

alias rg='rg --smart-case'  # Case insensitive if pattern is all lowercase
alias rgf='rg --files-with-matches'  # Just show filenames
alias rgc='rg --count'  # Show count of matches per file

alias cheat='cheatsheet'


# --- History & Process Management ---
alias history='omz_history'
alias history-stats='history 0 | awk '\''{print $2}'\'' | stats | head'
alias hsi='history | grep '
alias stats='sort | uniq -c | sort -r'
alias pgrep='pgrep -fli'
alias run-help='man'
alias which-command='whence'
alias bmux='tmux attach -t btop'

# --- System & Network ---
alias ip='ipconfig getifaddr en0'
alias listen='sudo lsof -i -P -n | grep LISTEN'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias net='ping google.com | grep -E --only-match --color=never '\''[0-9\.]+ ms'\'''
alias serve='python3 -m http.server --bind 127.0.0.1'
alias server='serve'
alias sniff='sudo ngrep -d '\''en1'\'' -t '\''^(GET|POST) '\'' '\''tcp and port 80'\'''
alias logs='journalctl -fu'
alias logs-all='journalctl -u'
alias temp='osx-cpu-temp'
alias tunnel='ssh -N -L 8988:localhost:8888 pi@192.168.0.9'
alias update-debian='sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y'
alias update-mac='brew update && brew upgrade'
alias weather='curl wttr.in/'
alias restart='brew services restart'
alias bubu='brew update && brew upgrade && brew cleanup'
alias bubu-all='brew update && brew upgrade && brew cleanup && brew doctor'
alias bubu-cask='brew update && brew upgrade --cask && brew cleanup'
alias bubu-cask-all='brew update && brew upgrade --cask && brew cleanup && brew doctor'

# --- Development Tools ---
alias vim='nvim'
alias jupyter='~/miniconda3/bin/jupyter'
alias jtset='jt -t monokai -cellw 88% -altmd -T -N -kl -fs 120 -tfs 130 -tf merriserif'
alias jsr-dry='jsr publish --dry-run'
alias ni='npm install'
alias npm-dry='npm pack --dry-run'
alias nr='npm run'
alias nrb='npm run build'
alias nrf='npm run format'
alias nt='npm test'
alias pipg='~/miniconda3/bin/pip'
alias rsync='/opt/homebrew/bin/rsync'
# alias code='open -a "Visual Studio Code.app"'
alias code='open -a "Cursor.app"'

# --- Archive Management ---
alias untarbz2='tar -xvjf'
alias untarxz='tar -xvf'

# --- Custom Scripts & Task Automation ---
alias 11='nohup ~/miniconda3/bin/python $HOME/bash.d/key_script_runner.py &'
alias killwork='$HOME/bash.d/killwork.sh'
alias startwork='~/bash.d/slackmail.sh'
alias pcsv='$HOME/bash.d/pretty_csv.sh'

# --- Media & Downloads ---
alias ydla='yt-dlp -x --audio-format mp3 --audio-quality 0 --format bestaudio'
alias ydr='rsync -vra --stats --ignore-existing '\''$HOME/Music/Youtube_Downloads'\'' pi@192.168.0.9:'\''/home/pi/Music/Youtube_Downloads'\'''

# --- Remote File Operations ---
alias re='scp ~/Downloads/*.torrent $PI42 && rm ~/Downloads/*.torrent'
alias ri='scp ~/Downloads/FITINDEX-Elucia.csv pi@192.168.0.9:/home/pi/food/fitindex/ && rm ~/Downloads/FITINDEX-Elucia.csv'
alias rr='rm ~/Downloads/*.torrent'
