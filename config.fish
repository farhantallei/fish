### =====================================================
### Environment Variables
### =====================================================

# Bun
set -x BUN_INSTALL $HOME/.bun

# Go
set -x GOPATH $HOME/go

# Editors
set -x EDITOR nvim
set -x VISUAL nvim

# Tcl/Tk
set -x TK_LIBRARY /opt/homebrew/opt/tcl-tk/lib/tcl9.0
set -x TCL_LIBRARY /opt/homebrew/opt/tcl-tk/lib/tcl9.0

### =====================================================
### Options
### =====================================================

set -g fish_greeting ""

### =====================================================
### PATH (fish way, urut & aman)
### =====================================================

fish_add_path \
    /opt/homebrew/bin \
    /opt/homebrew/sbin \
    /opt/homebrew/opt/libpq/bin \
    /opt/homebrew/opt/postgresql@16/bin \
    /opt/homebrew/opt/tcl-tk/bin \
    $HOME/.console-ninja/.bin \
    $HOME/.opencode/bin \
    $HOME/.local/bin \
    $HOME/gh/bin \
    $HOME/go/bin \
    $HOME/.cargo/bin \
    $BUN_INSTALL/bin \
    $HOME/nvim-macos-arm64/bin

### =====================================================
### Load Tools
### =====================================================

# Zoxide
zoxide init fish | source

# fnm (Node.js)
fnm env --use-on-cd | source

# direnv
direnv hook fish | source

# prompt starship
starship init fish | source

### =====================================================
### Aliases
### =====================================================

# Python
alias python python3
alias pip pip3

# Neovim
alias v nvim
alias vi nvim
# alias vim nvim

# SSH
alias s sshs

# BTOP
alias b btop

# Reload
alias sf 'exec fish'

# Custom Neovim shortcuts
alias vz 'nvim ~/.zshrc'
alias vt 'nvim ~/.tmux.conf'
alias vs 'nvim ~/.ssh/config'
alias vy 'nvim ~/.config/yazi'

# Exit all
# alias qa 'tmux kill-server; exit'

# Project
alias b2qf "$HOME/myproj/rust/b2qf/target/release/b2qf"

### =====================================================
### Functions
### =====================================================

# tmux helper
function t
    set session main
    test (count $argv) -gt 0; and set session $argv[1]
    tmux attach -t $session; or tmux new-session -s $session
end

# yazi cd integration
function Z
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Neovim config jump
function vn
    if test (count $argv) -eq 0
        nvim ~/.config/nvim
    else
        nvim ~/.config/nvim/$argv
    end
end

function vw
    if test (count $argv) -eq 0
        nvim ~/.config/wezterm
    else
        nvim ~/.config/wezterm/$argv
    end
end

function vf
    if test (count $argv) -eq 0
        nvim ~/.config/fish
    else
        nvim ~/.config/fish/$argv
    end
end

# Exit all
function qa
    if set -q TMUX
        tmux kill-server
    end
    exit
end

### =====================================================
### Keybindings
### =====================================================

# Alt + b / f
bind \eb backward-word
bind \ef forward-word

# History search (arrow up/down)
bind \e\[A history-search-backward
bind \e\[B history-search-forward

### =====================================================
### SESSION TMUX
### =====================================================

set session main
if test (count $argv) -gt 0
    set session $argv[1]
end

if not set -q TMUX
    tmux attach -t $session 2>/dev/null
    or tmux new-session -s $session
end

### =====================================================
### FASTFETCH
### =====================================================

if status --is-interactive
    fastfetch
end
