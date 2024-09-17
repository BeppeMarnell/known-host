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

    # Extract the IP address from the specified line
    ip_address=$(sed "${line_number}q;d" ~/.ssh/known_hosts | awk '{print $1}')

    if [ -z "$ip_address" ]; then
        echo "No IP address found at line $line_number"
        return 1
    fi

    echo "Removing all lines with IP address: $ip_address"

    # Remove all lines containing the IP address
    sed "/$ip_address/d" ~/.ssh/known_hosts > "$tmp_file"
    
    # Overwrite the known_hosts file with the updated content
    mv "$tmp_file" ~/.ssh/known_hosts
}
