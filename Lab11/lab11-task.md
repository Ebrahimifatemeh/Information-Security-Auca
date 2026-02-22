# Lab 11 – Task: Installing Utilities from Source

## Utility Chosen: neofetch

Neofetch is a lightweight command-line utility that displays system information
such as OS, kernel, uptime, CPU, memory usage, and shell in a clean ASCII format.

---

## Installation from Source (Git-based)

### 1. Install dependencies
```bash
sudo apt update
sudo apt install git make


2. Clone the repository
git clone https://github.com/dylanaraps/neofetch.git


3. Navigate into the project directory
cd neofetch


4. Build and install
sudo make install

The Makefile copies the neofetch script to /usr/local/bin, making it available
system-wide.

Verification
neofetch

Expected result:

ASCII logo of the operating system


System information (OS, kernel, uptime, CPU, RAM, shell)

---
