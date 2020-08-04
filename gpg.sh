gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG

echo "the key is of the form: 4096R/XXXXXXXXXXXXXXXX"
read -p "enter the gpg key id: " GPGID

gpg --armor --export GPGID | xclip -sel clip
git config --global user.signingkey GPGID
