#!/bin/bash
set -euo pipefail

if [[ ! -t 0 ]]; then
    exit 0
fi

read -r -p "Print local-only sourced files and chezmoi variables? [y/N] " print_locals
if [[ "$(printf '%s' "$print_locals" | tr '[:upper:]' '[:lower:]')" != y ]]; then
    exit 0
fi

for local_file in ~/.config/local-overrides.zsh ~/.config/secrets.sh; do
    if [[ -s "$local_file" ]]; then
        printf '### %s\n' "$local_file"
        cat "$local_file"
    fi
done

printf '### chezmoi data\n'
chezmoi data
