# OneStopSecurity

### What can OneStopSecurity do?
  - Update server (update, upgrade, dist-upgrade, autoremove, autoclean, updatedb)
  - Change SSH Port 
  - Install Fail2ban
  - Whitelist your IP on Fail2Ban
  - Install UFW Firewall (Deny Incoming/Allow Outgoing)
  - Choose Ports to allow incoming connections from
  - Install unattended-upgrades

### How to run:
Download the script, adjust permissions and run:
```bash
wget https://raw.githubusercontent.com/andrewkliskey/onestopsecurity/master/onestopsecurity.sh
chmod +x onestopsecurity.sh
./onestopsecurity.sh
```

### OneStopSecurity has been tested on:
  - Ubuntu 20.04
  - Ubuntu 18.04
  - Debian 10.3
  - Debian 9.12

### To-do

Disable SSH root access.
This can be done manually by adding a # infront of "PermitRootLogin yes" within the SSH config file (/etc/ssh/sshd_config).

Add validation to user inputs

Adjust the Fail2ban config
  
  
  

If you would like any additional features please submit an Issue or Pull request.
