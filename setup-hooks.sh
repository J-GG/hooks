#!/bin/sh

####################################################
# Download and install the hooks for the project.
####################################################

REMOTE_HOOKS_PATH=""
LOCAL_HOOKS_PATH=".git/hooks"

function download {
    if [ -f "$2" ]; then
	    return
    fi

    echo "$3"

    if which curl > /dev/null; then
	    curl -Lk "$1" > "$2"
    elif which wget > /dev/null; then
	    wget "$1" -O "$2"
    else
	    echo "Can't find a command to download the files. Please install curl or wget."
	    exit 1
    fi
}

function main {
    echo "========================="
    echo "| Downloading git hooks |"
    echo "========================="


    download "$REMOTE_HOOKS_PATH" "$LOCAL_HOOKS_PATH" "Downloading hooks"
}

tty -s && stty -echo
main
tty -s && stty echo