#!/bin/bash
# Alias all flatpaks to their logical command names, but only if they're not already commands

for item in /var/lib/flatpak/exports/bin/*; do
	flatpak_short_alias="$(echo "$item" | tr '.' '\n' | tail -1 | tr '[:upper:]' '[:lower:]')"
	flatpak_long_alias="$(basename "$item")"
	
	if [ ! "$(command -v "$alias_name")" ]; then
		alias "$flatpak_short_alias"="$item"
	elif [ ! "$(command -v "$flatpak_long_alias")" ]; then
		alias "$flatpak_long_alias"="$item"
	fi

	unset flatpak_short_alias
	unset flatpak_long_alias
done
