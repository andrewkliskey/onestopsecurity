# OneStopSecurity

The plan for OneStopSecurity is to have a single program that can setup the security aspect of your server in 5 minutes rather than 45.

![](https://github.com/andrewkliskey/OneStopSecurity/workflows/shellcheck/badge.svg)

### What can OneStopSecurity do?

- Updates server (update, upgrade, dist-upgrade, autoremove, autoclean, updatedb, mlocate)
- Create sudo user
- Change SSH Port
- Disable root SSH Login
- Install Fail2ban
- Whitelist your IP on Fail2Ban
- Install UFW Firewall (Deny Incoming/Allow Outgoing)
- Choose Ports to allow incoming connections from
- Disable ICMP traffic
- Install unattended-upgrades

### Take a think

- Please think before installing any software on your server:
  - Do you need it? 🍞
  - Is it rated highly? ⭐️
  - Could it be installing malware? 😈

Personally I would't trust a random script on the internet 🌐  so I understand if you don't. \
As this is only 150 lines of code I suggest that you take a look and ensure it is something you want to run on your server.

### How to run

Download the script, adjust permissions and run:
```bash
wget https://raw.githubusercontent.com/andrewkliskey/onestopsecurity/master/onestopsecurity.sh
chmod +x onestopsecurity.sh
./onestopsecurity.sh
```
Oneliner:
```bash
wget -O - https://raw.githubusercontent.com/andrewkliskey/onestopsecurity/master/onestopsecurity.sh | bash
```

### OneStopSecurity has been tested on:

| Operating System | Supported? |
| ---------------- | ---------- |
| Ubuntu 20.04     | ✅         |
| Ubuntu 18.04     | ✅         |
| Debian 10.3      | ✅         |
| Debian 9.12      | ✅         |

### To-do

  - [ ] Add validation to user inputs
  - [ ] Adjust the Fail2ban config
  - [X] Disable ICMP traffic via UFW 
  - [X] Add Continuous Integration with Github Actions
  - [x] SSH Port bug fix (Changing the SSH port twice would open up both ports for SSH)
  - [x] Disable SSH root access.
  
### Contributions

If you would like any additional features please submit an Issue or Pull request.

A special thanks to the contributors \
<a href="https://github.com/andrewkliskey/OneStopSecurity/graphs/contributors">
  <img alt="Made with contributors-img https://contributors-img.web.app" src="https://contributors-img.web.app/image?repo=andrewkliskey/OneStopSecurity" />
</a>
