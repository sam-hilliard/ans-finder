#!/bin/bash

# Function to get ASN for a given IP address
get_asn_for_ip() {
    local ip=$1
    whois -h whois.cymru.com " -v $ip" | awk 'NR>1 {print $1}'
}

# Function to process a single domain
process_domain() {
    local domain=$1
    echo "Domain: $domain"
    ips=$(dig +short "$domain" | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}')
    
    if [ -z "$ips" ]; then
        echo "Failed to resolve IP address for $domain"
    else
        for ip in $ips; do
            echo "IP Address: $ip"
            asn=$(get_asn_for_ip "$ip")
            if [ -z "$asn" ]; then
                echo "No ASN found for $ip"
            else
                echo "ASN: AS$asn"
            fi
        done
    fi
    echo "-----------------------------------"
}

# Main script logic
if [ $# -eq 1 ]; then
    # If a single argument is provided, assume it's an IP address
    if [[ $1 =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo "IP Address: $1"
        asn=$(get_asn_for_ip "$1")
        if [ -z "$asn" ]; then
            echo "No ASN found for $1"
        else
            echo "ASN: AS$asn"
        fi
    # Otherwise, assume it's a domain
    else
        process_domain "$1"
    fi
else
    # Read domains from STDIN
    while IFS= read -r domain || [[ -n "$domain" ]]; do
        process_domain "$domain"
    done
fi
