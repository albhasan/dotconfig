#!/bin/bash
# Pretty print CSVs to the console
# https://www.stefaanlippens.net/pretty-csv.html
perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | exec less  -F -S -X -K
exit 0
