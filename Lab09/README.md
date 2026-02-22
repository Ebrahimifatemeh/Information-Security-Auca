# Lab 09 – Package Management

## Environment
- OS: Windows
- Terminal: Git Bash
- Package Manager: APT (Debian/Ubuntu – theoretical usage)

## What is a Package
A package in Linux is a collection of executable files, libraries, configuration files, and metadata that together provide a software application.

## Common Package Formats
- .deb (Debian/Ubuntu)
- .rpm (Red Hat based systems)
- .tar.gz (source packages)

## Package Manager
APT (Advanced Package Tool) is used in Debian-based systems to install, update, remove, and manage software packages while handling dependencies automatically.

## Common APT Commands

### Update package list
sudo apt update

### Upgrade installed packages
sudo apt upgrade

### Install a package
sudo apt install nginx

### Remove a package
sudo apt remove nginx

### Search for a package
sudo apt search nginx

### Show dependencies
apt-cache depends nginx

## Example: nginx Installation

1. Update repository list:
sudo apt update

2. Install nginx:
sudo apt install nginx

3. Check nginx status:
nginx -v

4. Remove nginx:
sudo apt remove nginx

## Conclusion
This lab demonstrates the concept of package management in Linux using APT and shows how nginx can be installed, explored, and removed.
