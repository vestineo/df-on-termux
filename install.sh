#!/data/data/com.termux/files/usr/bin/bash -e
cd /data/data/com.termux/files/home
apt update
apt install git proot unstable-repo
apt install qemu-x86_64
git clone git://github.com/vestineo/df-on-termux.git
mkdir -p /data/data/com.termux/files/usr/opt/
mv /data/data/com.termux/files/home/df-on-termux /data/data/com.termux/files/usr/opt/df_sandbox
mv /data/data/com.termux/files/usr/opt/df_sandbox/dwarf-fortress /data/data/com.termux/files/usr/bin/
