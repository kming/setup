#!/usr/bin/zsh
set -eo pipefail

main() {
count=-1
if ! [[ $# -gt 1 ]]
then
    echo "Usage: loop-cmd.zsh <n> <cmd>"
    exit 1
fi 
# Parse the arguments
if ! [[ "$1" =~ ^[0-9]+$ ]]
then
    echo "<n> can only be integers -- Usage: loop-cmd.zsh <n> <cmd>"
fi
count=$1
shift


if [[ $count -eq -1 ]] 
then
    echo "Missing count -- Usage: loop-cmd.zsh <n> <cmd>"
    exit 1
elif [[ $count -gt 0 ]]
then
    for i in {1..${count}}
    do
        echo "loop-cmd -- iteration: $i/${count}"
        eval ${*}
    done
fi
}

main "$@"
