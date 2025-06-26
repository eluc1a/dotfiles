# ~/.config/zsh/aliases.mac.zsh
# -----------------------------
# macOS‑specific aliases (Homebrew, pbcopy, /Applications, …)

######## ZSH & mac‑app helpers #######################################
alias czz='open -a "Visual Studio Code.app" ~/.zshrc'
alias code='open -a "Cursor.app"'

######## Clipboard helpers ###########################################
alias pwdc='pwd | pbcopy'
alias p='pbpaste'

######## Network / System ############################################
alias ip='ipconfig getifaddr en0'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias sniff='sudo ngrep -d '\''en1'\'' -t '\''^(GET|POST) '\'' '\''tcp and port 80'\'''
alias temp='osx-cpu-temp'

######## Homebrew management #########################################
alias update-mac='brew update && brew upgrade'
alias restart='brew services restart'
alias bubu='brew update && brew upgrade && brew cleanup'
alias bubu-all='brew update && brew upgrade && brew cleanup && brew doctor'
alias bubu-cask='brew update && brew upgrade --cask && brew cleanup'
alias bubu-cask-all='brew update && brew upgrade --cask && brew cleanup && brew doctor'

######## Development tools / paths ###################################
alias rsync='/opt/homebrew/bin/rsync'
alias gcp-mldev='gcloud config set account azure-devops-pipeline@daas-ml-dev.iam.gserviceaccount.com'
alias gcp-ik='gcloud config set account ikhruschev@gmail.com'
alias gcp-me='gcloud config set account me@elucia.com'
alias gcp-elucia='gcloud config set account elucia.khruschev@mail.waldenu.edu'

######## Project‑directory shortcuts #################################
alias 0='/Users/ilyakhruschev/Documents/Learn/Projects/flutter_projects/wheat'
alias 00='/Users/ilyakhruschev/Documents/development'
alias 1='/Users/ilyakhruschev/Documents/Learn'
alias 2='/Users/ilyakhruschev/Documents/Jobs_2023'
alias 9='/Users/ilyakhruschev/AdTalem/repos'
alias 99='/Users/ilyakhruschev/AdTalem/github_repos'
alias KK='cd /Applications/Native\ Instruments/Komplete\ Kontrol/Komplete\ Kontrol.app/Contents/'
alias musicd='/Users/ilyakhruschev/Documents/_music/Dynaton'
alias musicp='/Users/ilyakhruschev/Documents/_music/Elucia'

alias disable-smoothing='defaults -currentHost write -g AppleFontSmoothing -int 0'
alias enable-smoothing='defaults -currentHost delete -g AppleFontSmoothing'

alias mac-env='vim /Users/ilyakhruschev/dotfiles/zsh/.config/zsh/mac/env.zsh'
