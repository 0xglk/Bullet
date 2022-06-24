#! /bin/bash
#-----------🎩---------------
# Author: Abdullah Almutairi
# Version: 1.0
#----------------------------

#Set Command 
Command="npm start"
# Set Your Port
Port="8000"
# Set File Name
FileName="instance"
# Set Folder Name
Path="stores"

Ipv4=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2)

Paint='\033[0;36m'
green='\033[0;32m'
if [ ! -e $Path ]
then
	mkdir stores
  printf "\n"
  printf "New-Folder 100%% 123\nNew-File 100%% 456\n" | awk '{printf "%.20s %s\n", $1 ".....................", $2}'
  printf "${Paint}Folder & Instance Has been Added ✅ \n\n"
else
    printf "${Paint}\n🔥 File Has Been Updated!\n"
    printf "\n🎩${green} Good Luck,%1.0s"
    printf "${Paint}Run npm"....................."[ OK ]\n"
fi

echo "
import axios from \"axios\";

const instance = axios.create({
  //Don't Write Localhost
  baseURL: \"http://$Ipv4:$Port\",
});

export default instance;

" > $Path/$FileName.js
$Command