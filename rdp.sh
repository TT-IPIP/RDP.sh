#! /bin/bash
printf "Installing RDP Be Patience... " >&2
{
sudo useradd -m colab
sudo adduser colab sudo
echo 'colab:8341' | sudo chpasswd
apt-get update
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 xrdp nano terminator iproute2
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo systemctl disable lightdm.service
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo dpkg --install google-chrome-stable_current_amd64.deb
#sudo apt install --assume-yes --fix-broken
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo adduser colab chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - colab -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
