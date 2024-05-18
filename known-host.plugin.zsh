# known-hosts.plugin.zsh

known-host() {
    if [ "$1" != "-d" ]; then
        echo "Usage: known-host -d <line_number>"
        return 1
    fi

    if [ -z "$2" ]; then
        echo "Usage: known-host -d <line_number>"
        return 1
    fi

    line_number="$2"
    tmp_file=$(mktemp)
    sed "${line_number}d" ~/.ssh/known_hosts > "$tmp_file"
    mv "$tmp_file" ~/.ssh/known_hosts
}