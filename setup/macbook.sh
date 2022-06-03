#!/usr/bin/env bash

# Note: while written like a bash script to be executed, you really
# have to "source" this file instead.

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add homebrew to shell environment
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/timmil/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Brewfile packages
brew bundle --file Brewfile

