mkdir ~/projects/tomfig
mkdir ~/.config/autostart
ln -s ~/projects/tomfig/.bash ~/.bash
ln -s ~/projects/tomfig/.bashrc ~/.bashrc
ln -s ~/projects/tomfig/.inputrc ~/.inputrc
ln -s ~/projects/tomfig/.ripgreprc ~/.ripgreprc
ln -s ~/projects/tomfig/.vimrc ~/.vimrc
ln -s ~/projects/tomfig/fusuma ~/.config
ln -s ~/projects/tomfig/kitty ~/.config

sudo gpasswd -a $USER input
sudo apt-get install libinput-tools xdotool ruby
sudo gem install fusuma


printf "[Desktop Entry]\nName=fusuma\nExec=fusuma -d\nType=Application" > ~/.config/autostart/fusuma.desktop
