## Bespike Server Installer! 🚀

## This is opened as a public beta - all features are not final!

All in one installer for your server needs.

**Bespike Server Installer!** Automates most of the tedious tasks.

## TOC

- [Installation](#-installation)
- [Usage](#-usage)

## 💾 Installation

Installation:

Requires a fresh Debain 10 installation with sudo and curl installed.

Login as root and run
```
apt-get update && apt-get -y install sudo curl
```
Then run as root
```
curl https://raw.githubusercontent.com/bespike/Bespike-Installer/master/bootstrap.sh | bash
```

or Login as a user that can use sudo and run
```
curl https://raw.githubusercontent.com/bespike/Bespike-Installer/master/bootstrap.sh | sudo bash
```

Update:

When a new release is made public updating is as simple as running the same command as above.

```
curl https://raw.githubusercontent.com/bespike/Bespike-Installer/master/bootstrap.sh | sudo bash
```


## ▶️ Usage

You may run the installer under root or an existing account. If you already have a user account created on your server that account must already be part of the sudo group.

If you are running as root the installer will prompt you to create a new account.

After creating the new user account or updating your existing account, you MUST reboot the machine in order for the accounts permissions to be updated properly.

After rebooting the server to your user to start the installer type:
```
bespikeinstall
```