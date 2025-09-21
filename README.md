
# 🚀 Termux Super Shell

![Shell](https://img.shields.io/badge/Shell-Zsh-blue?logo=gnu-bash&logoColor=white)
![Theme](https://img.shields.io/badge/Theme-Powerlevel10k-purple?logo=starship&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Termux-orange?logo=android&logoColor=white)
![Last Update](https://img.shields.io/github/last-commit/ahksoft/ahk-termux-desktop?label=Last%20Update)

A complete Zsh-based power setup for Termux with **autosuggestions, syntax highlighting, Powerlevel10k theme, custom colors, and MOTD banner** — all in a single one-click install.


## 🛠️ Installation

Run this command inside Termux:

```bash
curl -fsSL https://raw.githubusercontent.com/ahksoft/Termux-SuperShell/code/setup-super-shell.sh | bash
```


---
## ✨ Features

⚡ Custom shell Powered by Zsh – modern, fast, and flexible shell setup

🎨 Powerlevel10k theme – beautiful and customizable prompt

🔮 Autosuggestions & Highlighting – intelligent command hints and syntax colors

🗂️ Enhanced completions – smarter and richer tab completion

🎛️ Custom Termux colors & properties – optimized color scheme and config

📢 Custom MOTD banner – greeting with system info, battery level & temperature.

---


## 🌟 Benefits

✅ Faster and more productive terminal experience

✅ Beautiful, modern look with Powerlevel10k

✅ Smarter command-line with autosuggestions & autocomplete

✅ Easier navigation with directory and command hints

✅ Always see your battery level and temperature right in the banner

✅ Fully automated installation — no manual steps required


---


## 📖 User Guide

After installation, restart Termux or run:
```
zsh
```
. You’ll notice:

1. New Shell – Zsh with Powerlevel10k will launch.

If the Powerlevel10k wizard doesn’t start automatically, run:
```
p10k configure
```

Follow the interactive setup to choose your prompt style.



2. Autosuggestions – Start typing a command and press

---
←↑↓→ Arrow key to accept/select the suggestion.
---





3. Syntax Highlighting – Commands turn green if valid, red if invalid.



4. Custom Colors & MOTD

Termux colors are applied automatically.

On startup, a custom MOTD banner shows system info, battery percentage and temperature.


---



## 📸 Screenshots

> Upload your screenshots to the repo (e.g., /images/) or GitHub issues/wiki, then update the paths below.



🖥️ Terminal with Powerlevel10k



🔋 MOTD with Battery & Temperature



🎨 Termux Colors Applied


---


## ⚡ Troubleshooting

No zi command found – Run installation again, or check if ~/.zinit was created.

Powerlevel10k not applied – Run: 
```
p10k configure
```

Battery/temperature not shown – Install termux-api:

```
pkg install termux-api
```


---

## 📜 License

MIT License © 2025 AHK Soft
---

