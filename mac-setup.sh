/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install node jq bash bash-completion watch wget gzip gawk gnutls wdiff binutils diffutils gnu-sed ripgrep vim tmux gnupg pinentry-mac
brew cask install alacritty
brew tap homebrew/cask-fonts
brew cask install font-fira-code
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

brew link --overwrite gnupg
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent
git config --global gpg.program gpg

wget "https://download.docker.com/mac/stable/Docker.dmg"
sudo hdiutil attach ./Docker.dmg
sudo cp -R /Volumes/Docker/Docker.app/ /Applications/Docker.app
sudo hdiutil detach /Volumes/Docker
rm Docker.dmg

wget "https://bettertouchtool.net/releases/BetterTouchTool.zip"
unzip ./BetterTouchTool.zip
sudo cp -R BetterTouchTool.app/ /Applications/BetterTouchTool.app
rm BetterTouchTool.zip BetterTouchTool.app

./setup.sh
