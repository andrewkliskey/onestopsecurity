#!/bin/bash

#Developed by https://github.com/andrewkliskey

#Declaring Valiables
sshconfig="/etc/ssh/sshd_config"
sshport="22"

#Functions
update() {
    sudo apt-get update;
    sudo apt-get upgrade -y;
    sudo apt-get dist-upgrade -y;
}

housekeeping() {
    sudo apt-get install mlocate -y;
    sudo apt-get autoremove -y;
    sudo apt-get autoclean -y;
    sudo updatedb;
}

newuser(){
    read -p "Name of the user: " nameofuser
    adduser $nameofuser
    echo The user $nameofuser has been created.
    
    read -p "Would you like to make $nameofuser a sudo user " sudoanswer
 
    if [ "$sudoanswer" != "${sudoanswer#[Yy]}" ]; then
        sudo adduser $nameofuser sudo
    fi


}
changesshport() {
    read -p "What port would you like to use for SSH (Ideally use an Ephemeral Port 32768-60999): " sshport
    #echo "Port $sshport" | sudo tee -a $sshconfig
    #This will replace the current port in the SSH config to the user input
    sudo sed -i "s/.*Port .*/Port $sshport/" $sshconfig
}

fail2bansetup(){
    sudo apt install fail2ban -y
    sudo cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
    sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
    sudo systemctl start fail2ban
    sudo systemctl enable fail2ban
}

fail2banwhitelist(){
    read -p "Enter your WAN IP (Find it here: https://duckduckgo.com/?q=ip ): " whitelistip
    sudo fail2ban-client set sshd addignoreip $whitelistip
}

ufwsetup(){
    sudo apt install ufw -y
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw allow $sshport/tcp
}

ufwportsetup(){
    echo "The SSH port default or custom has been allowed on the firewall."
    read -p "Please enter the port you would like to allow incomming: " porttoallow
    sudo ufw allow $porttoallow
    read -p "Would you like to add another port? (y/n) " additionalports
}

disableicmp(){
    sudo sed -i '/ufw-before-input.*icmp/s/ACCEPT/DROP/g' /etc/ufw/before.rules
    echo "- ICMP now disabled -"
}

restartservices() {
    sudo systemctl restart ssh
    sudo ufw enable
    sudo ufw reload
    sudo ufw status
}

#Intro
echo 'OneStopSecurity'
echo 'Lets get started, there is no time to waste!'
echo
echo '--------Update and Upgrade--------'
read -p "Before we start, do you want to update all packages? (update, upgrade, dist-upgrade, autoremove, autoclean, updatedb, mlocate) (y/n): " updateanswer
 
if [ "$updateanswer" != "${updateanswer#[Yy]}" ]; then
    update
    housekeeping
    echo 
    echo "- Update Complete! -"
    echo 
fi

echo 
echo '--------New User--------'
echo 'It is highly recommended not to use the root user. It is suggested that you use a sudo user instead.'
read -p "Do you want to create a new user? (y/n): " newuseranswer
if [ "$newuseranswer" != "${newuseranswer#[Yy]}" ]; 
    then
    newuser
fi

echo 
echo '--------SSH--------'
echo 'To reduce the risk of automated (bot) attacks, it is good practice to change the SSH port from 22.'
read -p "Do you want to change the SSH port? (y/n): " sshanswer

if [ "$sshanswer" != "${sshanswer#[Yy]}" ]; then

    #This makes sure that the SSH config file is valid
    if [ -f "$sshconfig" ]; then
        echo "SSH config found."
        changesshport
    else
        echo "Error, ssh config file was not found. It is expected be to located at $sshconfig '"
    fi

fi

echo 
echo '--------Fail2ban--------'
echo 'Fail2Ban is an intrusion prevention software framework that protects computer servers from brute-force attacks. - https://www.fail2ban.org'
read -p "Do you want to install Fail2ban? (y/n): " fail2bananswer

if [ "$fail2bananswer" != "${fail2bananswer#[Yy]}" ]; 
    then
    fail2bansetup
fi

echo 
    read -p "Would you like to whitelist an IP on fail2ban (y/n): " fail2banwhitelistanswer
    if [ "$fail2banwhitelistanswer" != "${fail2banwhitelistanswer#[Yy]}" ]; 
        then
        fail2banwhitelist
    fi

echo 
echo '--------UFW Firewall--------'
echo 'UFW (Uncomplicated Firewall) is a popular firewall software for blocking ports on your server'
echo 'More info can be found here https://en.wikipedia.org/wiki/Uncomplicated_Firewall and here https://www.linux.com/training-tutorials/introduction-uncomplicated-firewall-ufw/'
echo 'This is setup to block everything incomming by default (You can allow ports via this program) and allow everything outgoing'
read -p "Do you want to install UFW? (y/n): " ufwanswer

if [ "$ufwanswer" != "${ufwanswer#[Yy]}" ]; 
    then
    ufwsetup
fi

echo
read -p "Would you like to allow any additional ports? (y/n): " additionalports
while [ "$additionalports" != "${additionalports#[Yy]}" ]; 
    do
    ufwportsetup
done

read -p "Would you like to disable ICMP traffic (You will not be able to ping this server) (y/n): " disableicmpanswer
if [ "$disableicmpanswer" != "${disableicmpanswer#[Yy]}" ]; 
    then
    disableicmp
fi

echo
echo '--------Unattended Upgrades--------'
echo 'The purpose of unattended-upgrades is to keep the computer current with the latest security (and other) updates automatically. '
read -p "Would you like to install unattended-upgrades? (y/n): " unattendedupgradesanswer

if [ "$unattendedupgradesanswer" != "${unattendedupgradesanswer#[Yy]}" ]; 
    then
    sudo apt install unattended-upgrades -y
fi

if [ "$sshanswer" != "${sshanswer#[Yy]}" ]; 
    then
    echo "Please now SSH to your server over port $sshport"

fi

echo "----------------------"
echo "Thanks for using OneStopSecurity"
echo "Please give this a star on GitHub if you found it useful - https://github.com/andrewkliskey/onestopsecurity"
echo "----------------------"
