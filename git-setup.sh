git config --global user.name "Tom Pridham"
git config --global user.email "pridham.tom@gmail.com"
git config --global core.editor "vim"
git config --global push.default current
git config --global commit.gpgsign true

read -p 'enter ssh-key name: ' SSHKEYNAME
read -p 'enter ssh-key password' SSHKEYPASSWORD
SSHDIR=~/.ssh/${SSHKEYNAME}
echo

if [ ! $SSHKEYPASSWORD ]; then
  ssh-keygen -t rsa -b 4096 -C "pridham.tom@gmail.com" -f $SSHDIR
else
 ssh-keygen -t rsa -b 4096 -C "pridham.tom@gmail.com" -f $SSHDIR -N $SSHKEYPASSWORD
fi;

eval "$(ssh-agent -s)"
ssh-add -k $SSHDIR

xclip -sel clip < "${SSHDIR}.pub"
