#!/data/data/com.termux/files/usr/bin/bash -e

# Colors
red='\033[1;31m'
yellow='\033[1;33m'
blue='\033[1;34m'
reset='\033[0m'

handle_error() {
    printf "${red}ERROR: $1\n${reset}"
    exit 1
}

cd /data/data/com.termux/files/home || handle_error "Could not change to home directory"

printf "${red}\n >> ${yellow}Updating system...\n"
apt update -y || handle_error "Failed to update apt cache"
apt upgrade -y || handle_error "Failed to upgrade packages"

printf "${red} >> ${yellow}Installing dependencies...\n"
for pkg in git proot qemu-user-x86-64; do
    printf "       Installing ${pkg}...\n"
    apt install -y "$pkg" || handle_error "Failed to install $pkg"
done

printf "${red} >> ${yellow}Cloning repo...\n"
git clone https://github.com/vestineo/df-on-termux || handle_error "Failed to clone repository"

mv -f df-on-termux /data/data/com.termux/files/home/df_sandbox || handle_error "Failed to move installation files"

mkdir -p /data/data/com.termux/files/usr/bin
mv -f /data/data/com.termux/files/home/df_sandbox/dwarf-fortress /data/data/com.termux/files/usr/bin/ || handle_error "Failed to install binary"
chmod +x /data/data/com.termux/files/usr/bin/dwarf-fortress || handle_error "Failed to set executable permissions"

printf "${red}[!] ${yellow}To play the game, use ${blue}dwarf-fortress${yellow} command\n"
printf "${red}[!] ${yellow}To change game font, use ${blue}df-switchfont${yellow} command\n"
printf "${reset}"
