#!/bin/sh
echo -ne '\033c\033]0;GDTic\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/GDTic.x86_64" "$@"
