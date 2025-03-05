HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

setopt autocd beep

zstyle :compinstall filename '/home/pxr/.zshrc'

autoload -Uz compinit
compinit

# alias
alias ls="eza --color=auto"
alias la="eza -a"
alias ll="eza -la"
alias nf="fastfetch --config ~/.config/fastfetch/config-compact.jsonc"
alias vim="nvim"
alias code="code --disable-gpu"
alias cls="clear"
alias ff="fzf"
alias air='$(go env GOPATH)/bin/air'
alias edit-zsh="nvim ~/.zshrc"
alias edit-posh="nvim ~/.config/omp/tokyo.omp.json"
alias edit-kitty="nvim ~/.config/kitty/kitty.conf"
alias edit-ghostty="nvim ~/.config/ghostty/config"
alias edit-nf="nvim ~/.config/fastfetch/config-compact.jsonc"
alias edit-rofi="nvim ~/.config/rofi/master-config.rasi"
alias goto-nvim="cd ~/.config/nvim/lua/"
alias goto-rofi="cd ~/.config/rofi/"
alias goto-hypr="cd ~/.config/hypr/"
alias fsize="sudo du -xsh --exclude=/{proc,sys,dev,run} * | sort -h"
alias fsizeall="sudo du -xh --exclude=/{proc,sys,dev,run} * | sort -h"

# binds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word
bindkey "^[[3~" delete-char

# env
export CODE="$HOME/Documents/code"
export WLR_NO_HARDWARE_CURSORS=1
export FZF_DEFAULT_OPTS='--height 50% --layout reverse --border --preview "bat --color=always --style=numbers --line-range=:500 {}"'
export FZF_CTRL_R_OPTS='--preview ""'
export JAVA_HOME="$HOME/.jdks/corretto-18.0.2"
export PATH=/home/pxr/.local/bin:$PATH
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH=/home/pxr/flutter:$PATH

# plugins
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/omp/tokyo.omp.json)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# fzf
source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zle     -N            fzf-file-widget
bindkey -M emacs '^f' fzf-file-widget
bindkey -M vicmd '^f' fzf-file-widget
bindkey -M viins '^f' fzf-file-widget

alias cfg='/usr/bin/git --git-dir=/home/pxr/.cfg/ --work-tree=/home/pxr'

# bun completions
[ -s "/home/pxr/.bun/_bun" ] && source "/home/pxr/.bun/_bun"
export PATH="/home/pxr/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/pxr/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
