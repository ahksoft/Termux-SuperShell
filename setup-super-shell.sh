#!/data/data/com.termux/files/usr/bin/bash
# One-click Termux Super Shell Poweed by Zsh, Powerlevel10k, colors, and fixed MOTD
# Author: AHK Soft

set -e

echo "📦 Updating Termux packages..."
pkg update -y && pkg upgrade -y
pkg install zsh git curl wget nano fzf fd zoxide bat prover9 eza termux-api jq -y

echo "💡 Installing Oh-My-Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Download .aliases
echo "📥 Downloading .aliases..."
curl -fsSL https://raw.githubusercontent.com/ahksoft/ahk-termux-desktop/f7c1e118e70bdd5d89f6aba0979aed97d2727ada/other/.aliases -o ~/.aliases

# Install Zinit
ZINIT_HOME="$HOME/.local/share/zinit"
mkdir -p "$ZINIT_HOME"
if [ ! -d "$ZINIT_HOME/zinit.git" ]; then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME/zinit.git"
fi

# Download Termux color files
echo "🎨 Downloading Termux color files..."
TERMUX_COLORS="$HOME/.termux-colors"
mkdir -p "$TERMUX_COLORS"
curl -fsSL https://raw.githubusercontent.com/ahksoft/ahk-termux-desktop/f7c1e118e70bdd5d89f6aba0979aed97d2727ada/other/termux-color -o "$TERMUX_COLORS/termux-color"
curl -fsSL https://raw.githubusercontent.com/ahksoft/ahk-termux-desktop/f7c1e118e70bdd5d89f6aba0979aed97d2727ada/other/colors.properties -o "$TERMUX_COLORS/colors.properties"
curl -fsSL https://raw.githubusercontent.com/ahksoft/ahk-termux-desktop/f7c1e118e70bdd5d89f6aba0979aed97d2727ada/other/termux.properties -o "$TERMUX_COLORS/termux.properties"

# Download fixed MOTD script (original structure kept)
echo "🖌️ Downloading MOTD banner..."
mkdir -p "$HOME/.termux"
curl -fsSL https://raw.githubusercontent.com/ahksoft/ahk-termux-desktop/f7c1e118e70bdd5d89f6aba0979aed97d2727ada/other/motd.sh -o "$HOME/.termux/motd.sh"

# Fix battery/temperature inside motd.sh using termux-battery-status
sed -i '/Battery info/,+3d' "$HOME/.termux/motd.sh"
cat >> "$HOME/.termux/motd.sh" << 'EOF'

# Battery info fix
if command -v termux-battery-status >/dev/null 2>&1; then
    BAT=$(termux-battery-status)
    LEVEL=$(echo "$BAT" | grep -oP '"percentage":\s*\K[0-9]+')
    TEMP=$(echo "$BAT" | grep -oP '"temperature":\s*\K[0-9]+')
    echo "🔋 Battery: $LEVEL% | 🌡️ Temp: ${TEMP}°C"
else
    echo "🔋 Battery info not available. Install termux-api."
fi
EOF

chmod +x "$HOME/.termux/motd.sh"

# ---------------------
# APPLY TERMUX COLORS & MOTD SAFELY
# ---------------------
echo "🎨 Applying Termux colors and MOTD..."
mkdir -p "$HOME/.termux"
chmod +x "$TERMUX_COLORS/termux-color"
cp "$TERMUX_COLORS/colors.properties" "$HOME/.termux/colors.properties" 2>/dev/null || true
cp "$TERMUX_COLORS/termux.properties" "$HOME/.termux/termux.properties" 2>/dev/null || true

"$TERMUX_COLORS/termux-color" || echo "[WARNING] Could not run termux-color. Run manually."
"$HOME/.termux/motd.sh" || echo "[WARNING] Could not run MOTD. Run manually."

# ---------------------
# WRITE .ZSHRC
# ---------------------
echo "⚙️ Writing .zshrc..."
cat > ~/.zshrc << 'EOF'
#!/usr/bin/env zsh

# ---------------------
# ENVIRONMENT VARIABLES
# ---------------------
export EDITOR="nvim"
export VISUAL="nvim"
export BAT_PAGER="less"
export LS="eza"
setopt AUTO_CD
setopt nonomatch

