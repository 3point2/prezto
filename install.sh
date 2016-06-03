#!/bin/zsh

SCRIPT_DIR="$(dirname "$0:A")"

DESTINATION="$HOME/.zprezto"

if [[ -e "$DESTINATION"]]; then
    echo "error: $DESTINATION already exists."
    exit 1
fi

ln -s "$SCRIPT_DIR" "$DESTINATION"
setopt EXTENDED_GLOB
for rcfile in "$DESTINATION"/runcoms/^README.md(.N); do
  ln -s "$rcfile" "$HOME/.${rcfile:t}"
done