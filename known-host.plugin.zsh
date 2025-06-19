# known-hosts.plugin.zsh

known-host() {
    if [ "$1" != "-d" ] || [ -z "$2" ]; then
        echo "Usage: known-host -d <line_number|ip_address>"
        return 1
    fi

    target="$2"
    tmp_file=$(mktemp)

    # If target is a number, treat as line number, else as IP
    if [[ "$target" =~ ^[0-9]+$ ]]; then
        # Extract the IP address from the specified line
        ip_address=$(sed "${target}q;d" ~/.ssh/known_hosts | awk '{print $1}')
        # Strip brackets and optional port if present
        ip_address=$(echo "$ip_address" | sed -E 's/^\[([0-9\.]+)\](:[0-9]+)?$/\1/')
    else
        # Strip brackets and optional port if present
        ip_address=$(echo "$target" | sed -E 's/^\[([0-9\.]+)\](:[0-9]+)?$/\1/')
    fi

    if [ -z "$ip_address" ]; then
        echo "No IP address found for '$target'"
        return 1
    fi

    echo "Removing all lines with IP address: $ip_address"

    # Remove all lines containing the IP address (with or without brackets/port)
    sed -E "/(\[)?$ip_address(\](:[0-9]+)?)?/d" ~/.ssh/known_hosts > "$tmp_file"
    mv "$tmp_file" ~/.ssh/known_hosts
}
