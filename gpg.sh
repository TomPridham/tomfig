# make sure that gnupg folders have the correct permissions
sudo chown -R $(whoami) ~/.gnupg/

# Also correct the permissions and access rights on the directory
sudo chmod 600 ~/.gnupg/*
sudo chmod 700 ~/.gnupg

gpg --default-new-key-algo rsa4096 --gen-key
gpg --list-secret-keys --keyid-format LONG

echo "the key is of the form: sec 4096R/XXXXXXXXXXXXXXXX"
read -p "enter the gpg key id: " GPGID

sudo gpg --armor --export GPGID | vim -
git config --global user.signingkey GPGID
