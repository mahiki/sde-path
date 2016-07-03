#!/usr/bin/env bash
# -------------------------------------------------------------------
#   test script for getopts
#
#   usage:  bash getopts-tutorial.sh -a number
#   author: merlinr@
# -------------------------------------------------------------------

function usage {
   cat << EOF
usage: bash getopts-tutorial.sh -a number
EOF
   exit 420
}
 
while getopts ":a:" opt; do
    case $opt in
        a)
            echo "-a was triggered, Parameter: $OPTARG" >&2
            exit
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            usage
            ;;
    esac
done

usage           # this is the no arguments flow
