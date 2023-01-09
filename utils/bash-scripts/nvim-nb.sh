#!/bin/sh
# script for launching different neovim configurations

NVIM_PROFILE_NAME="new-blood"
export LUA_PATH="$HOME/.config/nvim-profiles/${NVIM_PROFILE_NAME}/?.lua"

exec env XDG_CONFIG_HOME="$HOME/.config/nvim-profiles/${NVIM_PROFILE_NAME}" \
         XDG_DATA_HOME="$HOME/.local/share/nvim-profiles/${NVIM_PROFILE_NAME}" \
         XDG_CACHE_HOME="$HOME/.cache/nvim-profiles/${NVIM_PROFILE_NAME}" \
         nvim -u "$HOME/.config/nvim-profiles/${NVIM_PROFILE_NAME}/init.lua"\
         "$@"
