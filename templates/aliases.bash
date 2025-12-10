# Git
export EDITOR="code --wait"

# Easy copy to clipboard - Usage: "command_with_output | clip [-s|--suppress]"
clip() {
    local xc='xclip -selection clipboard'
    if [[ " $* " == *" -s "* || " $* " == *" --suppress "* ]]; then
        # Suppressed: only send to clipboard
        $xc
    else
        # Normal: show + send to clipboard
        tee >($xc)
    fi
}

# Upgrade software
alias upstuff="sudo apt update && sudo apt upgrade -y && sudo snap refresh"

# Search for matching text in files
search() {
    # Recommended other args: -I (ignore binary files), -i (case-insensitive)
    search_term="$1"
    shift
    sudo grep -r --color=always "$search_term" "$@" 2>/dev/null
}
