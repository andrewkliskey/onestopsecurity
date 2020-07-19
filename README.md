# OneStopSecurity

What can the program do?
  - Update server (update, upgrade, dist-upgrade, autoremove, autoclean, updatedb)
  - Change SSH Port 
  - Install Fail2ban
  - Whitelist your IP on Fail2Ban
  - Install UFW Firewall (Deny Incoming/Allow Outgoing)
  - Choose Ports to allow incoming connections from
  - Install unattended-upgrades

How to run:
Download the script, adjust permissions and run:
```bash
curl -O https://raw.githubusercontent.com/andrewkliskey/onestopsecurity/master/onestopsecurity.sh
chmod +x onestopsecurity.sh
./onestopsecurity.sh
```

Has been tested on Ubuntu 20.04

If you would like any additional features please submit an Issue or Pull request.