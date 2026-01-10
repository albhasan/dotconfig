#!/bin/bash

Help() {
        echo "Top ten of the most used command in local history."
        echo
        echo "Syntax: $(basename $0) [-h]"
        echo
        echo "options:"
        echo "h       Print this Help."
        echo
}
if [ "$1" == "-h" ]; then
        Help
        exit 0
fi

if [ "$1" == "--help" ]; then
        Help
        exit 0
fi

set -o history
history -r ~/.bash_history
echo "The most used commands in local history are:"
history | awk '{print $2}' | sort | uniq -c | sort -nr | head -10
