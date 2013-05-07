#!/bin/bash

cd "$(dirname "$0")"
git pull
git submodule update --init

GIT_USER="$(git config --get user.name)"
GIT_EMAIL="$(git config --get user.email)"

function doIt() {
  rsync --exclude ".git" --exclude ".DS_Store" --exclude "sync.sh" --exclude "README.md" -av . ~
  git config --global user.name "$GIT_USER"
  git config --global user.email "$GIT_EMAIL"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi

unset doIt
