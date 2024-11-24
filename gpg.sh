chown -R $(whoami) ~/.gnupg/

gpg --default-new-key-algo rsa4096 --gen-key
gpg --list-secret-keys --keyid-format LONG

echo "the key is of the form, only copy the part after the slash: sec 4096R/XXXXXXXXXXXXXXXX"
read -p "enter the gpg key id: " GPGID

git config --global --unset gpg.format
gpg --armor --export GPGID | nvim -
git config --global user.signingkey GPGID
