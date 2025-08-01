#!/bin/sh -e

error_msg() {
  printf "\033[1;31m%b\033[0m\n" "$1"
}

# Check for sudo execution
if [ "$(id -u)" -eq 0 ]; then
  error_msg "Should not be ran as root !"
  exit 1
fi

warning_msg() {
  printf "\033[0;33m%b\033[0m\n" "$1"
}

info_msg() {
  printf "\033[0;36m%b\033[0m\n" "$1"
}

success_msg() {
  printf "\033[0;32m%b\033[0m\n" "$1"
}

# Command Existence Checker #
have() {
  command -v "$1" >/dev/null 2>&1
}

if have nvim; then
  success_msg "Neovim Exist"
else
  warning_msg "Please install nvim then run script again"
  exit 1
fi

# Setup Remotes #
setupRemotes() {
  warning_msg "Setting Up Remotes"
  git remote | grep -q "^origin$" && git remote rm origin
  git remote | grep -q "^github$" || git remote add github git@github.com:harshv5094/mnvim.git
  git remote | grep -q "^gitlab$" || git remote add gitlab git@gitlab.com:harshv5094/mnvim.git
}

# Global Variables #
CONFIG_DIR="$HOME/.config"
NEOVIM_DIR="$HOME/.config/nvim"

if [ ! -d "${CONFIG_DIR}" ]; then
  mkdir -p "${CONFIG_DIR}"
fi

if [ ! -d "${NEOVIM_DIR}" ]; then
  info_msg "Cloning my dotfiles repository..."
  git clone https://github.com/harshv5094/mnvim "${NEOVIM_DIR}"
  cd "${NEOVIM_DIR}" || return
  success_msg "NEOVIM_DIR: $(pwd)"
  setupRemotes
else
  cd "${NEOVIM_DIR}" || return
  success_msg "NEOVIM_DIR: $(pwd)"
  setupRemotes
fi
