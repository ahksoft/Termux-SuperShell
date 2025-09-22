---

# 🐧 Super Shell – Linux Installation Guide

Super Shell is a modern Zsh environment powered by **Zsh**, **Powerlevel10k**, and **MesloLGS NF Nerd Font**.  
It provides an advanced developer shell with autosuggestions, completions, history search, and a beautiful prompt.

---

## ⚡ Features
- 🚀 Zsh with plugin management
- 🎨 Powerlevel10k theme (with **MesloLGS NF** font for proper icons)
- ⌨️ Autosuggestions, syntax highlighting, autocomplete
- 🗂️ Aliases from `.aliases` file
- 🔍 Fzf-powered history search
- 📂 Smart `cd` and `./` command completion
- 🛠️ Safe package installation for Debian/Ubuntu, Fedora, and Arch-based systems

---

## 📦 Requirements
- A Linux system with `apt`, `dnf`, or `pacman`
- Internet connection
- A terminal that allows changing fonts

---

## 🔧 Installation

Run this if sudo/curl not installed:
```
apt update && apt install sudo -y && apt install curl -y
```

Run the following command to install Super Shell:

```bash
curl -fsSL https://raw.githubusercontent.com/ahksoft/Termux-SuperShell/code/linux-super-shell.sh -o ~/linux-super-shell.sh && chmod +x ~/linux-super-shell.sh && bash ~/linux-super-shell.sh
```
This script will:

1. Install required packages (zsh, git, curl, fzf, etc.)


2. Install MesloLGS NF Nerd Font


3. Install Oh-My-Zsh


4. Configure Powerlevel10k automatically


5. If get error like 
**[INFO] Command 'eza' not found. Install manually.**
But when you try to install eza, get another error
**E: Unable to locate package eza**
eza is not typically found in the default Ubuntu repositories, so you need to add a third-party repository.
To install the eza repository run:
```
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo tee /etc/apt/trusted.gpg.d/gierens.asc
    echo "deb http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
```
Then run:
```
sudo apt update && sudo apt install -y eza
```
After installation, you can verify it by running:
```
eza --version
```
---

🎨 Font Setup

Super Shell requires the MesloLGS NF font to properly display icons.
The installer automatically downloads the following fonts to ~/.local/share/fonts:

MesloLGS NF Regular.ttf

MesloLGS NF Bold.ttf

MesloLGS NF Italic.ttf

MesloLGS NF Bold Italic.ttf


👉 After installation, set your terminal font to MesloLGS NF.


---

⚙️ Usage

First time you start a new zsh session, the Powerlevel10k wizard will run:

Choose prompt style, icons, colors, and features

Config saved in ~/.p10k.zsh


To reconfigure later:

```
p10k configure
```

To reset Powerlevel10k theme:

```
set_10k_theme
```

---

🛠️ Updating

To update Super Shell, simply pull the latest script and re-run:

```
bash linux-super-shell.sh
```

---

📂 Files Created

~/.aliases → Your global aliases

~/.zshrc → Main shell config

~/.p10k.zsh → Powerlevel10k theme config

~/.local/share/fonts/ → MesloLGS NF font files

~/.local/share/zinit/ → Zinit plugins



---

✅ Tested On

Ubuntu 20.04 / 22.04

Fedora 38+

Arch Linux



---

📜 License

MIT © AHK Soft


---
