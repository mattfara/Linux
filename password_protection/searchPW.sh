#!/bin/bash

encrFile= #your encrypted file

#get upcoming pw from user
read -sp "enter passphrase for the pw file: "  passphrase

#decrypt the file
echo $passphrase | gpg --passphrase-fd 0 $encrFile

if [ $? -eq 0 ] 
then 
  pwFile= #link to pw file

  chown #your username $pwFile

  read -p "Search for: " search

  grep -i -B 3 -A 8 $search $pwFile

  #delete the original encrypted file
  rm $encrFile

  #encrypt new file
  echo $passphrase | gpg -c --passphrase-fd 0 $pwFile

  #delete decrypted file
  rm $pwFile

  echo
  echo "file encrypted"
  echo "be sure to run the command reset to clear the data from the terminal"
else
  echo
  echo "failed to decrypt"

fi 


