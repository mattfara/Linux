#!/bin/bash
#TEST OF SYM
encrFile=~/pw/pw.gpg

#get upcoming pw from user
read -sp "enter passphrase for the pw file: "  passphrase

#decrypt the file
echo $passphrase | gpg --passphrase-fd 0 $encrFile

if [ $? -eq 0 ] 
then 
  pwFile=~/pw/pw

  chown matt $pwFile

  leafpad $pwFile
  wait `pgrep $!`
  

  #delete the original encrypted file
  rm $encrFile

  #encrypt new file
  echo $passphrase | gpg -c --passphrase-fd 0 $pwFile

  #delete decrypted file
  rm $pwFile

  echo
  echo "file encrypted"
else
  echo
  echo "failed to decrypt"

fi 


