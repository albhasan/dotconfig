#!/bin/bash

# Author: Ravi Saive (Tecmint)
# Description: Simple System Health Check Script
# https://www.tecmint.com/bash-script-automate-system-health-checks/

DATE=$(date "+%Y-%m-%d_%H:%M:%S")
LOGFILE="/var/log/system-health-$DATE.log"
HOSTNAME=$(hostname)

{
    echo "============================================"
    echo " System Health Report for $HOSTNAME"
    echo " Generated on: $DATE"
    echo "============================================"

    # Disk Usage
    echo -e "\nDisk Usage:"
    printf "%-20s %-10s %-10s %-10s %-6s %-s\n" "Filesystem" "Size" "Used" "Avail" "Use%" "Mounted on"
    df -h --output=source,size,used,avail,pcent,target | tail -n +2

    # CPU Load
    echo -e "\nCPU Load (1/5/15 min average):"
    uptime | awk -F'load average:' '{ print "  " $2 }'

    # Memory Usage
    echo -e "\nMemory Usage:"
    free -h | awk 'NR==1 || /Mem|Swap/ { printf "  %-10s %-10s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $5, $6 }'

    # Failed Services
    echo -e "\nFailed Systemd Services:"
    FAILED=$(systemctl --failed --no-legend)
    if [ -z "$FAILED" ]; then
        echo "  No failed services."
    else
        echo "$FAILED" | while read -r line; do
            echo "  $line"
        done
    fi

    # Top 5 Memory-Consuming Processes
    echo -e "\nTop 5 Memory Consuming Processes:"
    ps -eo user,pid,%cpu,%mem,command --sort=-%mem | head -n 6 |
        awk '{ printf "  %-10s %-6s %-6s %-6s %-s\n", $1, $2, $3, $4, substr($0, index($0,$5), 60) }'

    # Top 5 CPU-Consuming Processes
    echo -e "\nTop 5 CPU Consuming Processes:"
    ps -eo user,pid,%cpu,%mem,command --sort=-%cpu | head -n 6 |
        awk '{ printf "  %-10s %-6s %-6s %-6s %-s\n", $1, $2, $3, $4, substr($0, index($0,$5), 60) }'

    # Uptime
    echo -e "\nSystem Uptime:"
    echo "  $(uptime -p)"

    # Package Updates
    echo -e "\nAvailable Package Updates:"
    if command -v apt &>/dev/null; then
        UPDATES=$(apt list --upgradable 2>/dev/null | grep -v "Listing...")
        if [ -z "$UPDATES" ]; then
            echo "  System is up to date."
        else
            echo "$UPDATES" | awk '{ print "  " $0 }'
        fi
    elif command -v dnf &>/dev/null; then
        dnf check-update || echo "  System is up to date."
    elif command -v yum &>/dev/null; then
        yum check-update || echo "  System is up to date."
    else
        echo "  Package manager not supported."
    fi

    echo -e "\nEnd of Report"

} >"$LOGFILE"

# Optional: Send report via mail (if mail is configured)
MAIL_TO="[email protected]"
if command -v mail >/dev/null 2>&1; then
    mail -s "Daily Health Report for $HOSTNAME" "$MAIL_TO" <"$LOGFILE"
fi
