#! /bin/bash
#-----------🎩---------------
# Author: Abdullah Almutairi
# Version: 1.1
#----------------------------
#Set Command 
Command="npm start"
# Set Your Port
Port="8000"
# Set File Name
FileName="instance"
# Set Folder Name
Path="stores"

  Paint='\033[0;36m'
  green='\033[0;32m'
  red='\033[0;31m'
  nc='\033[0m'
    if [ "$(uname)" == "Darwin" ]; then    
        Ipv4=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2)
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        Ipv4=$(hostname -i)

    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
        Ipv4=$(for /f "tokens=2 delims=[]" %a in ('ping -n 1 -4 "%computername%"') do @echo %a)

    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
       Ipv4=$(for /f "tokens=2 delims=[]" %a in ('ping -n 1 -4 "%computername%"') do @echo %a)
    fi

check(){
    if [ ! -e $Path ]
      then
        mkdir stores
        printf "\n"
        printf "New-Folder 100%% 123\nNew-File 100%% 456\n" | awk '{printf "%.20s %s\n", $1 ".....................", $2}'
        printf "${Paint} Folder & Instance Has been Added ✅ \n\n"
      else
        printf "${Paint}\n🔥 File Has Been Updated!\n"
        printf "\n🎩${Paint} Good Luck,%1.0s"
        printf "${green}Run npm"....................."[ OK ]\n"
      fi
}
file(){
  echo "
    import axios from \"axios\";

    const instance = axios.create({
      //Don't Write Localhost
      baseURL: \"http://$Ipv4:$Port\",
    });

    export default instance;

    " > $Path/$FileName.js
}
if [ "$#" == 0 ]; then
  check
  file
  $Command
  exit 1
fi

while getopts "c:hfp:" option; do
case ${option} in
c ) 
  userInput=$(echo "$OPTARG" | tr '[:upper:]' '[:lower:]')
if [ $userInput  == "react" ] || [ "$userInput"  == "r" ]; then
  printf "${Paint}\nReact Project${green}"....................."[ OK ]\n\n"
  read -p "Your Project Name:" Pn
  npx create-react-app $Pn
  cd $Pn
  npm start
elif [ "$userInput"  == "reactnative" ] || [ "$userInput"  == "rn" ]; then
  printf "${Paint}\nReact Native${green}"....................."[ OK ]\n\n"
  read -p "Your Project Name:" Pn
  expo init $Pn
  cd $Pn
  npm start
else
  printf "\n%3.0s${Paint}There is Two options ${red}[ rn ]${Paint} OR ${red}[ r ]\n"
  printf "\n%3.0s[ r ] = React \n"
  printf "\n%3.0s[ rn ] = React Native \n\n"
fi
;;
p )

    if [[ "$OPTARG" =~ ^[0-9]+$ ]] && [[ ${#OPTARG} == "4" ]]
    then
      Port=$OPTARG
      check
      file
      $Command
    else
      red='\033[0;31m'
      printf "${red}\n%3.0s Integers Only && 4 Numbers!\n\n"
    fi
;;
f )
printf "${green}\nnpm clean cache"....................."[ OK ]\n\n"
npm cache clean -f
;;
h )
printf "\n [-c] To Create a New React or React Native Project\n"
printf "\n%3.0s${Paint} Example [ -c rn ] for ReactNative  or [ -c r ] For React.\n"
printf "\n${nc} [-p] You Can Choose a Specific Port\n"
printf "\n%3.0s${Paint} Example [ -p 8006 ] \n"
printf "\n${nc} [-f] Clean npm Cache\n\n"
;;
\? )
echo "You have to use: [-c] or [-p] or [-f]"
;;
esac
done