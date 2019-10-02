/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install node jq bash bash-completion watch wget gzip gawk gnutls wdiff binutils diffutils gnu-sed ripgrep vim tmux
brew cask install alacritty
brew tap homebrew/cask-fonts
brew cask install font-fira-code
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

wget "https://download.docker.com/mac/stable/Docker.dmg"
sudo installer -store -pkg "./Docker.dmg" -target /

wget "https://bettertouchtool.net/releases/BetterTouchTool.zip"
unzip BetterTouchTool.zip
sudo installer -store -pkg "./BetterTouchTool.dmg" -target /


sh setup.sh
