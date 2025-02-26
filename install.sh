#!/usr/bin/env zsh
# set -e

export quiet_flag="false"
export stdout_flag="true"


NAME_BASE_REPO="infra-shell2"
export PATH_BASE_REPO="${HOME}/git/${NAME_BASE_REPO}"
export PATH_BASE_REPO_SRC="${HOME}/git/${NAME_BASE_REPO}/src"

# export DIR_DOTFILES=/tmp/.dotfiles
export DIR_DOTCONF=${HOME}/.config

export WEZTERM_CONFIG_FILE=${DIR_DOTCONF}/wezterm/wezterm.lua

dotbot -c ${PATH_BASE_REPO}/install.conf.yaml

echo "INSTALLATION COMPLETED"