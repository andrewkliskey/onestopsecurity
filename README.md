# OneStopSecurity

### What can OneStopSecurity do?
  - Update server (update, upgrade, dist-upgrade, autoremove, autoclean, updatedb)
  - Change SSH Port 
  - Install Fail2ban
  - Whitelist your IP on Fail2Ban
  - Install UFW Firewall (Deny Incoming/Allow Outgoing)
  - Choose Ports to allow incoming connections from
  - Install unattended-upgrades

### Take a think:
Please think before installing any software on your server.
Do you need it?
Is it rated highly?
Could it be installing malware?

Personally I would't trust a random script on the internet. So I understand if you don't, as this is only 150 lines of code I suggest that you take a look and ensure it is something you want to run on your server.


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

Allow users to change the SSH port more than once (currently running it twice will open both ports up for SSH).
  
  
  

If you would like any additional features please submit an Issue or Pull request.
