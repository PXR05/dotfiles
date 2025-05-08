# === ZSH Basic Settings ===
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

setopt autocd beep

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# === Key Bindings ===
bindkey "^[[1;5C" forward-word  # Ctrl + Right arrow
bindkey "^[[1;5D" backward-word # Ctrl + Left arrow
bindkey '^H' backward-kill-word # Ctrl + Backspace
bindkey "^[[3~" delete-char     # Delete key

# === Environment Variables ===
# Directories
export CODE="$HOME/Documents/code"

# System settings
export WLR_NO_HARDWARE_CURSORS=1

# FZF settings
export FZF_DEFAULT_OPTS='--height 50% --layout reverse --border --preview "bat --color=always --style=numbers --line-range=:500 {}"'
export FZF_CTRL_R_OPTS='--preview ""'

# Path configuration
export PATH=$HOME/.local/bin:$PATH
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="$HOME/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# Development environments
export JAVA_HOME="$HOME/.jdks/corretto-18.0.2"

# === Aliases ===
# File operations
alias ls="eza --color=auto"
alias la="eza -a"
alias ll="eza -la"
alias fsize="sudo du -xsh --exclude=/{proc,sys,dev,run} * | sort -h"
alias fsizeall="sudo du -xh --exclude=/{proc,sys,dev,run} * | sort -h"

# Applications
alias vim="nvim"
alias c="code"
alias z="zeditor"
alias code="code --disable-gpu"
alias cls="clear"
alias ff="fzf"
alias nf="fastfetch --config ~/.config/fastfetch/config-compact.jsonc"
alias air='$(go env GOPATH)/bin/air'
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Config editing shortcuts
alias edit-zsh="nvim ~/.zshrc"
alias edit-posh="nvim ~/.config/omp/tokyo.omp.json"
alias edit-kitty="nvim ~/.config/kitty/kitty.conf"
alias edit-ghostty="nvim ~/.config/ghostty/config"
alias edit-nf="nvim ~/.config/fastfetch/config-compact.jsonc"
alias edit-rofi="nvim ~/.config/rofi/master-config.rasi"

# Directory navigation shortcuts
alias goto-code="cd ~/Documents/code/"
alias goto-nvim="cd ~/.config/nvim/lua/"
alias goto-rofi="cd ~/.config/rofi/"
alias goto-hypr="cd ~/.config/hypr/"

# Github shortcuts
alias gclone="git clone"
alias gpull="git pull"
alias gpush="git push"
alias gstat="git status"
alias gadd="git add"
alias gcomm="git commit"
alias gbranch="git branch"
alias gco="git checkout"
alias glog="git log --oneline --graph --decorate --all"
alias gstash="git stash"
alias gpop="git stash pop"
alias grs="git reset --soft HEAD~1"
alias grm="git reset --mixed HEAD~1"
alias grh="git reset --hard HEAD~1"
function lazyg() {
    git add . && git commit -m "$1" && git push
}

# === External Tools & Plugins ===
# ZSH plugins
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/omp/tokyo.omp.json)"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# FZF
source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zle -N fzf-file-widget
bindkey -M emacs '^f' fzf-file-widget
bindkey -M vicmd '^f' fzf-file-widget
bindkey -M viins '^f' fzf-file-widget
