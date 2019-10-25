gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG

read "enter the gpg key id" GPGID

gpg --armor --export GPGID