# Load aliases
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# ---------------------
# ZINIT CONFIGURATION
# ---------------------
typeset -gAH ZINIT
ZINIT[HOME_DIR]="$HOME/.local/share/zinit"
ZINIT[BIN_DIR]="$ZINIT[HOME_DIR]/zinit.git"
ZINIT[COMPLETIONS_DIR]="$ZINIT[HOME_DIR]/completions"
ZINIT[SNIPPETS_DIR]="$ZINIT[HOME_DIR]/snippets"
ZINIT[ZCOMPDUMP_PATH]="$ZINIT[HOME_DIR]/zcompdump"
ZINIT[PLUGINS_DIR]="$ZINIT[HOME_DIR]/plugins"
ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]=1

[ -f "$ZINIT[BIN_DIR]/zinit.zsh" ] && source "$ZINIT[BIN_DIR]/zinit.zsh"

# Plugins
zi light zsh-users/zsh-completions
zi ice atload'_zsh_autosuggest_start' atinit'ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50; bindkey "^_" autosuggest-execute; bindkey "^ " autosuggest-accept'
zi light zsh-users/zsh-autosuggestions
zi light zdharma-continuum/fast-syntax-highlighting
zi light joshskidmore/zsh-fzf-history-search
zi ice atload'bindkey "^I" menu-select; bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete'
zi light marlonrichert/zsh-autocomplete
zi light romkatv/powerlevel10k

# ---------------------
# ENABLE COMPLETION
# ---------------------
autoload -Uz compinit
compinit

# Smart cd/./ completion
zstyle ':completion:*:*:cd:*' tag-order directories
function _local_execs() {
  compadd $(find . -maxdepth 1 -type f -executable 2>/dev/null)
}
compdef _local_execs ./
bindkey '^I' expand-or-complete

# ---------------------
# AUTO SUGGESTIONS
# ---------------------
_all_cmds_file="$HOME/.all_commands"
compgen -c | sort -u > $_all_cmds_file
[ -f "$HOME/.aliases" ] && alias | awk -F'[ =]' '{print $2}' >> $_all_cmds_file
autoload -U add-zsh-hook
function zsh_suggest_all_commands() {
    local cur="${BUFFER}"
    BUFFER=$(compgen -W "$(cat $_all_cmds_file)" -- "$cur")
}
add-zsh-hook preexec zsh_suggest_all_commands

# ---------------------
# POWERLEVEL10K THEME
# ---------------------
if [[ ! -f ~/.p10k.zsh ]]; then
    echo "💡 Powerlevel10k not configured. Starting wizard..."
    autoload -Uz promptinit
    promptinit
    if [[ $- == *i* ]]; then
        p10k configure
    fi
else
    source ~/.p10k.zsh
fi

function set_10k_theme() {
    echo "💡 Resetting Powerlevel10k theme..."
    rm -f ~/.p10k.zsh
    echo "✅ Theme reset. Restart Zsh to run configuration wizard."
}

# ---------------------
# TERMUX COLOR FUNCTION
# ---------------------
function set_termux_colors() {
    echo "🎨 Applying Termux colors..."
    TERMUX_DIR="$HOME/.termux-colors"
    mkdir -p "$HOME/.termux"
    cp "$TERMUX_DIR/colors.properties" "$HOME/.termux/colors.properties" 2>/dev/null || true
    cp "$TERMUX_DIR/termux.properties" "$HOME/.termux/termux.properties" 2>/dev/null || true
    chmod +x "$TERMUX_DIR/termux-color"
    "$TERMUX_DIR/termux-color"
    "$HOME/.termux/motd.sh"
    echo "✅ Termux colors and MOTD applied. Restart Termux to see changes."
}

# ---------------------
# AUTO-INSTALL MISSING COMMANDS
# ---------------------
function command_not_found_handler() {
    if [[ $1 != "sudo" ]]; then
        pkg_name=$(pkg search -f "^$1\$" | head -n1 | awk '{print $1}')
        if [[ -n $pkg_name ]]; then
            echo "[INFO] Command '$1' not found. Installing package: $pkg_name"
            pkg install -y $pkg_name
        else
            echo "[ERROR] Command '$1' not found and no package detected."
        fi
    fi
}
EOF

echo "🔄 Changing default shell to zsh..."
chsh -s zsh

echo "✅ Complete Termux setup finished!"
echo "💡 First Zsh launch will run Powerlevel10k wizard."
echo "💡 Restart Termux or run "zsh" for complete instaltion."
