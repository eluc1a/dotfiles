alias susu='sudo apt-get update && sudo apt-get upgrade -y'
alias banlist='sudo fail2ban-client status nginx-env'
alias 0='~/.config'
alias 00='~/dev'
alias 1='cd /mnt/storage1/Movies'
alias 2='cd /mnt/storage1/'
alias 3='cd /mnt/storage1/TV_shows'
alias 4='cd /mnt/storage1/tmp_extractions'
alias monitor='inotifywait -m -r -e modify,create,delete /mnt/storage1/ | while read -r line; do printf "\033[2K\r$line"; done'
alias dontsleep='sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target'
alias 22='cd /mnt/storage1/Torrents'
alias piastart='/home/elucia/scripts/piastart.sh'
alias piastatus='/home/elucia/scripts/piastatus.sh'
alias ia='ip -4 addr show | grep wgpia0'
alias temp='vcgencmd measure_temp'
