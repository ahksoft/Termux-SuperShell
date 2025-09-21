---

Termux Super Shell

A powerful, feature-rich shell environment for Termux on Android.


---


## 🛠️ Installation

Run the following command in Termux:

```bash
curl -fsSL https://raw.githubusercontent.com/ahksoft/ahk-termux-desktop/main/setup-termux-complete.sh | bash
This one-click script install Termux Super Shell automatically.


---

🚀 Features

Zsh Shell: Modern, user-friendly shell with advanced features.

Powerlevel10k Theme: Fast, highly customizable prompt for Zsh.

Oh My Zsh: Framework for managing Zsh configuration.

Syntax Highlighting: Real-time command syntax validation.

Auto-suggestions: Predicts commands as you type.

Fuzzy Finder: Quickly search through command history.

Smart Completion: Intelligent tab completion for directories & executables.

MOTD with System info, Battery & Temperature: Displays all system info at startup.

Termux Color Scheme: Custom color settings for better aesthetics.

Custom Aliases: Predefined shortcuts for common commands.

One-Click Setup: Install & configure everything with a single command.



---

🎯 Benefits

Enhanced Productivity: Faster navigation, intelligent tab completion, and auto-suggestions reduce typing.

Beautiful & Functional Prompt: Powerlevel10k shows useful system info at a glance.

Better Readability: Syntax highlighting and Termux color scheme make reading commands easier.

Quick Access to History: FZF fuzzy search lets you find previous commands instantly.


Customizable: Easily tweak aliases, prompt theme, and colors to suit your workflow.

Beginner-Friendly: One-click setup installs everything automatically; no manual configuration required.



---

📸 Showcase




---

⚙️ Configuration

After installation, the script will:

Install and configure Zsh with Oh My Zsh.

Set Powerlevel10k as the default theme.

Apply the Termux color scheme.

Set up essential plugins for auto-suggestions, FZF history, and syntax highlighting.

Download and configure .aliases.


Set Zsh as the default shell.



---

📄 MOTD (Message of the Day)

The motd.sh script displays system info at startup:

Battery Level: Current battery percentage.

Temperature: Device temperature in Celsius.

System Uptime: How long the system has been running.

Memory Usage: Current RAM usage.

Disk Usage: Storage usage.

User Information: Current user and hostname.



---

🎨 Termux Color Scheme

The script applies a custom color scheme to your Termux environment, improving readability and aesthetics.


---

🧑‍💻 User Guide

1. Starting Termux Super Shell

Restart Termux or run:

exec zsh

Follow the Powerlevel10k setup wizard if it appears.


---

2. Using Aliases

View all aliases:

alias

Example:

ll      # Long listing with colors
..      # Go up one directory


---

3. Auto-Suggestions & Syntax Highlighting

Type a previous command, press → or Ctrl+Space to accept suggestions.

Commands are color-highlighted for better readability.



---

4. Fuzzy History Search

Press Ctrl+R to search your command history using fzf. Type part of a previous command and press Enter to execute it.


---

5. Smart Tab Completion

cd auto-completes directories.

Executable scripts in the current directory are suggested when you type ./.



---

6. Applying Termux Colors & MOTD

Re-apply colors or MOTD anytime:

set_termux_colors


---

7. Reset Powerlevel10k Theme

Reconfigure Powerlevel10k:

set_10k_theme

Restart Zsh:

exec zsh


---

8. Installing Missing Commands Automatically

If a command is missing, the shell may prompt to install the required package automatically.


---

9. Updating Termux Super Shell

Update scripts or plugins:

cd $HOME/.local/share/zinit
git pull

Or manually re-run the setup script.


---

🛠️ Troubleshooting

Permissions Issues: Ensure scripts are executable:


chmod +x ~/.termux/motd.sh
chmod +x ~/.termux-colors/termux-color

Missing Packages: Install manually:


pkg install <package-name>

MOTD Not Displaying: Check motd.sh is executable.
