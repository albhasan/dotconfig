#!/bin/bash
# Pretty print TSVs to the console
# https://www.stefaanlippens.net/pretty-csv.html
perl -pe 's/((?<=\t)|(?<=^))\t/ \t/g;' "$@" | column -t -s $'\t' | exec less  -F -S -X -K
exit 0
