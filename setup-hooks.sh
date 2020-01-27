#!/bin/sh

#########################################################
# Download and install the listed hooks for the project #
#########################################################

HOOKS=("pre-commit")
REMOTE_PRE_COMMIT_HOOK_PATH="https://raw.githubusercontent.com/J-GG/hooks/master/hooks/"
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

echo "========================"
echo "| Installing git hooks |"
echo "========================"
echo

rm -r "$LOCAL_HOOKS_PATH"
mkdir "$LOCAL_HOOKS_PATH"
for HOOK in $HOOKS
do
    download "$REMOTE_PRE_COMMIT_HOOK_PATH" "$LOCAL_HOOKS_PATH/$HOOK" "Downloading $HOOK hook"
done
