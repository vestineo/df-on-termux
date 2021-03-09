#!/data/data/com.termux/files/usr/bin/bash -e
# colors

red='\033[1;31m'
yellow='\033[1;33m'
blue='\033[1;34m'
reset='\033[0m'

cd /data/data/com.termux/files/home
printf "${red}\n"
printf " >> ${yellow} Updating apt cache...\n"
apt update -y
printf "${red} >> ${yellow} Installing all dependencies ...\n"
for i in git proot unstable-repo qemu-user-x86_64; do
		echo "       Installing ${i}..."
		apt install -y $i || {
			printf "$red"
			echo " ERROR: check your internet connection or apt\n Exiting..."
			printf "$reset"
			exit 1
		}
done
printf "${red} >> ${yellow} Cloning repo ...\n"
printf "${yellow}\n"
git clone git://github.com/vestineo/df-on-termux.git
mkdir -p /data/data/com.termux/files/usr/opt/
mv /data/data/com.termux/files/home/df-on-termux /data/data/com.termux/files/usr/opt/df_sandbox
mv /data/data/com.termux/files/usr/opt/df_sandbox/dwarf-fortress /data/data/com.termux/files/usr/bin/
printf "${red} [!] ${yellow} To play the game, use ${blue} dwarf-fortress ${yellow} command \n"
printf "${red} [!] ${yellow} To change game font, use ${blue} df-switchfont ${yellow} command \n"
printf "${reset}"
