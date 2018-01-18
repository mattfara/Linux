#!/bin/bash

#so long as the password is the last line in each entry, this should work

encrFile= #your encrypted file

#get upcoming pw from user
read -sp "enter passphrase for the pw file: "  passphrase

#decrypt the file
echo $passphrase | gpg --passphrase-fd 0 $encrFile

if [ $? -eq 0 ] 
then 
  echo
  pwFile= #the decrypted file

  chown #your username $pwFile

  echo

  echo "Enter new info and then press ctrl+d twice:"

  echo " " >> $pwFile

  cat >> $pwFile
  echo

  tail -n 1 $pwFile | xclip -selection clipboard

  isPWValid=false

  while [ $isPWValid == false ]
  do
	echo
	echo "Did the password pass muster? Enter NUMBER"
	echo
	
	select yn in "y" "n"; do
		case $yn in
			"y" ) 
				isPWValid=true;
				break
				;;
			"n" ) 
				read -p "Enter new pw > " newPW; 
				echo;
				let lastLine=$(wc -l < $pwFile)+1;
				sed -i "$lastLine"s/.*/"$newPW"/ $pwFile; 					
				tail -n 1 $pwFile | xclip -selection clipboard;
				break
				;;
		esac
	done
	echo "$isPWValid"
  done
		
  #puts a newline at end so user does not need to remember
  ed -s $pwFile <<< w

  echo

  #delete the original encrypted file
  rm $encrFile

  #encrypt new file
  echo $passphrase | gpg -c --passphrase-fd 0 $pwFile

  #delete decrypted file
  rm $pwFile

  echo
  
  reset
  echo "file encrypted"
else
  echo
  echo "failed to decrypt"

fi 


