# ~/.config/zsh/functions.mac.zsh
# -------------------------------

# Change ghostty background per SSH host, restore on exit.
# Uses OSC 11 (set bg) and OSC 111 (reset bg) — both supported by ghostty.
# "command ssh" bypasses this wrapper to avoid infinite recursion with ghostty's ssh-env.
ssh() {
    case "$*" in
        *fox*)            printf '\033]11;#3d1c00\007' ;;
        *raven*|*pheonix*|*192.168.0.88*) printf '\033]11;#2a0050\007' ;;
    esac
    command ssh "$@"
    printf '\033]111\007'
}
